import 'package:almuarrab/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotifyException implements Exception {
  String? cause;
  bool isconcel = false;
  NotifyException(this.cause);
  errorMessage() async {
    Get.defaultDialog(
        title: 'عذرا',
        onConfirm: () {
          isconcel = true;
          Get.back();
        },
        cancelTextColor: Colors.black,
        buttonColor: primaryColor,
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              cause!,
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),
          ],
        ),
        radius: 10.0);
    await Future.delayed(const Duration(seconds: 5), () async {
      if (!isconcel) Get.back();
    });
  }
}
