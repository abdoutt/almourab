import 'package:almuarrab/constants/controllers.dart';
import 'package:almuarrab/core/base_getx_controller.dart';
import 'package:almuarrab/utils/datbase_sql.dart';
import 'package:flutter/material.dart';

class OriginsDictionaryWordsViewModel extends BaseGetxController {
  late List<Map<String, dynamic>> fetchedData;

  @override
  Future<void> onInit() async {
    // TODO: implement onInit
    super.onInit();
    isBusy.value = true;
    fetchedData = await DBHelper().getOriginCounts();
    isBusy.value = false;
  }
}
