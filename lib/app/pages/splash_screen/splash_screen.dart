import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:maps/app/pages/splash_screen/splash_screen_controller.dart';

class SplashScreen extends GetView<SplashScreenController>{
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
body: Center(
  child: Image(
    height: 150.sp,
    width: 150.sp,
    image: const AssetImage("assets/images/logo.jpg"),
  )
      .animate()
      .slideY(begin: 1)
      .fadeIn()
      .shimmer(delay: 500.ms, duration: 1000.ms),
),
    );
  }
}