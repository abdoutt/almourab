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
      GROUP BY chapter
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
      WHERE chapter = ?
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
      columns: ['explanation', 'pagePresence', 'origin'],
      where: 'wordWithDiacritics = ?',
      whereArgs: [wordWithDiacritics],
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
    final db = await database;

    // Define the columns to search
    List<String> columns = [
      'reference',
      'number',
      'chapter',
      'wordWithoutDiacritics',
      'wordWithDiacritics',
      'explanation',
      'origin',
      'pagePresence'
    ];

    // Prepare the query
    String query =
        columns.map((column) => "$column LIKE '%$searchTerm%'").join(' OR ');

    // Execute the query
    List<Map<String, dynamic>> results = await db.query(
      'entries',
      where: query,
    );

    return results;
  }

}
