import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:maps/app/data/colors.dart';
import 'package:maps/app/data/models/task_model.dart';
import 'package:maps/app/data/routes.dart';
import 'package:maps/app/pages/components/tasks/list.dart';
import 'package:maps/app/pages/home_screen/componsnts/ads.dart';
import 'package:maps/app/pages/home_screen/componsnts/appbar.dart';
import 'package:maps/app/pages/home_screen/home_screen_controller.dart';

class HomeScreen extends GetView<HomeScreenController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primary,
        shape: CircleBorder(),
        child: Center(
          child: Icon(
            Icons.add,
            color: AppColors.card,
            shadows: [
              Shadow(
                color: Colors.black,
                offset: Offset(0, 2),
                blurRadius: 2,
              ),
            ],
          ),
        ),
        onPressed: () => Get.toNamed(AppRoutes.addTaskScreen),
      ),
      body: SizedBox(
        child: Column(
          children: [
            AppBarComponent(),

            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const AdsComponent(),
                    Obx(
                      () => controller.load.value
                          ? const Center(
                              child: CircularProgressIndicator(),
                            )
                          : TasksListComponent(
                              tasks: controller.tasks,
                              updateStatus: (TaskModel task) {
                                Logger().w("sd0");
                                controller.updateStatus(task);
                              },
                              deleteTask: (TaskModel task) {
                                controller.deleteTask(task);
                              },
                            ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
