import 'dart:convert';
import 'package:logger/logger.dart';
import 'package:maps/app/data/models/task_model.dart';
import 'package:maps/app/services/locale_storage_service.dart';
import 'package:maps/app/data/enums/task_status_enum.dart';

class TaskService {
  TaskService._();

  static final TaskService _instance = TaskService._();

  factory TaskService() {
    return _instance;
  }

  static Future<List<TaskModel>> getTasks() async {
    // await LocalStorageService.remove('tasks');
    String tasksJson = await LocalStorageService.read('tasks');
    if (tasksJson.isNotEmpty) {
      List<dynamic> jsonData = jsonDecode(tasksJson);
      List<TaskModel> tasks = jsonData.map((item) {
        var jsonTask = jsonDecode(item);
        return TaskModel(
            status: '${jsonTask['status']}'.toTaskStatus(),
            id: jsonTask['id'],
            name: jsonTask['name'],
            info: jsonTask['info']);
      }).toList();
      Logger().w(tasks);
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
        tasks[i] = updatedTask;
        break;
      }
    }
    Logger().w(tasks.map((e) => e.info));

     String tasksJson =
        jsonEncode(tasks.map((t) => t.toJson().toString()).toList());
    await LocalStorageService.write('tasks', tasksJson);
  }

  static Future<void> deleteTask(String taskId) async {
    List<TaskModel> tasks = await getTasks();
    tasks.removeWhere((task) => task.id == taskId);
    String tasksJson =
        jsonEncode(tasks.map((t) => t.toJson().toString()).toList());
    await LocalStorageService.write('tasks', tasksJson);
  }
}
