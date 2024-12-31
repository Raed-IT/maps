import 'package:maps/app/data/enums/task_status_enum.dart';

class TaskModel {
  String? id;
  String? name;
  String? info;
  TaskStatusEnum? status;

  TaskModel({this.id, this.name, this.info, this.status});

  TaskModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    info = json['info'];
    status =TaskStatusEnum.values.firstWhere(
          (e) => e.toString() == 'TaskStatusEnum.${json['status']}',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "\"id\"": "\"${id}\"",
      "\"name\"": "\"${name}\"",
      "\"info\"": "\"${info}\"",
      "\"status\"": "\"${status.toString().split('.').last}\"",
    };
  }
}
