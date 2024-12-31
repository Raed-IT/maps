import 'package:maps/app/data/enums/task_status_enum.dart';

class TaskModel {
  String? id;
  String? title;
  String? info;
  TaskStatusEnum? status;

  TaskModel({this.id, this.title, this.info, this.status});

  TaskModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    info = json['info'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['info'] = info;
    data['status'] = status;
    return data;
  }
}
