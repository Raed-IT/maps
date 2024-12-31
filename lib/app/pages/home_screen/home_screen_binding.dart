import 'package:get/get.dart';
import 'package:maps/app/pages/home_screen/home_screen_controller.dart';

class HomeScreenBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(HomeScreenController());
  }

}
