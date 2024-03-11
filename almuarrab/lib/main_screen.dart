import 'package:almuarrab/constants/constants.dart';
import 'package:almuarrab/constants/controllers.dart';
import 'package:almuarrab/routing/routes.dart';
import 'package:almuarrab/utils/local_navigator.dart';
import 'package:almuarrab/view/widgets/top_nav.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Layout extends StatelessWidget {
  final String routeName;

  Layout(this.routeName, {super.key}) {
    menuController.changeActiveItemTo(getRoutIndex(routeName));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: navigationController.scaffoldKey,
      extendBodyBehindAppBar: true,
      appBar: topNavigationBar(context, navigationController.scaffoldKey),
      body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                "assets/icons/page_bg.png",
              ),
              fit: BoxFit.cover,
            ),
          ),
          padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0),
          child: WillPopScope(
              onWillPop: () async {
                if (navigationController.navigatorKey.currentState!.canPop()) {
                  navigationController.navigatorKey.currentState!.pop();
                  navigationController.titlesStack.removeLast();
                  if (navigationController.titlesStack.isNotEmpty) {
                    navigationController.pageTitle.value =
                        navigationController.titlesStack.last;
                  } else {
                    navigationController.pageTitle.value = homeRoute;
                  }

                  if (getRoutIndex(navigationController.pageTitle.value) <= 2) {
                    menuController.changeActiveItemTo(
                        getRoutIndex(navigationController.pageTitle.value));
                  }
                  return false; // Prevent default back button behavior
                }
                return true; // Exit app if no navigation history is present
              },
              child: Padding(
                padding: const EdgeInsets.only(top: 80.0),
                child: localNavigator(routeName),
              ))),
      bottomNavigationBar: Obx(() => BottomNavigationBar(
            items: getMenuRole()
                .map(
                  (item) => BottomNavigationBarItem(
                    icon: Image.asset(
                      menuController.activeItem.value == item.index
                          ? menuController.returnImageActiveFor(item.index)
                          : menuController.returnImageFor(item.index),
                      width: 23,
                      height: 23,
                    ),
                    label: "",
                  ),
                )
                .toList(),
            type: BottomNavigationBarType.fixed,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            currentIndex: menuController.activeItem.value,
            // showUnselectedLabels: true,
            selectedItemColor: primaryColor,
            // unselectedItemColor: secondColor,
            // unselectedFontSize: 9,
            elevation: 0,
            onTap: (val) {
              menuController.goToPage(getRoutName(val), val, context);
            },
          )),
    );
  }
}
