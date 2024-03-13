import 'package:almuarrab/constants/controllers.dart';
import 'package:almuarrab/core/base_getx_controller.dart';
import 'package:almuarrab/utils/datbase_sql.dart';
import 'package:flutter/material.dart';
import 'package:flutter_share/flutter_share.dart';

class DetailWordWithoutViewModel extends BaseGetxController {
  late String word;

  late Map<String, dynamic> wordDate;
  RouteArguments? args;
  setContext(BuildContext cont) async {
     isBusy.value = true;
    wordDate = {};
    args = ModalRoute.of(cont)!.settings.arguments as RouteArguments;
    if (args == null) {
      return;
    }
    List<Map<String, dynamic>> data =
        await DBHelper().getDetailsByWordWithOutDiacritics(args!.title);
    wordDate = data.first;
    isBusy.value = false;
  }

  @override
  Future<void> onInit() async {
    // TODO: implement onInit
    super.onInit();
    isBusy.value = true;
  }

  Future<void> share() async {
    await FlutterShare.share(
      title: "${"الكلمة" "\n" + args!.title}",
      text:
          "${"الكلمة" "\n" + args!.title + "\n" + "\n" + wordDate["explanation"] + "\n" + "\n" + "أصل الكلمة" + "\n" + wordDate["origin"]}\n\nصفحة تواجدها\n" +
              wordDate["pagePresence"],
    );
  }
}
