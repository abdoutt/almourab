import 'package:almuarrab/constants/controllers.dart';
import 'package:almuarrab/core/base_getx_controller.dart';
import 'package:almuarrab/utils/datbase_sql.dart';
import 'package:flutter/material.dart';

class DetailWordOriginViewModel extends BaseGetxController {
  late List<String> wordDate;
  RouteArguments? args;
  setContext(BuildContext cont) async {
    args = ModalRoute.of(cont)!.settings.arguments as RouteArguments;
    if (args == null) {
      return;
    }
    wordDate = await DBHelper().getWordsByOrigin(args!.title);
    isBusy.value = false;
  }

  @override
  Future<void> onInit() async {
    // TODO: implement onInit
    super.onInit();
    isBusy.value = true;
  }
}
