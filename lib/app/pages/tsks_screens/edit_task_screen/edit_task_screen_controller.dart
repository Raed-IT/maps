import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maps/app/data/enums/task_status_enum.dart';
import 'package:maps/app/data/models/task_model.dart';
import 'package:maps/app/services/tasks_serveice.dart';

class EditTaskScreenController extends GetxController {
  final TaskModel currentTask = Get.arguments['task'];
  final TextEditingController tasNameController = TextEditingController();
  final TextEditingController tasDescriptionController =
      TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey();

  @override
  void onInit() {
    tasNameController.text = "${currentTask.name}";
    tasDescriptionController.text = "${currentTask.info}";
    super.onInit();
  }

  void save() async {
    if (formKey.currentState!.validate()) {
      TaskModel task = TaskModel(
        id: "${currentTask.id}",
        info: tasDescriptionController.text,
        status: currentTask.status,
        name: tasNameController.text,
      );
      await TaskService.updateTask(task);
      Get.back();
    } else {}
  }
}
