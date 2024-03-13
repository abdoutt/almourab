import 'package:almuarrab/constants/constants.dart';
import 'package:almuarrab/constants/controllers.dart';
import 'package:almuarrab/core/text_search_view.dart';
import 'package:almuarrab/model/chepiter_model.dart';
import 'package:almuarrab/utils/datbase_sql.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:responsive_grid/responsive_grid.dart';

import '../routing/routes.dart';

class SearchPortView extends StatelessWidget {
  final Future<List<ChapterCount>> chaptersFuture;

  SearchPortView({Key? key})
      : chaptersFuture = DBHelper.getChaptersAndCounts().then((data) => data
            .map((item) =>
                ChapterCount(chapter: item['chapter'], count: item['count']))
            .where((element) => element.chapter.isNotEmpty)
            .toList()),
        super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      margin:  const EdgeInsets.only(top: 80.0),
      
      child: Column(
        children: [
            SearchItemView(),
          SizedBox(
            height: 20,
          ),
          FutureBuilder<List<ChapterCount>>(
              future: chaptersFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Expanded(
                    child: Center(
                        child: SpinKitCircle(
                      color: Colors.amber,
                      size: 30.0,
                    )),
                  );
                } else if (snapshot.hasError) {
                  return Expanded(
                      child: Center(child: Text("Error: ${snapshot.error}")));
                } else if (snapshot.hasData) {
                  return Expanded(
                    child: SingleChildScrollView(
                      child: ResponsiveGridRow(children: [
                        for (int i = 0; i < snapshot.data!.length; i++)
                          ResponsiveGridCol(
                            xs: 3,
                            child: InkWell(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10)),
                              overlayColor: MaterialStateProperty.all<Color>(
                                  Colors.grey.withOpacity(0.5)),
                              onTap: () {
                                menuController.changeActiveItemTo(1);
                                RouteArguments args = RouteArguments(
                                    snapshot.data![i].chapter,
                                    snapshot.data![i].chapter);
                                navigationController.navigateTo(chapterRout,
                                    arg: args);
                              },
                              child: Container(
                                  margin: EdgeInsets.symmetric(
                                      vertical: 4, horizontal: 3),
                                  padding: EdgeInsets.all(3.0),
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Expanded(
                                            child: Container(
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 7),
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  color: Colors.white),
                                              child: Text(
                                                getChapterString(
                                                    snapshot.data![i].chapter),
                                                style: TextStyle(fontSize: 35, color: primaryColor),
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 3,
                                      ),
                                      Text(
                                        "${snapshot.data![i].chapter}(${snapshot.data![i].count})",
                                        style: TextStyle(fontSize: 12),
                                      ),
                                    ],
                                  )),
                            ),
                          ),
                      ]),
                    ),
                  );
                } else {
                  return Expanded(
                      child: Center(child: Text("No data available")));
                }
              }),
        ],
      ),
    );
  }
}
