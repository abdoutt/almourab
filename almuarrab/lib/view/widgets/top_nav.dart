import 'package:almuarrab/constants/constants.dart';
import 'package:almuarrab/constants/controllers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../routing/routes.dart';

AppBar topNavigationBar(BuildContext context, GlobalKey<ScaffoldState> key) =>
    AppBar(
      automaticallyImplyLeading: true,
      centerTitle: true,
      
      title: ValueListenableBuilder<String>(
        valueListenable: navigationController
            .pageTitle, // Assuming pageTitle is in your navigationController
        builder: (context, value, child) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                getRoutIndex(value) > 2
                    ? InkWell(
                        onTap: () {
                          if (navigationController.navigatorKey.currentState!
                              .canPop()) {
                            navigationController.navigatorKey.currentState!.pop();
                            navigationController.titlesStack.removeLast();
          
                            if (navigationController.titlesStack.isNotEmpty) {
                              navigationController.pageTitle.value =
                                  navigationController.titlesStack.last;
                            } else {
                              navigationController.pageTitle.value = homeRoute;
                            }
          
                            if (getRoutIndex(
                                    navigationController.pageTitle.value) <=
                                2) {
                              menuController.changeActiveItemTo(getRoutIndex(
                                  navigationController.pageTitle.value));
                            }
                          }
                        },
                        child: Image.asset(
                          "assets/icons/go_back.png",
                        ),
                      )
                    : const SizedBox(),
                Expanded(
                  child: Center(
                    child: Tooltip(
                      message: getTitleHeader(getRoutIndex(value), null),
                      child: Text(
                        getTitleHeader(getRoutIndex(value), null),
                        style: const TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                            fontFamily: "Amiri-Bold",
                            color: Colors.black87),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ); // Update the title based on the current value
        },
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      shadowColor: Colors.transparent,
    );
