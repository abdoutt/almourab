import 'package:almuarrab/constants/constants.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBHelper {
  static Database? _db;

  static Future<Database> get database async {
    if (_db != null) return _db!;
    _db = await initDB();
    return _db!;
  }

  static Future<Database> initDB() async {
    String path = join(await getDatabasesPath(), 'entries_database.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute('''
          CREATE TABLE entries (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            reference TEXT,
            number INTEGER,
            chapter TEXT,
            wordWithoutDiacritics TEXT,
            wordWithDiacritics TEXT,
            explanation TEXT,
            htmlText TEXT,
            origin TEXT,
            pagePresence TEXT
          )
        ''');
      },
    );
  }

  static Future<void> insertEntry(Map<String, dynamic> row) async {
    final db = await database;
    await db.insert('entries', row,
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  static Future<bool> isDatabaseEmpty() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('entries');
    return maps.isEmpty;
  }

  static Future<List<Map<String, dynamic>>> getChaptersAndCounts() async {
    final db = await database;
    final List<Map<String, dynamic>> result = await db.rawQuery('''
      SELECT chapter, COUNT(*) as count
      FROM entries
      WHERE chapter != "null"
      GROUP BY chapter
      ORDER BY CASE chapter
        WHEN 'باب الألف' THEN 1
        WHEN 'باب الباء' THEN 2
        WHEN 'باب التاء' THEN 3
        WHEN 'باب الثاء' THEN 4
        WHEN 'باب الجيم' THEN 5
        WHEN 'باب الحاء' THEN 6
        WHEN 'باب الخاء' THEN 7
        WHEN 'باب الدال' THEN 8
        WHEN 'باب الذال' THEN 9
        WHEN 'باب الراء' THEN 10
        WHEN 'باب الزاي' THEN 11
        WHEN 'باب السين' THEN 12
        WHEN 'باب الشين' THEN 13
        WHEN 'باب الصاد' THEN 14
        WHEN 'باب الطاء' THEN 15
        WHEN 'باب العين' THEN 16
        WHEN 'باب الغين' THEN 17
        WHEN 'باب الفاء' THEN 18
        WHEN 'باب القاف' THEN 19
        WHEN 'باب الكاف' THEN 20
        WHEN 'باب اللام' THEN 21
        WHEN 'باب الميم' THEN 22
        WHEN 'باب النون' THEN 23
        WHEN 'باب الواو' THEN 24
        WHEN 'باب الهاء' THEN 25
        WHEN 'باب الياء' THEN 26
        ELSE 27
      END
    ''');
    return result;
  }

  Future<List<String>> getWordsByChapterAndOrigin(String chapter,
      [String? origin]) async {
    final db = await database;
    List<String> words = [];

    // Construct the where clause and arguments based on origin presence
    String whereClause = 'chapter = ?';
    List<dynamic> whereArgs = [chapter];

    // If origin is not null and not empty, modify the where clause and arguments to include origin
    if (origin != null && origin.isNotEmpty) {
      whereClause += ' AND origin = ?';
      whereArgs.add(origin);
    }

    // Assuming your table is named 'entries'
    List<Map<String, dynamic>> results = await db.query(
      'entries',
      columns: ['wordWithDiacritics'],
      where: whereClause,
      whereArgs: whereArgs,
    );

    for (var row in results) {
      words.add(row['wordWithDiacritics']);
    }

    return words;
  }

  Future<List<Map<String, dynamic>>> getOriginCountsByChapter(
      String chapter) async {
    final db = await database;

    // Perform a query that groups results by origin within a specific chapter and counts each group
    List<Map<String, dynamic>> originCounts = await db.rawQuery('''
      SELECT origin, COUNT(origin) AS count
      FROM entries
      WHERE origin !="null" AND origin !=" " AND chapter = ?
      GROUP BY origin
      ORDER BY count DESC;
    ''', [chapter]);

    return originCounts;
  }

  Future<int> getTotalCountByChapter(String chapter) async {
    final db = await database;
    var result = await db.rawQuery('''
      SELECT COUNT(*) AS totalCount FROM entries WHERE chapter = ?
    ''', [chapter]);
    int totalCount = Sqflite.firstIntValue(result) ?? 0;
    return totalCount;
  }

  Future<List<Map<String, dynamic>>> getDetailsByWordWithDiacritics(
      String wordWithDiacritics) async {
    final db = await database;
    List<Map<String, dynamic>> results = await db.query(
      'entries', // Assuming 'entries' is the name of your table
      columns: ['htmlText', 'pagePresence', 'explanation', 'origin'],
      where: 'wordWithDiacritics = ?',
      whereArgs: [wordWithDiacritics],
    );

    return results; // This list may contain multiple entries if the word occurs more than once with different origins
  }

  Future<List<Map<String, dynamic>>> getDetailsByWordWithOutDiacritics(
      String wordWithoutDiacritics) async {
    final db = await database;
    List<Map<String, dynamic>> results = await db.query(
      'entries', // Assuming 'entries' is the name of your table
      columns: ['htmlText', 'explanation', 'pagePresence', 'origin'],
      where: 'wordWithoutDiacritics = ?',
      whereArgs: [wordWithoutDiacritics],
    );

    return results; // This list may contain multiple entries if the word occurs more than once with different origins
  }

  Future<List<Map<String, dynamic>>> getOriginCounts() async {
    final db = await database;
    // Perform a query to count each unique origin
    List<Map<String, dynamic>> originCounts = await db.rawQuery('''
      SELECT origin, COUNT(*) as count
      FROM entries
      GROUP BY origin
      ORDER BY count DESC;
    ''');

    return originCounts;
  }

  Future<List<String>> getWordsByOrigin(String origin) async {
    final db = await database;
    List<String> words = [];

    // Query the database for words with the specified origin
    List<Map<String, dynamic>> results = await db.query(
      'entries', // Assuming your table is named 'entries'
      columns: [
        'wordWithDiacritics'
      ], // Selecting the wordWithDiacritics column
      where: 'origin = ?', // Filtering by origin
      whereArgs: [origin], // Providing the origin value
    );

    // Extracting the words from the query results
    for (var result in results) {
      words.add(result['wordWithDiacritics']);
    }

    return words;
  }

  Future<List<Map<String, dynamic>>> searchDatabase(String searchTerm) async {
    final db =
        await database; // Ensure this is your correctly initialized database object.

    // Define the columns to search and also to retrieve in the result.
    List<String> columns = [
      'chapter',
      'wordWithoutDiacritics',
      'wordWithDiacritics',
      'origin',
      'pagePresence'
    ];

    // Convert columns list into a comma-separated string for the SELECT statement.
    String columnsForSelect = columns.join(', ');

    // Prepare the query with placeholders for the WHERE clause.
    String whereClause = columns.map((column) => "$column LIKE ?").join(' OR ');

    // Prepare the arguments for the query. Each ? will be replaced by these values in order.
    List<String> whereArgs =
        List<String>.generate(columns.length, (_) => '%$searchTerm%');

    // Use rawQuery with parameterized inputs, specifying only the desired columns in the SELECT part.
    String rawQuery =
        'SELECT $columnsForSelect FROM entries WHERE $whereClause LIMIT 100';

    List<Map<String, dynamic>> results = await db.rawQuery(
      rawQuery,
      whereArgs,
    );

    return results;
  }

  Future<List<Map<String, dynamic>>> searchDatabaseFull(
      String searchTerm) async {
    final db =
        await database; // تأكد من أن هذا هو الكائن الصحيح لقاعدة البيانات

    // تطبيع مصطلح البحث
    String normalizedSearchTerm = normalizeArabic(searchTerm);

    // استرجاع جميع السجلات
    String query =
        "SELECT  chapter,wordWithoutDiacritics, wordWithDiacritics,origin,pagePresence FROM entries";
    List<Map<String, dynamic>> results = await db.rawQuery(query);

    // تطبيع البيانات وفلترتها
    List<Map<String, dynamic>> filteredResults = [];
    for (var row in results) {
      bool matches = row.entries.any((element) {
        String normalizedValue = normalizeArabic(element.value.toString());
        return normalizedValue.contains(normalizedSearchTerm);
      });
      if (matches) {
        filteredResults.add(row);
      }
    }

    return filteredResults;
  }
}
