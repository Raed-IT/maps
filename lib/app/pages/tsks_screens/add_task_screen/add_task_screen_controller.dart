import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
 import 'package:maps/app/data/enums/task_status_enum.dart';
import 'package:maps/app/data/models/task_model.dart';
import 'package:maps/app/services/tasks_serveice.dart';
import 'package:uuid/uuid.dart';

class AddTaskScreenController extends GetxController {
  final TextEditingController tasNameController = TextEditingController();
  final TextEditingController tasDescriptionController =
      TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey();

  void save() async {
    if (formKey.currentState!.validate()) {
      TaskModel task = TaskModel(
          id: const Uuid().v1(),
          info: tasDescriptionController.text,
          status: TaskStatusEnum.schedule,
          name: tasNameController.text);
       await TaskService.writeTask(task);
     Get.back();
    } else {}
  }
}
