import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maps/app/data/colors.dart';

class AdsComponent extends StatelessWidget {
  const AdsComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 116.h,
      padding: EdgeInsets.only(left: 24.9.w, right: 23.w),
      decoration: BoxDecoration(
          color: const Color.fromRGBO(172, 235, 95, 1),
          border: Border.all(
              color: const Color.fromRGBO(158, 176, 49, 1), width: 2.sp)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              Image.asset(
                "assets/images/img.png",
                height: 40.h,
                width: 53.w,
              ),
              27.horizontalSpace,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Go Pro (No Ads)",
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 18.sp,
                    ),
                  ),
                  Text(
                    "No fuss, no ads, for only 5 TL a year",
                    style: TextStyle(fontSize: 12.sp),
                  )
                ],
              )
            ],
          ),
          Transform.translate(
            offset: const Offset(0, -3),
            child: Align(
              alignment: Alignment.topCenter,
              child: Container(
                color: AppColors.primary,
                width: 66.11.w,
                height: 71.h,
                child: Center(
                  child: Text(
                    "TL 5",
                    style: TextStyle(
                        color: AppColors.card,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ),
          ),

        ],
      ),
    );
  }
}
