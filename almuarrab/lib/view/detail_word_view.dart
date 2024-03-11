import 'package:almuarrab/constants/constants.dart';
import 'package:almuarrab/constants/controllers.dart';
import 'package:almuarrab/viewModel/chapter_view_model.dart';
import 'package:almuarrab/viewModel/detail_word_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:responsive_grid/responsive_grid.dart';

class WordDetailView extends StatelessWidget {
  WordDetailView({super.key}) {
    viewModel = Get.put(DetailWordViewModel());
  }

  late DetailWordViewModel viewModel;
  @override
  Widget build(BuildContext context) {
    viewModel.setContext(context);
    return Obx(() => viewModel.isBusy.value
        ? Center(
            child: SpinKitCircle(
            color: Colors.amber,
            size: 30.0,
          ))
        : Stack(
            children: [
              SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(7),
                            color: Colors.white),
                        child: Row(
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0, vertical: 3),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "الكلمة",
                                      style: TextStyle(fontSize: 20),
                                    ),
                                    SizedBox(
                                      height: 2,
                                    ),
                                    Text(
                                      viewModel.args!.title,
                                      style: TextStyle(
                                          fontSize: 20, color: Colors.black54),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(7),
                            color: Colors.white),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0, vertical: 10),
                                child: Text(
                                  viewModel.wordDate["explanation"],
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.black54),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(7),
                            color: Colors.white),
                        child: Row(
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0, vertical: 3),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "أصل الكلمة",
                                      style: TextStyle(fontSize: 20),
                                    ),
                                    SizedBox(
                                      height: 2,
                                    ),
                                    Text(
                                      viewModel.wordDate["origin"],
                                      style: TextStyle(
                                          fontSize: 20, color: Colors.black54),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(7),
                            color: Colors.white),
                        child: Row(
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0, vertical: 3),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "صفحة تواجدها",
                                      style: TextStyle(fontSize: 20),
                                    ),
                                    SizedBox(
                                      height: 2,
                                    ),
                                    Text(
                                      viewModel.wordDate["pagePresence"],
                                      style: TextStyle(
                                          fontSize: 20, color: Colors.black54),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                  bottom: 0,
                  left: 0,
                  child: InkWell(
                    onTap: () {
                      viewModel.share();
                    },
                    child: Image.asset("assets/icons/share_icon.png"),
                  ))
            ],
          ));
  }
}
