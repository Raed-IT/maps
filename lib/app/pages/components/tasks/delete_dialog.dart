import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:maps/app/data/colors.dart';
import 'package:maps/app/data/models/task_model.dart';
void showDeleteTaskDialog(
    {required BuildContext context,required TaskModel task, required Function() onDelete }) {
  showDialog(
    context: context,
    builder: (context) => Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 200.h,
          width: Get.width - 100.w,
          child: Card(
            child: Padding(
              padding: EdgeInsets.all(10.sp),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Delete Task",
                    style:
                    TextStyle(fontWeight: FontWeight.bold, fontSize: 20.sp),
                  ),
                   Text("${task.name}"),
                   Row(
                    children: [
                      Expanded(
                        child: MaterialButton(
                          elevation: 1,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.sp),
                          ),
                          color: AppColors.primary,
                          onPressed: () => Get.back(),
                          child: Text(
                            "Cancel",
                            style: TextStyle(
                                color:
                                Theme.of(context).colorScheme.background),
                          ),
                        ),
                      ),
                      10.horizontalSpace,
                      Expanded(
                        child: MaterialButton(
                          elevation: 1,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.sp)),
                          color: Theme.of(context).colorScheme.error,
                          onPressed: () => onDelete(),
                          child: Text(
                            "Delete",
                            style: TextStyle(
                                color:
                                Theme.of(context).colorScheme.background),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ).animate().slideY(begin: 1, curve: Curves.elasticOut),
        ),
      ],
    ),
  );
}
