import 'dart:convert';
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
      List<dynamic> taskList = jsonDecode(tasksJson);
      return taskList.map((task) => TaskModel.fromJson(task)).toList();
    }
    return [];
  }

   static Future<void> writeTask(TaskModel task) async {
    List<TaskModel> tasks = await getTasks();
    tasks.add(task); // Add the new task to the list

     String tasksJson = jsonEncode(tasks.map((t) => t.toJson()).toList());
    await LocalStorageService.write('tasks', tasksJson);
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
