

import 'package:almuarrab/controllers/menu_controller.dart';
import 'package:almuarrab/controllers/navigation_controller.dart';

MenuController menuController = MenuController.instance;
NavigationController navigationController = NavigationController.instance;
class RouteArguments {
  final String title;
  final String body;

  RouteArguments(this.title, this.body);
}