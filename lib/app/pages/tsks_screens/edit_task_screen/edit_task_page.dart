import 'package:get/get.dart';
import 'package:maps/app/data/routes.dart';
import 'package:maps/app/pages/tsks_screens/edit_task_screen/edit_task_screen.dart';
import 'package:maps/app/pages/tsks_screens/edit_task_screen/edit_task_screen_binding.dart';

class EditTaskPage extends GetPage {
  EditTaskPage()
      : super(
          name: AppRoutes.editTaskScreen,
          page: () => EditTaskScreen(),
          binding: EditTaskScreenBinding(),
        );
}
