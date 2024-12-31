import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:maps/app/data/models/task_model.dart';
import 'package:maps/app/data/routes.dart';
import 'package:maps/app/pages/components/tasks/card.dart';
import 'package:maps/app/pages/components/ui/buttons/primary_button.dart';

class TasksListComponent extends StatelessWidget {
  final List<TaskModel> tasks;
  final void Function(TaskModel task) updateStatus;
  final void Function(TaskModel task) deleteTask;
  final void Function() reGetData;

  const TasksListComponent(
      {super.key,
      required this.tasks,
      required this.updateStatus,
      required this.deleteTask,
      required this.reGetData});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => tasks.isNotEmpty
          ? Column(
              children: tasks
                  .map((task) => TaskCard(
                        task: task,
                        reGetData: reGetData,
                        deleteTask: deleteTask,
                        updateStatus: updateStatus,
                      ))
                  .toList(),
            )
          : Container(
              height: 700.h,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("No Task Avilabel "),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 90.w, vertical: 30.h),
                    child: PrimaryButton(
                        label: "Add Task",
                        onPressed: () async {
                          await Get.toNamed(AppRoutes.addTaskScreen);
                          reGetData();
                        }),
                  )
                ],
              ),
            ),
    );
  }
}
