import 'package:almuarrab/routing/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NavigationController extends GetxController {
  static NavigationController instance = Get.find();
  GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  List<String> titlesStack = [homeRoute];
  ValueNotifier<String> pageTitle = ValueNotifier(homeRoute);
  Future<dynamic> navigateTo(String routeName,{Object? arg} ) {
    pageTitle.value = routeName;
    titlesStack.add(pageTitle.value); // Push new title to stack
    return navigatorKey.currentState!.pushNamed(routeName, arguments: arg);
  }

  goBack() => navigatorKey.currentState!.pop();
}
