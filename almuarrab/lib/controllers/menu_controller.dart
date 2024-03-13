import 'dart:async';
import 'dart:typed_data';
import 'package:almuarrab/constants/controllers.dart';
import 'package:almuarrab/core/base_getx_controller.dart';
import 'package:almuarrab/routing/routes.dart';
import 'package:almuarrab/utils/datbase_sql.dart';
import 'package:excel/excel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:get/get.dart';

class MenuController extends BaseGetxController {
  static MenuController instance = Get.find();
  RxInt activeItem = 0.obs;
  RxInt sousActiveItem = 0.obs;
  RxString initialRoute = ''.obs;
  RxInt hoverItem = 0.obs;

  @override
  void onInit() async {
    super.onInit();
    final bool dbIsEmpty = await DBHelper.isDatabaseEmpty();
    if (dbIsEmpty) {
      await loadExcelAndInsertData();
    }
  }

  changeActiveItemTo(int itemName) {
    activeItem.value = itemName;
  }

  Future<void> loadExcelAndInsertData() async {
    // Load the excel file from assets
    final ByteData data =
        await rootBundle.load("assets/file/almuarrabfile.xlsx");

    final excel = Excel.decodeBytes(data.buffer.asUint8List());

    // Assuming there's only one sheet and its name is known or is the first one
    var sheet = excel.tables.keys.first;
    final sheetRow = excel[sheet];
    bool isFirst = true;
    for (var row in sheetRow.rows) {
      if (isFirst) {
        isFirst = false;
        continue;
      }
      // Map the row to the corresponding database fields
      String? refrence = row[1]?.value.toString() ?? "";
      int number = 0;
      String? chapter = row[3]?.value.toString() ?? "";
      String? wordWithoutDiacritics = row[4]?.value.toString() ?? "";
      String? wordWithDiacritics = row[5]?.value.toString() ?? "";
      String? explanation = row[6]?.value.toString() ?? "";
      String? htmlText = row[7]?.value.toString() ?? "";
      String? origin = row[8]?.value.toString() ?? "";
      String? notes = row[9]?.value.toString() ?? "";
      String? pagePresence = row[10]?.value.toString() ?? "";
      Map<String, dynamic> entry = {
        "reference": refrence,
        "number": number,
        "chapter": chapter,
        "wordWithoutDiacritics": wordWithoutDiacritics,
        "wordWithDiacritics": wordWithDiacritics,
        "explanation": explanation,
        "htmlText": htmlText,
        "origin": origin,
        "notes": notes,
        "pagePresence": pagePresence
      };

      // Insert the entry into the database
      await DBHelper.insertEntry(entry);
    }
  }

  goToPage(String itemRoute, int itemIndex, BuildContext context) async {
    menuController.changeActiveItemTo(itemIndex);
    menuController.sousActiveItem.value = getRoutIndex(itemRoute);
    navigationController.navigateTo(itemRoute);
  }

  onHover(int itemName) {
    if (!isActive(itemName)) hoverItem.value = itemName;
  }

  isHovering(int itemName) => hoverItem.value == itemName;

  isActive(int itemName) => activeItem.value == itemName;

  String returnImageFor(int itemName) {
    switch (itemName) {
      case 0:
        return "assets/icons/home_icon2.png";
      case 1:
        return "assets/icons/doors_icon3.png";
      case 2:
        return "assets/icons/info_icon2.png";

      default:
        return "assets/icons/home_icon2.png";
    }
  }

  String returnImageActiveFor(int itemName) {
    switch (itemName) {
      case 0:
        return "assets/icons/home_icon.png";
      case 1:
        return "assets/icons/doors2_icon.png";
      case 2:
        return "assets/icons/info_icon.png";

      default:
        return "assets/icons/home_icon.png";
    }
  }
}
