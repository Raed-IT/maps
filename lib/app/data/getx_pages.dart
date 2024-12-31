import 'package:get/get.dart';
import 'package:maps/app/pages/home_screen/home_screen_page.dart';
import 'package:maps/app/pages/splash_screen/splash_screen_page.dart';
import 'package:maps/app/pages/tsks_screens/add_task_screen/add_task_page.dart';
import 'package:maps/app/pages/tsks_screens/edit_task_screen/edit_task_page.dart';

class GetPagesProvider {
  static List<GetPage> getPages = [
    SplashPage(),
    HomePage(),
    AddTaskPage(),
    EditTaskPage()
    ];
}
