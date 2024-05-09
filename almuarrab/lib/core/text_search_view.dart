import 'dart:async';

import 'package:almuarrab/constants/constants.dart';
import 'package:almuarrab/constants/controllers.dart';
import 'package:almuarrab/routing/routes.dart';
import 'package:almuarrab/utils/datbase_sql.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SearchItemView extends StatefulWidget {
  const SearchItemView({super.key});

  @override
  State<SearchItemView> createState() => _SearchItemViewState();
}

class _SearchItemViewState extends State<SearchItemView> {
  final TextEditingController _filter = TextEditingController();
  final StreamController<List<RouteArguments>> _resultsController =
      StreamController.broadcast();
  Timer? _debounce;
  MenuController? controller;

  @override
  void initState() {
    super.initState();
    _filter.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    _filter.dispose();
    _resultsController.close();
    _debounce?.cancel();
    super.dispose();
  }

  void _onSearchChanged() {
    if (_debounce?.isActive ?? false) {
      _debounce!.cancel();
    }
    _debounce = Timer(const Duration(milliseconds: 300), () async {
      if (_filter.text.isNotEmpty) {
        if (controller != null) {
          controller!.open();
          await search(_filter.text);
        }
      } else {
        controller!.close();
        _resultsController.add([]);
      }
    });
  }

  Future search(String searchTerm) async {
    try {
      var source = await DBHelper().searchDatabaseFull(searchTerm);
      List<RouteArguments> foundInColumnstemp = [];
      for (var match in source) {
        for (var column in match.keys) {
          String valMAtch = normalizeArabic(match[column].toString());
           String normalizedSearchTerm = normalizeArabic(searchTerm);
          if (valMAtch.contains(normalizedSearchTerm) &&
              !foundInColumnstemp.any((element) =>
                  element.title == column && element.body == match[column])) {
            foundInColumnstemp.add(RouteArguments(column, match[column]));
          }
        }
      }
      _resultsController
          .add(foundInColumnstemp); // Update results via StreamController
    } catch (e) {
      // Handle exceptions, possibly log them or show an error message
      print("Error during search: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        useMaterial3: false,
        fontFamily: 'Amiri-Bold',
      ),
      child: MenuAnchor(
        builder: (BuildContext context, MenuController con, Widget? child) {
          controller = con;

          return TextField(
            controller: _filter,
            decoration: InputDecoration(
              fillColor: Colors.white,
              hoverColor: Colors.transparent,
              prefixStyle: const TextStyle(color: Colors.black38),
              filled: true,
              contentPadding: const EdgeInsets.all(10.0),
              hintStyle: const TextStyle(color: Colors.black87, fontSize: 15),
              prefixIcon: InkWell(
                  onTap: () {
                    _onSearchChanged();
                  },
                  child: Image.asset("assets/icons/search_icon.png")),
              hintText: 'ابحث عن الكلمات ، الأبواب',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(7.0),
                borderSide: BorderSide(
                  color: secondColor.withOpacity(0.30),
                  width: 0.0,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(7.0),
                borderSide: BorderSide(
                  color: secondColor70,
                  width: 0.0,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(7.0),
                  borderSide: BorderSide(
                    color: secondColor.withOpacity(0.30),
                    width: 0.0,
                  )),
            ),
            onSubmitted: (val) {
              _onSearchChanged();
            },
            keyboardType: TextInputType.text,
            style: const TextStyle(fontSize: 18),
            autocorrect: false,
          );
        },
        menuChildren: [
          SizedBox(
            child: StreamBuilder<List<RouteArguments>>(
              stream: _resultsController.stream,
              builder: (context, snapshot) {
                if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                  int lenglist=snapshot.data!.length>100?100:snapshot.data!.length;
                  return SizedBox(
                      height: 260,
                      width: MediaQuery.of(context).size.width,
                      child: SingleChildScrollView(
                          child: Column(children: [
                        for (int i = 0; i < lenglist; i++)
                          ListTile(
                              title: Text(snapshot.data![i].body),
                              onTap: () {
                                if (snapshot.data![i].title == "chapter") {
                                  menuController.changeActiveItemTo(1);
                                  RouteArguments args = RouteArguments(
                                      snapshot.data![i].body,
                                      snapshot.data![i].body);
                                  navigationController.navigateTo(chapterRout,
                                      arg: args);
                                }
                                if (snapshot.data![i].title ==
                                    "wordWithDiacritics") {
                                  menuController.changeActiveItemTo(1);
                                  RouteArguments args = RouteArguments(
                                      snapshot.data![i].body,
                                      snapshot.data![i].body);
                                  navigationController
                                      .navigateTo(detailWordRout, arg: args);
                                }
                                if (snapshot.data![i].title ==
                                    "wordWithoutDiacritics") {
                                  menuController.changeActiveItemTo(1);
                                  RouteArguments args = RouteArguments(
                                      snapshot.data![i].body,
                                      snapshot.data![i].body);
                                  navigationController
                                      .navigateTo(detailWordOutRout, arg: args);
                                }
                                if (snapshot.data![i].title ==
                                    "pagePresence") {}
                                if (snapshot.data![i].title == "origin") {
                                  menuController.changeActiveItemTo(0);
                                  RouteArguments args = RouteArguments(
                                      snapshot.data![i].body,
                                      snapshot.data![i].body);
                                  navigationController
                                      .navigateTo(originWordsRout, arg: args);
                                }
                              })
                      ])));
                } else if (!snapshot.hasData) {
                  return Container(
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.all(10),
                      child: Center(
                          child: SpinKitCircle(
                        color: Colors.amber,
                        size: 30.0,
                      )));
                } else {
                  return Container(
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.all(10),
                      child: Center(child: Text("لم يتم العثور على نتائج")));
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
