import 'package:almuarrab/404.dart';
import 'package:almuarrab/controllers/init.dart';
import 'package:almuarrab/core/customTransitionBuilder.dart';
import 'package:almuarrab/main_screen.dart';
import 'package:almuarrab/routing/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'constants/constants.dart';

Future<void> main() async {
   WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: 'Almuarrab',
        initialRoute: homeRoute,
        initialBinding: Init(),
        debugShowCheckedModeBanner: false,
        unknownRoute:
            GetPage(name: pageNotFoundRoute, page: () => const PageNotFound()),
        getPages: [
          GetPage(
            name: homeRoute,
            page: () => Layout(homeRoute),
          ),
          GetPage(
            name: aboutRoute,
            page: () => Layout(aboutRoute),
          ),
          GetPage(
            name: originsDictionaryWords,
            page: () => Layout(originsDictionaryWords),
          ),
          GetPage(
            name: searchPort,
            page: () => Layout(searchPort),
          ),
        ],
        textDirection: TextDirection.rtl,
        theme: ThemeData(
          fontFamily: 'Amiri-Bold',
          primaryColor: primaryColor,
          pageTransitionsTheme: const PageTransitionsTheme(builders: {
            TargetPlatform.windows: CustomTransitionBuilder(),
            TargetPlatform.iOS: FadeUpwardsPageTransitionsBuilder(),
            TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
          }),
        ));
  }
}
