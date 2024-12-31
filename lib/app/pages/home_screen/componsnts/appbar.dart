 import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maps/app/data/colors.dart';
import 'package:maps/app/pages/components/avatar.dart';
import 'package:get/get.dart';
class AppBarComponent extends StatelessWidget {
  const AppBarComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return    Container(
      color: AppColors.primary,
      child: SafeArea(
        child: Container(
          height: 123.h,
          padding: EdgeInsets.only(
              left: 33.w, right: 16.w, top: 20.h, bottom: 38.h),
          width: Get.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Salam, Raed Sawan",
                      style: TextStyle(
                          shadows:const [
                            Shadow(
                              color: Colors.black,
                              offset: Offset(0, 2),
                               blurRadius:0,
                            ),
                          ],
                          fontSize: 16.sp,
                          color: AppColors.card,
                          fontWeight: FontWeight.w500),
                    ),
                    Text(
                      "raedsawan.dev@gmail.com",
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          color: AppColors.background,
                          fontSize: 24.sp,
                          fontWeight: FontWeight.w100),
                    )
                  ],
                ),
              ),
            const  AvatarComponent(),
            ],
          ),
        ),
      ),
    );
  }
}
