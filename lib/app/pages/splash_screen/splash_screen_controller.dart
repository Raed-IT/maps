import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:maps/app/data/routes.dart';

class SplashScreenController extends GetxController{
  @override
  void onInit() {
    Future.delayed(2000.ms,()=>Get.offAllNamed(AppRoutes.homeScreen));
    super.onInit();
  }}