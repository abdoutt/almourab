import 'dart:typed_data';

import 'package:almuarrab/constants/constants.dart';
import 'package:almuarrab/constants/controllers.dart';
import 'package:almuarrab/core/text_search_view.dart';
import 'package:almuarrab/routing/routes.dart';
import 'package:almuarrab/view/widgets/item_home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_file_saver/flutter_file_saver.dart';
import 'package:get/get.dart';


class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  bool isdownload = false;

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
                      imageItem: "assets/icons/browse_icon2.png",
                      title: "تصفح المعجم",
                      color: primaryColor,
                      tapfunction: () {
                        menuController.goToPage(getRoutName(7), 0, context);
                      },
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    ItemHome(
                      imageItem: "assets/icons/doors_icon2.png",
                      title: "أبواب المعجم",
                      color: primaryColor,
                      tapfunction: () {
                        menuController.goToPage(getRoutName(1), 1, context);
                      },
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    ItemHome(
                      imageItem: "assets/icons/words_origins_icon2.png",
                      title: "اصول كلمات المعجم",
                      color: primaryColor,
                      tapfunction: () {
                        menuController.goToPage(getRoutName(3), 0, context);
                      },
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(color: Colors.black54))),
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    ItemHome(
                      imageItem: "assets/icons/more_icon2.png",
                      title: "المزيد من الخيارات",
                      color: ligtColor,
                      tapfunction: () {
                        isdownload = false;
                        showDialog(
                          context: context,
                          barrierDismissible: false,
                          barrierColor: Colors.black87,
                          builder: (BuildContext context) {
                            donload() async {
                              var data = await rootBundle
                                  .load("assets/file/almuarrabdic.pdf");
                              final buffer = data.buffer;

                              Uint8List byte = buffer.asUint8List(
                                  data.offsetInBytes, data.lengthInBytes);
                              String file = "almuarrab.pdf";
                              setState(() {
                                isdownload = true;
                              });
                              FlutterFileSaver().writeFileAsBytes(
                                fileName: file,
                                bytes: byte,
                              );
                            }

                            return AlertDialog(
                                insetPadding: EdgeInsets.zero,
                                contentPadding: EdgeInsets.zero,
                                elevation: 0,
                                backgroundColor: Colors.transparent,
                                title: null,
                                content: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 15.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Row(
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              Get.back();
                                            },
                                            child: Image.asset(
                                                "assets/icons/exit_icon.png"),
                                          ),
                                        ],
                                      ),
                                      Expanded(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            ItemHome(
                                              imageItem:
                                                  "assets/icons/description_icon2.png",
                                              title: "وصف المعجم",
                                              color: ligtColor,
                                              tapfunction: () {
                                                Get.back();
                                                menuController.goToPage(
                                                    getRoutName(11),
                                                    0,
                                                    context);
                                              },
                                            ),
                                            SizedBox(
                                              height: 15,
                                            ),
                                            ItemHome(
                                              imageItem:
                                                  "assets/icons/author_icon2.png",
                                              title: "التعريف بصاحب المعجم",
                                              color: ligtColor,
                                              tapfunction: () {
                                                Get.back();
                                                menuController.goToPage(
                                                    getRoutName(12),
                                                    0,
                                                    context);
                                              },
                                            ),
                                            SizedBox(
                                              height: 15,
                                            ),
                                            ItemHome(
                                              imageItem:
                                                  "assets/icons/searchin_icon2.png",
                                              title: "البحث في المعجم",
                                              color: ligtColor,
                                              tapfunction: () {
                                                Get.back();
                                                menuController.goToPage(
                                                    getRoutName(1), 1, context);
                                              },
                                            ),
                                            SizedBox(
                                              height: 15,
                                            ),
                                            ItemHome(
                                              imageItem:
                                                  "assets/icons/download_icon2.png",
                                              title: "تحميل المعجم PDF",
                                              color: ligtColor,
                                              tapfunction: () {
                                                donload();
                                              },
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      Visibility(
                                        visible: isdownload,
                                        child: Container(
                                          padding: EdgeInsets.all(10.0),
                                          decoration: BoxDecoration(
                                              color: Color(0xff29BD40)
                                                  .withOpacity(0.70),
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          child: Row(
                                            children: [
                                              Image.asset(
                                                  "assets/icons/tick.png"),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Text(
                                                "تم تحميل المعجم بنجاح",
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    color: Colors.white),
                                              )
                                            ],
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ));
                          },
                        );
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
