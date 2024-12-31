import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:logger/web.dart';
import 'package:maps/app/data/enums/task_status_enum.dart';
import 'package:maps/app/data/models/task_model.dart';
import 'package:maps/app/services/tasks_serveice.dart';

class HomeScreenController extends GetxController {
  RxList<TaskModel> tasks = RxList([]);
  RxBool load = RxBool(false);

  @override
  void onInit() {
    getFreshData();
    super.onInit();
  }

  void getFreshData() async {
    load.value = true;
    tasks.value = await TaskService.getTasks();
    load.value = false;
  }

  void updateStatus(TaskModel task) async {
     task.status = task.status == TaskStatusEnum.completed
        ? TaskStatusEnum.schedule
        : TaskStatusEnum.completed;
     await TaskService.updateTask(task);
    getFreshData();
  }

  void deleteTask(TaskModel task) {}
}
