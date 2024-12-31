import 'package:flutter/foundation.dart';

enum TaskStatusEnum { completed, schedule }


extension TaskStatusExtention on String {
  TaskStatusEnum toTaskStatus() => TaskStatusEnum.values
      .firstWhere((e) => describeEnum(e) == toLowerCase());
}
