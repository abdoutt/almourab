import 'package:almuarrab/constants/controllers.dart';
import 'package:almuarrab/core/text_search_view.dart';
import 'package:almuarrab/routing/routes.dart';
import 'package:almuarrab/viewModel/chapter_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:responsive_grid/responsive_grid.dart';

class ChapterView extends StatelessWidget {
  ChapterView({super.key}) {
    viewModel = Get.put(ChapterViewModel());
  }

  late ChapterViewModel viewModel;
  @override
  Widget build(BuildContext context) {
    viewModel.setContext(context);
    return Container(
      padding: const EdgeInsets.all(8.0),
      margin: const EdgeInsets.only(top: 25.0),
      child: Column(
        children: [
          Text(
            viewModel.args!.title,
            style: const TextStyle(fontSize: 30),
          ),
          const SizedBox(
            height: 20,
          ),
          const SearchItemView(),
          const SizedBox(
            height: 7,
          ),
          Obx(() => Container(
                height: 45,
                width: MediaQuery.of(context).size.width,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: viewModel.wordsOrigine.length,
                  itemBuilder: (context, index) {
                    return Obx(() => InkWell(
                          onTap: () {
                            viewModel.changeorigine(
                                viewModel.wordsOrigine[index]['origin']);
                          },
                          child: Container(
                            padding: const EdgeInsets.all(8.0),
                            margin: const EdgeInsets.symmetric(horizontal: 5),
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        width: 2,
                                        color: viewModel.origin.value ==
                                                viewModel.wordsOrigine[index]
                                                    ['origin']
                                            ? Colors.red
                                            : Colors.grey))),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  viewModel.wordsOrigine[index]['origin'] == ""
                                      ? "لايوجد أصلها"
                                      : viewModel.wordsOrigine[index]['origin'],
                                  style: const TextStyle(fontSize: 16),
                                ),
                                const SizedBox(
                                  width: 3,
                                ),
                                Container(
                                  width: 20,
                                  height: 20,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                      color: viewModel.origin.value ==
                                              viewModel.wordsOrigine[index]
                                                  ['origin']
                                          ? Colors.red
                                          : Colors.grey),
                                  child: Center(
                                    child: Text(
                                      "${viewModel.wordsOrigine[index]['count']}",
                                      style: const TextStyle(
                                          fontSize: 12, color: Colors.white),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ));
                  },
                ),
              )),
          const SizedBox(
            height: 10,
          ),
          Obx(() => viewModel.isBusy.value
              ? const Expanded(
                  child: Center(
                      child: SpinKitCircle(
                    color: Colors.amber,
                    size: 30.0,
                  )),
                )
              : Expanded(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ResponsiveGridRow(children: [
                        for (int i = 0; i < viewModel.wordsFuture.length; i++)
                          ResponsiveGridCol(
                            xs: 6,
                            child: InkWell(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10)),
                              overlayColor: MaterialStateProperty.all<Color>(
                                  Colors.grey.withOpacity(0.5)),
                              onTap: () {
                                menuController.changeActiveItemTo(1);
                                RouteArguments args = RouteArguments(
                                    viewModel.wordsFuture[i],
                                    viewModel.wordsFuture[i]);
                                navigationController.navigateTo(detailWordRout,
                                    arg: args);
                              },
                              child: Container(
                                  margin: const EdgeInsets.symmetric(
                                      vertical: 7, horizontal: 3),
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 10.0),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(8)),
                                  child: Column(
                                    children: [
                                      Text(
                                        viewModel.wordsFuture[i],
                                        style: const TextStyle(
                                          fontSize: 20,
                                        ),
                                      ),
                                    ],
                                  )),
                            ),
                          ),
                      ]),
                    ),
                  ),
                )),
        ],
      ),
    );
  }
}
