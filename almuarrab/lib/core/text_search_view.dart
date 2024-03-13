import 'dart:async';

import 'package:almuarrab/constants/constants.dart';
import 'package:almuarrab/constants/controllers.dart';
import 'package:almuarrab/routing/routes.dart';
import 'package:almuarrab/utils/datbase_sql.dart';
import 'package:audio_session/audio_session.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter_sound_platform_interface/flutter_sound_recorder_platform_interface.dart';

import '../view/widgets/simple_recorder.dart';

typedef _Fn = void Function();
const theSource = AudioSource.microphone;

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
              suffixIcon: Image.asset("assets/icons/search_with_voice.png"),
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
                            navigationController.navigateTo(detailWordRout,
                                arg: args);
                          }
                          if (foundInColumns[i].title == "pagePresence") {}
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
