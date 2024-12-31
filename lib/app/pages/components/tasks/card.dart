import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:maps/app/data/enums/task_status_enum.dart';
import 'package:maps/app/data/models/task_model.dart';

class TaskCard extends StatelessWidget {
  final TaskModel task;

  const TaskCard({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    Logger().w(task.toJson());
    return SizedBox(
      height: 91.h,
      width: Get.width,
      child: Card(
        elevation: 1,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(6.sp)),
        child: Row(
          children: [
            Radio(
                value: task.status,
                groupValue: TaskStatusEnum.completed,
                onChanged: (state) {}),
            Text(
              "${task.name}",
              style: TextStyle(fontWeight: FontWeight.w500,fontSize: 16.sp),
            )
          ],
        ),
      ),
    );
  }
}
