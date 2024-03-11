import 'package:almuarrab/404.dart';
import 'package:almuarrab/constants/controllers.dart';
import 'package:almuarrab/routing/routes.dart';
import 'package:flutter/material.dart';

Navigator localNavigator(String routeName) => Navigator(
      reportsRouteUpdateToEngine: true,
      initialRoute: routeName,
      onUnknownRoute: (settings) =>
          MaterialPageRoute(builder: (context) => const PageNotFound()),
      onGenerateRoute: generateRoute,
      key: navigationController.navigatorKey,
    );
