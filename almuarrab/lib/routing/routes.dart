import 'package:almuarrab/view/about_view.dart';
import 'package:almuarrab/view/auteur_dictionary.dart';
import 'package:almuarrab/view/browse_dictionary_view.dart';
import 'package:almuarrab/view/chapter_view.dart';
import 'package:almuarrab/view/description_dictionary.dart';
import 'package:almuarrab/view/detail_word_view.dart';
import 'package:almuarrab/view/home_view.dart';
import 'package:almuarrab/view/introduction_dictionary.dart';
import 'package:almuarrab/view/introduction_dictionary_letter.dart';
import 'package:almuarrab/view/introduction_dictionary_port.dart';
import 'package:almuarrab/view/origins_dictionary_words.dart';
import 'package:almuarrab/view/search_port_view.dart';
import 'package:almuarrab/view/word_origin_detail_view.dart';
import 'package:flutter/material.dart';

const homeRoute = "/home";
const aboutRoute = "/about";
const searchPort = "/search_port";
const originsDictionaryWords = "/origins_dictionary_Words";
const introductionDictionaryRout = "/introduction_dictionary";
const introductionDictionaryLetterRout = "/introduction_dictionary_letter";
const introductionDictionaryPortRout = "/introduction_dictionary_port";
const chapterRout = "/chapter";
const detailWordRout = "/word_detail";
const pageNotFoundRoute = "/404";
const browseDictionary = "/browse_dictionary";
const originWordsRout = "/origin_words";
const auteurDictionaryRout = "/auteur_dictionary";
const descriptionDictinaryRout = "/description_dictionary";

class MenuItemTOp {
  int index;
  String name;
  String route;

  MenuItemTOp(this.index, this.name, this.route);
}

List<MenuItemTOp> menuItemRoutes = [
  MenuItemTOp(0, 'الرئيسية', homeRoute),
  MenuItemTOp(1, 'أبواب المعجم', searchPort),
  MenuItemTOp(2, 'حول', aboutRoute),
];

int getRoutIndex(String routeName) {
  switch (routeName) {
    case homeRoute:
      return 0;
    case searchPort:
      return 1;
    case aboutRoute:
      return 2;
    case originsDictionaryWords:
      return 3;
    case introductionDictionaryRout:
      return 4;
    case chapterRout:
      return 5;
    case detailWordRout:
      return 6;
    case browseDictionary:
      return 7;
    case introductionDictionaryPortRout:
      return 8;
    case introductionDictionaryLetterRout:
      return 9;
    case originWordsRout:
      return 10;
    case descriptionDictinaryRout:
      return 11;
    case auteurDictionaryRout:
      return 12;

    default:
      return 0;
  }
}

String getRoutName(int routeIndex) {
  switch (routeIndex) {
    case 0:
      return homeRoute;
    case 1:
      return searchPort;
    case 2:
      return aboutRoute;
    case 3:
      return originsDictionaryWords;
    case 4:
      return introductionDictionaryRout;
    case 5:
      return chapterRout;
    case 6:
      return detailWordRout;
    case 7:
      return browseDictionary;
    case 8:
      return introductionDictionaryPortRout;
    case 9:
      return introductionDictionaryLetterRout;
    case 10:
      return originWordsRout;

    case 11:
      return descriptionDictinaryRout;
    case 12:
      return auteurDictionaryRout;

    default:
      return homeRoute;
  }
}

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case aboutRoute:
      return _getPageRoute(AboutView(), settings);
    case homeRoute:
      return _getPageRoute(HomeView(), settings);
    case searchPort:
      return _getPageRoute(SearchPortView(), settings);
    case originsDictionaryWords:
      return _getPageRoute(OriginsDictionaryWords(), settings);
    case introductionDictionaryRout:
      return _getPageRoute(IntroductionDictionary(), settings);
    case chapterRout:
      return _getPageRoute(ChapterView(), settings);
    case detailWordRout:
      return _getPageRoute(WordDetailView(), settings);
    case browseDictionary:
      return _getPageRoute(BrowseDictionary(), settings);

    case introductionDictionaryPortRout:
      return _getPageRoute(IntroductionDictionaryPort(), settings);
    case introductionDictionaryLetterRout:
      return _getPageRoute(IntroductionDictionaryLetter(), settings);
    case originWordsRout:
      return _getPageRoute(DetailWordOriginView(), settings);

    case descriptionDictinaryRout:
      return _getPageRoute(DescriptionDictionary(), settings);
    case auteurDictionaryRout:
      return _getPageRoute(AuteurDictionary(), settings);

    default:
      return _getPageRoute(HomeView(), settings);
  }
}

PageRoute _getPageRoute(Widget child, RouteSettings rout) {
  return PageRouteBuilder(
      pageBuilder: (_, __, ___) => child,
      transitionDuration: const Duration(seconds: 0),
      settings: rout);
}

List<int> getListMenuActive() {
  List<int> result = [];

  result = [0, 1, 2];

  return result;
}

List<MenuItemTOp> getMenuRole() {
  List<int> result = getListMenuActive();
  if (result.isEmpty) {
    return menuItemRoutes;
  }

  return menuItemRoutes
      .where((element) => result.contains(element.index))
      .toList();
}

String getTitleHeader(int index, String? rout) {
  switch (index) {
    case 0:
      return "الرئيسية";
    case 1:
      return "أبواب المعجم";
    case 2:
      return "حول";
    case 3:
      return "اصول كلمات المعجم";
    case 4:
      return "مقدمة المعجم";
    case 5:
      return " ";
    case 6:
      return "";
    case 7:
      return "المعجم";
    case 8:
      return "باب معرفة مذاهب العرب في الاستعمال الأعجمي";
    case 9:
      return "باب ما يُعرف من المعرب بإتلاف الحروف";
    case 10:
      return "";

    case 11:
      return "وصف المعجم";
    case 12:
      return "التعريف بصاحب المعجم";
    default:
      return 'الرئيسية';
  }
}
