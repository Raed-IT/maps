import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AvatarComponent extends StatelessWidget {
  const AvatarComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.sp,
      width: 50.sp,
      child: LayoutBuilder(
        builder: (context, constraints) {
          // Calculate radius as half of the smaller dimension
          double radius = (constraints.maxHeight < constraints.maxWidth
                  ? constraints.maxHeight
                  : constraints.maxWidth) /
              2;
          return CircleAvatar(
            radius: radius,
             child: ClipOval(
              child: Image.asset(
                "assets/images/avatar.jpeg",
                fit: BoxFit.cover,
                height: constraints.maxHeight,
                width: constraints.maxWidth,
              ),
            ),
          );
        },
      ),
    );
  }
}
