import 'package:get/get.dart';
import 'package:maps/app/pages/tsks_screens/edit_task_screen/edit_task_screen_controller.dart';

class EditTaskScreenBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(EditTaskScreenController());
  }

}