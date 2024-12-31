import 'package:get/get.dart';
import 'package:maps/app/data/models/task_model.dart';
import 'package:maps/app/services/tasks_serveice.dart';

class HomeScreenController extends GetxController {
  RxList<TaskModel> tasks = RxList([]);
RxBool load =RxBool(false);
  @override
  void onInit() {
    getFreshData();
  super.onInit();
  }
  void getFreshData () async{
    load.value=true;
    tasks.value=  await TaskService.getTasks();
     load.value=false;
  }
}
