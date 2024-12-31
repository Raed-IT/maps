import 'package:get/get.dart';
import 'package:maps/app/pages/splash_screen/splash_screen_controller.dart';

class SplashScreenBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(SplashScreenController());
  }

}