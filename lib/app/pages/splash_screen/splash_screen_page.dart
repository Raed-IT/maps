import 'package:get/get.dart';
import 'package:maps/app/data/routes.dart';
import 'package:maps/app/pages/splash_screen/splash_screen.dart';
import 'package:maps/app/pages/splash_screen/splash_screen_binding.dart';

class SplashPage extends GetPage{
  SplashPage():super(
    name: AppRoutes.splashScreen,
    page: ()=>SplashScreen(),
    binding: SplashScreenBinding(),
  );

}