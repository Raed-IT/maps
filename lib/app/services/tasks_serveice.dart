import 'dart:convert';
import 'package:logger/logger.dart';
import 'package:maps/app/data/enums/task_status_enum.dart';
import 'package:maps/app/data/models/task_model.dart';
import 'package:maps/app/services/locale_storage_service.dart';

class TaskService {
  TaskService._();

  static final TaskService _instance = TaskService._();

  factory TaskService() {
    return _instance;
  }

  static Future<List<TaskModel>> getTasks() async {
    String tasksJson = await LocalStorageService.read('tasks');
    if (tasksJson.isNotEmpty) {
      List<dynamic> jsonData = jsonDecode(tasksJson);
      List<TaskModel> tasks = jsonData.map((item) {
          return TaskModel(status: TaskStatusEnum.completed, id: jsonDecode(item)['id'] );
      }).toList();
       return tasks;
    }
    return [];
  }

  static Future<void> writeTask(TaskModel task) async {
    try {
      List<TaskModel> tasks = await getTasks();
       tasks.add(task);

      String tasksJson =
          jsonEncode(tasks.map((t) => t.toJson().toString()).toList());
      Logger().w(tasksJson);
      await LocalStorageService.write('tasks', tasksJson);
    } catch (e, st) {
      Logger().e(st);
    }
  }

  static Future<void> updateTask(TaskModel updatedTask) async {
    List<TaskModel> tasks = await getTasks();

    for (int i = 0; i < tasks.length; i++) {
      if (tasks[i].id == updatedTask.id) {
        tasks[i] = updatedTask; // Update task with new data
        break;
      }
    }
    String tasksJson = jsonEncode(tasks.map((t) => t.toJson()).toList());
    await LocalStorageService.write('tasks', tasksJson);
  }
}
