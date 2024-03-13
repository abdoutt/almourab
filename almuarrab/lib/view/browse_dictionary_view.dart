import 'package:almuarrab/constants/constants.dart';
import 'package:almuarrab/constants/controllers.dart';
import 'package:almuarrab/core/text_search_view.dart';
import 'package:almuarrab/view/widgets/item_home_view.dart';
import 'package:flutter/material.dart';

import '../routing/routes.dart';

class BrowseDictionary extends StatelessWidget {
  const BrowseDictionary({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      margin:  const EdgeInsets.only(top: 80.0),
      child: Column(
        children: [
          SearchItemView(),
          SizedBox(
            height: 15,
          ),
          Expanded(
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ItemHome(
                      imageItem: "assets/icons/intro_icon2.png",
                      title: "مقدمة المعجم",
                      color: primaryColor,
                      tapfunction: () {
                        menuController.goToPage(getRoutName(4), 0, context);
                      },
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    ItemHome(
                      imageItem: "assets/icons/browse_icon2.png",
                      title: "باب معرفة مذاهب العرب في الاستعمال الأعجمي",
                      color: primaryColor,
                      tapfunction: () {
                        menuController.goToPage(getRoutName(8), 0, context);
                      },
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    ItemHome(
                      imageItem: "assets/icons/browse_icon2.png",
                      title: "باب ما يُعرف من المعرب بإتلاف الحروف",
                      color: primaryColor,
                      tapfunction: () {
                        menuController.goToPage(getRoutName(9), 0, context);
                      },
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    ItemHome(
                      imageItem: "assets/icons/browse_icon2.png",
                      title: "ابواب المعجم",
                      color: primaryColor,
                      tapfunction: () {
                        menuController.goToPage(getRoutName(1), 1, context);
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
