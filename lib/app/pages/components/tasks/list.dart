import 'package:flutter/material.dart';
import 'package:maps/app/data/models/task_model.dart';
import 'package:maps/app/pages/components/tasks/card.dart';

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
    return Column(
      children: tasks
          .map((task) => TaskCard(
                task: task,
        reGetData:reGetData,
                deleteTask: deleteTask,
                updateStatus: updateStatus,
              ))
          .toList(),
    );
  }
}
