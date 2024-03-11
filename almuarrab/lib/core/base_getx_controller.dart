import 'dart:async';

import 'package:almuarrab/constants/constants.dart';
import 'package:almuarrab/utils/customException.dart';
import 'package:flutter/material.dart';

import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/exceptions/exceptions.dart';

abstract class BaseGetxController extends GetxController {
  RxBool isBusy = false.obs;

  APIInvoke(Function execute) async {
    try {
      isBusy.value = true;

//execute action
      await execute.call();
    } on NotifyException catch (e) {
      await e.errorMessage();
    } on UnauthorizedException catch (e) {
      await Get.defaultDialog(
          title: 'عذرا',
          // onConfirm: () {
          //   isCanceled = true;
          //   Get.back();
          // },
          titleStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          confirm: TextButton(
            onPressed: () {
              Get.back();
            },
            child: Text(
              'ok'.tr,
              style: TextStyle(color: Colors.white),
            ),
            style: ButtonStyle(
                overlayColor:
                    MaterialStateProperty.resolveWith(getPrimarColors),
                backgroundColor: MaterialStateProperty.all<Color>(primaryColor),
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6))),
                padding: MaterialStateProperty.all(
                    const EdgeInsets.symmetric(vertical: 7, horizontal: 18))),
          ),
          cancelTextColor: Colors.black,
          buttonColor: primaryColor,
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    top: 10.0, bottom: 10, left: 20, right: 20),
                child: Text(
                  e.toString(),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
          radius: 3.0);

      await Future.delayed(
        const Duration(seconds: 5),
      );
    } on TimeoutException catch (e) {
      await Get.defaultDialog(
          title: 'عذرا',
          // onConfirm: () {
          //   isCanceled = true;
          //   Get.back();
          // },
          titleStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          confirm: TextButton(
            onPressed: () {
              Get.back();
            },
            child: Text(
              'ok'.tr,
              style: TextStyle(color: Colors.white),
            ),
            style: ButtonStyle(
                overlayColor:
                    MaterialStateProperty.resolveWith(getPrimarColors),
                backgroundColor: MaterialStateProperty.all<Color>(primaryColor),
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6))),
                padding: MaterialStateProperty.all(
                    const EdgeInsets.symmetric(vertical: 7, horizontal: 18))),
          ),
          cancelTextColor: Colors.black,
          buttonColor: primaryColor,
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    top: 10.0, bottom: 10, left: 20, right: 20),
                child: Text(
                  e.toString(),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
          radius: 3.0);
      await Future.delayed(
        const Duration(seconds: 5),
      );
      //show message of time out error to user try again
    } catch (e) {
      await Get.defaultDialog(
          title: 'عذرا',
          // onConfirm: () {
          //   isCanceled = true;
          //   Get.back();
          // },
          titleStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          confirm: TextButton(
            onPressed: () {
              Get.back();
            },
            child: Text(
              'ok'.tr,
              style: TextStyle(color: Colors.white),
            ),
            style: ButtonStyle(
                overlayColor:
                    MaterialStateProperty.resolveWith(getPrimarColors),
                backgroundColor: MaterialStateProperty.all<Color>(primaryColor),
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6))),
                padding: MaterialStateProperty.all(
                    const EdgeInsets.symmetric(vertical: 7, horizontal: 18))),
          ),
          cancelTextColor: Colors.black,
          buttonColor: primaryColor,
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    top: 10.0, bottom: 10, left: 20, right: 20),
                child: Text(
                  e.toString(),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
          radius: 3.0);
      await Future.delayed(
        const Duration(seconds: 5),
      );
    } finally {
      isBusy.value = false;
    }
  }

  APIInvokeGeneral(Function execute) async {
    try {
//execute action
      await execute.call();
    } on NotifyException catch (e) {
      await e.errorMessage();
    } on UnauthorizedException catch (e) {
      await Get.defaultDialog(
          title: 'عذرا',
          // onConfirm: () {
          //   isCanceled = true;
          //   Get.back();
          // },
          titleStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          confirm: TextButton(
            onPressed: () {
              Get.back();
            },
            child: Text(
              'ok'.tr,
              style: TextStyle(color: Colors.white),
            ),
            style: ButtonStyle(
                overlayColor:
                    MaterialStateProperty.resolveWith(getPrimarColors),
                backgroundColor: MaterialStateProperty.all<Color>(primaryColor),
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6))),
                padding: MaterialStateProperty.all(
                    const EdgeInsets.symmetric(vertical: 7, horizontal: 18))),
          ),
          cancelTextColor: Colors.black,
          buttonColor: primaryColor,
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    top: 10.0, bottom: 10, left: 20, right: 20),
                child: Text(
                  e.toString(),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
          radius: 3.0);
      await Future.delayed(
        const Duration(seconds: 5),
      );
    } on TimeoutException catch (e) {
      await Get.defaultDialog(
          title: 'عذرا',
          // onConfirm: () {
          //   isCanceled = true;
          //   Get.back();
          // },
          titleStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          confirm: TextButton(
            onPressed: () {
              Get.back();
            },
            child: Text(
              'ok'.tr,
              style: TextStyle(color: Colors.white),
            ),
            style: ButtonStyle(
                overlayColor:
                    MaterialStateProperty.resolveWith(getPrimarColors),
                backgroundColor: MaterialStateProperty.all<Color>(primaryColor),
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6))),
                padding: MaterialStateProperty.all(
                    const EdgeInsets.symmetric(vertical: 7, horizontal: 18))),
          ),
          cancelTextColor: Colors.black,
          buttonColor: primaryColor,
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    top: 10.0, bottom: 10, left: 20, right: 20),
                child: Text(
                  e.toString(),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
          radius: 3.0);
      await Future.delayed(
        const Duration(seconds: 5),
      );
    } catch (e) {
      await Get.defaultDialog(
          title: 'عذرا',
          // onConfirm: () {
          //   isCanceled = true;
          //   Get.back();
          // },
          titleStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          confirm: TextButton(
            onPressed: () {
              Get.back();
            },
            child: Text(
              'ok'.tr,
              style: TextStyle(color: Colors.white),
            ),
            style: ButtonStyle(
                overlayColor:
                    MaterialStateProperty.resolveWith(getPrimarColors),
                backgroundColor: MaterialStateProperty.all<Color>(primaryColor),
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6))),
                padding: MaterialStateProperty.all(
                    const EdgeInsets.symmetric(vertical: 7, horizontal: 18))),
          ),
          cancelTextColor: Colors.black,
          buttonColor: primaryColor,
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    top: 10.0, bottom: 10, left: 20, right: 20),
                child: Text(
                  e.toString(),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
          radius: 3.0);
      await Future.delayed(
        const Duration(seconds: 5),
      );
    } finally {}
  }

  APIInvokeDialog(Function execute) async {
    try {
      Get.defaultDialog(
          cancelTextColor: Colors.black,
          title: "",
          titleStyle: TextStyle(fontSize: 1),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SpinKitCircle(
                color: Colors.amber,
                size: 30.0,
              ),
              SizedBox(
                height: 15,
              ),
              Text('قيد التنفيذ')
            ],
          ),
          radius: 3.0);

      //execute action
      await execute.call();
      Get.back();
    } on NotifyException catch (e) {
      //
      Get.back();
      await e.errorMessage();
    } on UnauthorizedException catch (e) {
      Get.back();
      await Get.defaultDialog(
          title: 'عذرا',
          // onConfirm: () {
          //   isCanceled = true;
          //   Get.back();
          // },
          titleStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          confirm: TextButton(
            onPressed: () {
              Get.back();
            },
            child: Text(
              'ok'.tr,
              style: TextStyle(color: Colors.white),
            ),
            style: ButtonStyle(
                overlayColor:
                    MaterialStateProperty.resolveWith(getPrimarColors),
                backgroundColor: MaterialStateProperty.all<Color>(primaryColor),
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6))),
                padding: MaterialStateProperty.all(
                    const EdgeInsets.symmetric(vertical: 7, horizontal: 18))),
          ),
          cancelTextColor: Colors.black,
          buttonColor: primaryColor,
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    top: 10.0, bottom: 10, left: 20, right: 20),
                child: Text(
                  e.toString(),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
          radius: 3.0);
      await Future.delayed(
        const Duration(seconds: 5),
      );
    } on TimeoutException catch (e) {
      Get.back();
      await Get.defaultDialog(
          title: 'عذرا',
          // onConfirm: () {
          //   isCanceled = true;
          //   Get.back();
          // },
          titleStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          confirm: TextButton(
            onPressed: () {
              Get.back();
            },
            child: Text(
              'ok'.tr,
              style: TextStyle(color: Colors.white),
            ),
            style: ButtonStyle(
                overlayColor:
                    MaterialStateProperty.resolveWith(getPrimarColors),
                backgroundColor: MaterialStateProperty.all<Color>(primaryColor),
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6))),
                padding: MaterialStateProperty.all(
                    const EdgeInsets.symmetric(vertical: 7, horizontal: 18))),
          ),
          cancelTextColor: Colors.black,
          buttonColor: primaryColor,
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    top: 10.0, bottom: 10, left: 20, right: 20),
                child: Text(
                  e.toString(),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
          radius: 3.0);
      await Future.delayed(
        const Duration(seconds: 5),
      );
      //show message of time out error to user try again
    } catch (e) {
      Get.back();
      await Get.defaultDialog(
          title: 'عذرا',
          // onConfirm: () {
          //   isCanceled = true;
          //   Get.back();
          // },
          titleStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          confirm: TextButton(
            onPressed: () {
              Get.back();
            },
            child: Text(
              'ok'.tr,
              style: TextStyle(color: Colors.white),
            ),
            style: ButtonStyle(
                overlayColor:
                    MaterialStateProperty.resolveWith(getPrimarColors),
                backgroundColor: MaterialStateProperty.all<Color>(primaryColor),
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6))),
                padding: MaterialStateProperty.all(
                    const EdgeInsets.symmetric(vertical: 7, horizontal: 18))),
          ),
          cancelTextColor: Colors.black,
          buttonColor: primaryColor,
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    top: 10.0, bottom: 10, left: 20, right: 20),
                child: Text(
                  e.toString(),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
          radius: 3.0);
      await Future.delayed(
        const Duration(seconds: 5),
      );
    }
  }
}
