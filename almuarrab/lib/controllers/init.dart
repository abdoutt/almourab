import 'package:almuarrab/controllers/menu_controller.dart';
import 'package:almuarrab/controllers/navigation_controller.dart';
import 'package:get/get.dart';

class Init implements Bindings {
  @override
  Future<void> dependencies() async {
    Get.put(MenuController());
    Get.put(NavigationController());
  }
}
