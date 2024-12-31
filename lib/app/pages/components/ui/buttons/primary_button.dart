import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maps/app/data/colors.dart';
import 'package:get/get.dart';

class PrimaryButton extends StatelessWidget {
  final String label;
  void Function()? onPressed;
    PrimaryButton({super.key, required this.label, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 61.h,
      width: Get.width,
      decoration: BoxDecoration(boxShadow:const [
         BoxShadow(
          color: Color.fromRGBO(168, 181, 222, 0.5),
          spreadRadius: 2,
          blurRadius: 6,
          offset:   Offset(0, 3),
        ),
      ], color: AppColors.primary, borderRadius: BorderRadius.circular(6.sp)),
      child: MaterialButton(
        onPressed:onPressed,
        child: Text(
          label,
          style: TextStyle(
            fontSize: 18.sp,
            color: AppColors.card,
            fontWeight: FontWeight.w400,
            shadows:const[
              Shadow(
                color: Colors.black,
                offset: Offset(0, 2),
                blurRadius:0,
              ),
            ]
          ),
        ),
      ),
    );
  }
}
