import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:logger/web.dart';
import 'package:maps/app/data/colors.dart';
import 'package:maps/app/data/enums/task_status_enum.dart';
import 'package:maps/app/data/models/task_model.dart';
import 'package:maps/app/data/routes.dart';

class TaskCard extends StatelessWidget {
  final TaskModel task;
  final void Function(TaskModel task) updateStatus;
  final void Function(TaskModel task) deleteTask;
  final void Function() reGetData;

  const TaskCard(
      {super.key,
      required this.task,
      required this.updateStatus,
      required this.deleteTask,
      required this.reGetData});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 105.h,
      child: Card(
        color: AppColors.card,
        margin: EdgeInsets.symmetric(vertical: 10.h, horizontal: 16.w),
        elevation: 1,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(6.sp)),
        child: Row(
          children: [
            GestureDetector(
              onTap: () {
                updateStatus(task);
              },
              child: Container(
                height: 91.h,
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 23.w, right: 17.w),
                      child:
                          buildStatus(task.status ?? TaskStatusEnum.completed),
                    ),
                    Text(
                      "${task.name}",
                      style: TextStyle(
                        color: task.status == TaskStatusEnum.completed
                            ? Color.fromRGBO(141, 141, 141, 1)
                            : null,
                        fontWeight: FontWeight.w500,
                        fontSize: 16.sp,
                        decoration: task.status == TaskStatusEnum.completed
                            ? TextDecoration.lineThrough
                            : null,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Spacer(),
            Row(
              children: [
                buildButton(
                    label: "Delete",
                    onClick: () {
                      deleteTask(task);
                    }),
                5.horizontalSpace,
                buildButton(
                    label: "Edit",
                    onClick: () async{
                        await Get.toNamed(AppRoutes.editTaskScreen,
                          arguments: {"task": task});
                        reGetData();
                    }),
                19.horizontalSpace,
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget buildButton({required String label, void Function()? onClick}) {
    const color = Color.fromRGBO(7, 29, 85, 1);
    return GestureDetector(
      onTap: onClick,
      child: Container(
        height: 45.h,
        padding: EdgeInsets.symmetric(
          horizontal: 10.w,
        ),
        decoration: BoxDecoration(
            border: Border.all(color: color, width: 1.sp),
            borderRadius: BorderRadius.circular(4.sp)),
        child: Center(
          child: Text(
            label,
            style: TextStyle(color: color),
          ),
        ),
      ),
    );
  }

  Widget buildStatus(TaskStatusEnum status) {
    if (status == TaskStatusEnum.completed) {
      return Container(
        height: 32.sp,
        width: 32.sp,
        padding: EdgeInsets.all(8.sp),
        decoration: BoxDecoration(
            border: Border.all(color: Color.fromRGBO(73, 194, 93, 1)),
            borderRadius: BorderRadius.circular(200),
            color: Color.fromRGBO(83, 218, 105, 1)),
        child: SizedBox(
          child: Image.asset(
            "assets/images/check.png",
          ),
        ),
      );
    }
    return Container(
      height: 32.sp,
      width: 32.sp,
      decoration: BoxDecoration(
          border: Border.all(color: Color.fromRGBO(73, 194, 93, 1)),
          borderRadius: BorderRadius.circular(200)),
    );
  }
}
