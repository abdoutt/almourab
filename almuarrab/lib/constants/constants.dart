import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

Color primaryColor = const Color(0xFFA18453);
Color primaryColor30 = const Color(0xFFA18453).withOpacity(0.03);
Color secondColor = Color(0xFF212121);
Color secondColor70 = Color(0xFF212121).withOpacity(0.70);
Color ligtColor = Color(0xFFF9F9F9);
var greyColor = Colors.grey.shade200;
Color getPrimarColors(Set<MaterialState> states) {
  const Set<MaterialState> hovered = <MaterialState>{MaterialState.hovered};
  const Set<MaterialState> pressed = <MaterialState>{MaterialState.pressed};
  if (states.any(hovered.contains)) {
    return primaryColor;
  }
  if (states.any(pressed.contains)) {
    return primaryColor;
  }
  return Colors.transparent;
}

String getChapterString(String value) {
  switch (value) {
    case "باب الألف":
      return "أ";
    case "باب الباء":
      return "ب";
    case "باب التاء":
      return "ت";
    case "باب الثاء":
      return "ث";
    case "باب الجيم":
      return "ج";
    case "باب الحاء":
      return "ح";
    case "باب الخاء":
      return "خ";
    case "باب الدال":
      return "د";
    case "باب الذال":
      return "ذ";
    case "باب الراء":
      return "ر";
    case "باب الزاي":
      return "ز";
    case "باب السين":
      return "س";
    case "باب الشين":
      return "ش";
    case "باب الصاد":
      return "ص";
    case "باب الضاد":
      return "ض";
    case "باب الطاء":
      return "ط";
    case "باب الظاء":
      return "ظ";
    case "باب العين":
      return "ع";
    case "باب الغين":
      return "غ";
    case "باب الفاء":
      return "ف";
    case "باب القاف":
      return "ق";
    case "باب الكاف":
      return "ك";
    case "باب اللام":
      return "ل";
    case "باب الميم":
      return "م";
    case "باب النون":
      return "ن";
    case "باب الهاء":
      return "ه";
    case "باب الواو":
      return "و";
    case "باب الياء":
      return "ي";
    default:
      return value;
  }
}

String getStatusString(String value) {
  switch (value) {
    case "reference":
      return "المرجع";
    case "number":
      return "العدد";
    case "chapter":
      return "الباب";
    case "wordWithoutDiacritics":
      return "الكلمة بلا تشكيل";
    case "wordWithDiacritics":
      return "الكلمة بالتشكيل";

    case "explanation":
      return "شرحها";
    case "htmlText":
      return "شرحها";
    case "origin":
      return "أصلها";
    case "notes":
      return "اضافة";
    case "pagePresence":
      return "صفحة تواجدها";

    default:
      throw Exception('No chapter string found for value $value');
  }
}

Future<void> requestPermissions() async {
  final status = await Permission.microphone.request();
  if (status != PermissionStatus.granted) {
    throw Exception('Microphone permission not granted');
  }
}
