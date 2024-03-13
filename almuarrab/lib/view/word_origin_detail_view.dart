import 'package:almuarrab/constants/controllers.dart';
import 'package:almuarrab/core/text_search_view.dart';
import 'package:almuarrab/routing/routes.dart';
import 'package:almuarrab/viewModel/word_origin_detail_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:responsive_grid/responsive_grid.dart';

class DetailWordOriginView extends StatelessWidget {
  DetailWordOriginView({super.key}) {
    viewModel = Get.put(DetailWordOriginViewModel());
  }

  late DetailWordOriginViewModel viewModel;
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
            style: TextStyle(fontSize: 30),
          ),
           SizedBox(
            height: 20,
          ),
          SearchItemView(),
          SizedBox(
            height: 15,
          ),
          Obx(() => viewModel.isBusy.value
              ? Expanded(
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
                        for (int i = 0; i < viewModel.wordDate.length; i++)
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
                                    viewModel.wordDate[i],
                                    viewModel.wordDate[i]);
                                navigationController.navigateTo(detailWordRout,
                                    arg: args);
                              },
                              child: Container(
                                  margin: EdgeInsets.symmetric(
                                      vertical: 7, horizontal: 3),
                                  padding: EdgeInsets.symmetric(vertical: 10.0),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(8)),
                                  child: Column(
                                    children: [
                                      Text(
                                        viewModel.wordDate[i],
                                        style: TextStyle(
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
