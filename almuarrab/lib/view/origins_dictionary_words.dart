import 'package:almuarrab/constants/constants.dart';
import 'package:almuarrab/core/text_search_view.dart';
import 'package:almuarrab/routing/routes.dart';
import 'package:almuarrab/viewModel/origins_dictionary_words_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

import '../constants/controllers.dart';

class OriginsDictionaryWords extends StatelessWidget {
  OriginsDictionaryWords({super.key}) {
    viewModel = Get.put(OriginsDictionaryWordsViewModel());
  }

  late OriginsDictionaryWordsViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
         SearchItemView(),
       Obx(() => viewModel.isBusy.value
            ? Expanded(
                child: Center(
                    child: SpinKitCircle(
                  color: Colors.amber,
                  size: 30.0,
                )),
              )
            : Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: viewModel.fetchedData.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        menuController.changeActiveItemTo(0);
                        RouteArguments args = RouteArguments(
                            viewModel.fetchedData[index]['origin'],
                            viewModel.fetchedData[index]['origin']);
                        navigationController.navigateTo(originWordsRout,
                            arg: args);
                      },
                      child: Container(
                        padding: EdgeInsets.all(8.0),
                        margin:
                            EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "كلمات أصلها ${viewModel.fetchedData[index]['origin']}",
                              style: TextStyle(fontSize: 20),
                            ),
                            SizedBox(
                              height: 2,
                            ),
                            Text(
                              "${viewModel.fetchedData[index]['count']} كلمة",
                              style: TextStyle(
                                  fontSize: 20, color: Colors.black87),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              )),
      ],
    );
  }
}
