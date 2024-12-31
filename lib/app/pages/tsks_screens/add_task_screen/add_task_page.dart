import 'package:get/get.dart';
import 'package:maps/app/data/routes.dart';
import 'package:maps/app/pages/tsks_screens/add_task_screen/add_task_screen.dart';
import 'package:maps/app/pages/tsks_screens/add_task_screen/add_task_screen_binding.dart';

class AddTaskPage extends GetPage{
  AddTaskPage():super(
    name: AppRoutes.addTaskScreen,
    page: ()=>AddTaskScreen(),
    binding: AddTaskScreenBinding(),
  );
}