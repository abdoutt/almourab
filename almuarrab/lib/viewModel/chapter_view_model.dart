import 'package:almuarrab/constants/controllers.dart';
import 'package:almuarrab/core/base_getx_controller.dart';
import 'package:almuarrab/utils/datbase_sql.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChapterViewModel extends BaseGetxController {
  RxList<String> wordsFuture = <String>[].obs;
  RxList<Map<String, dynamic>> wordsOrigine = <Map<String, dynamic>>[].obs;
  RxString origin = "الكل".obs;
  RouteArguments? args;
  setContext(BuildContext cont) async {
    args = ModalRoute.of(cont)!.settings.arguments as RouteArguments;
    if (args == null) {
      return;
    }
    origin.value = "الكل";
    int totalCount = await DBHelper().getTotalCountByChapter(args!.title);
    List<Map<String, dynamic>> fetchedData =
        await DBHelper().getOriginCountsByChapter(args!.title);
    Map<String, dynamic> totalCountMap = {
      'origin': 'الكل',
      'count': totalCount
    };
    wordsOrigine.clear();
    wordsOrigine.add(totalCountMap);
    wordsOrigine.addAll(fetchedData);
    if (origin.value == "الكل") {
      wordsFuture.value =
          await DBHelper().getWordsByChapterAndOrigin(args!.title);
    } else {
      wordsFuture.value = await DBHelper()
          .getWordsByChapterAndOrigin(args!.title, origin.value);
    }
    isBusy.value = false;
  }

  changeorigine(String org) async {
    origin.value = org;

    if (origin.value == "الكل") {
      wordsFuture.value =
          await DBHelper().getWordsByChapterAndOrigin(args!.title);
    } else {
      wordsFuture.value = await DBHelper()
          .getWordsByChapterAndOrigin(args!.title, origin.value);
    }
  }

  @override
  Future<void> onInit() async {
    // TODO: implement onInit
    super.onInit();
    isBusy.value = true;
  }
}
