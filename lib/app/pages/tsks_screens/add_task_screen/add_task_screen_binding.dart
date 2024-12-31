import 'package:get/get.dart';
import 'package:maps/app/pages/tsks_screens/add_task_screen/add_task_screen_controller.dart';

class AddTaskScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(AddTaskScreenController());
  }
}
