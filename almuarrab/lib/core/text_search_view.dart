import 'dart:async';

import 'package:almuarrab/constants/constants.dart';
import 'package:almuarrab/constants/controllers.dart';
import 'package:almuarrab/routing/routes.dart';
import 'package:almuarrab/utils/datbase_sql.dart';
import 'package:flutter/material.dart';

class SearchItemView extends StatefulWidget {
  const SearchItemView({super.key});

  @override
  State<SearchItemView> createState() => _SearchItemViewState();
}

class _SearchItemViewState extends State<SearchItemView> {
  List<Map<String, dynamic>> source = [];
  List<RouteArguments> foundInColumns = [];
  TextEditingController filter = TextEditingController();

  search(MenuController controller) async {
    if (filter.text.isNotEmpty) {
      source = [];
      source = await DBHelper().searchDatabase(filter.text);
      setState(() {
        foundInColumns = [];
      });
      List<RouteArguments> foundInColumnstemp = [];
      for (var match in source) {
        for (var column in match.keys) {
          bool exist = true;
          var existitem = foundInColumnstemp.where((element) =>
              element.title == column && element.body == match[column]);
          if (existitem.isNotEmpty) {
            exist = false;
          }
          if (match[column].toString().contains(filter.text) && exist) {
            foundInColumnstemp.add(RouteArguments(column, match[column]));
          }
        }
      }
      setState(() {
        foundInColumns = foundInColumnstemp;
      });
      if (controller.isOpen) {
        controller.close();
      } else {
        controller.open();
      }
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
        builder:
            (BuildContext context, MenuController controller, Widget? child) {
          return TextField(
            controller: filter,
            onSubmitted: (value) {
              search(controller);
            },
            onChanged: (val) {
              search(controller);
            },
            decoration: InputDecoration(
              fillColor: Colors.white,
              hoverColor: Colors.transparent,
              prefixStyle: const TextStyle(color: Colors.black38),
              filled: true,
              contentPadding: const EdgeInsets.all(10.0),
              hintStyle: const TextStyle(color: Colors.black87, fontSize: 15),
              prefixIcon: InkWell(
                  onTap: () {
                    search(controller);
                  },
                  child: Image.asset("assets/icons/search_icon.png")),
              hintText: 'ابحث عن الكلمات, الأبواب',
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
            keyboardType: TextInputType.text,
            style: const TextStyle(fontSize: 18),
            autocorrect: false,
          );
        },
        menuChildren: [
          SizedBox(
              height: 250,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    for (int i = 0; i < foundInColumns.length; i++)
                      InkWell(
                        onTap: () {
                          if (foundInColumns[i].title == "chapter") {
                            menuController.changeActiveItemTo(1);
                            RouteArguments args = RouteArguments(
                                foundInColumns[i].body, foundInColumns[i].body);
                            navigationController.navigateTo(chapterRout,
                                arg: args);
                          }
                          if (foundInColumns[i].title == "wordWithDiacritics") {
                            menuController.changeActiveItemTo(1);
                            RouteArguments args = RouteArguments(
                                foundInColumns[i].body, foundInColumns[i].body);
                            navigationController.navigateTo(detailWordRout,
                                arg: args);
                          }
                          if (foundInColumns[i].title ==
                              "wordWithoutDiacritics") {
                            menuController.changeActiveItemTo(1);
                            RouteArguments args = RouteArguments(
                                foundInColumns[i].body, foundInColumns[i].body);
                            navigationController.navigateTo(detailWordOutRout,
                                arg: args);
                          }
                          if (foundInColumns[i].title == "pagePresence") {}
                          if (foundInColumns[i].title == "origin") {
                            menuController.changeActiveItemTo(0);
                            RouteArguments args = RouteArguments(
                                foundInColumns[i].body, foundInColumns[i].body);
                            navigationController.navigateTo(originWordsRout,
                                arg: args);
                          }
                        },
                        child: Container(
                          padding: const EdgeInsets.all(7.0),
                          width: MediaQuery.of(context).size.width,
                          child: Text(
                            foundInColumns[i].body,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(fontSize: 15, color: Colors.black),
                          ),
                        ),
                      )
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
