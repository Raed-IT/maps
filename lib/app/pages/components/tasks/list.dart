import 'package:flutter/material.dart';
import 'package:maps/app/data/models/task_model.dart';
import 'package:maps/app/pages/components/tasks/card.dart';

class TasksListComponent extends StatelessWidget {
  final List<TaskModel> tasks;
  const TasksListComponent({super.key, required this.tasks});

  @override
  Widget build(BuildContext context) {
     return Column(
      children:tasks.map((task) => TaskCard(task: task,)).toList(),
    );
  }
}
