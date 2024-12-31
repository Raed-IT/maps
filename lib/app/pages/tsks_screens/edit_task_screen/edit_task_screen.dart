
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
 import 'package:maps/app/data/colors.dart';
import 'package:maps/app/pages/components/ui/buttons/primary_button.dart';
import 'package:maps/app/pages/components/ui/fields/text_field.dart';
 import 'package:maps/app/pages/tsks_screens/edit_task_screen/edit_task_screen_controller.dart';

class EditTaskScreen extends GetView<EditTaskScreenController> {
  const EditTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: AppColors.card,
        ),
        title: const Text(
          "Add New Task ",
          style: TextStyle(
            color: AppColors.card,
            shadows: [
              Shadow(
                color: Colors.black,
                offset: Offset(0, 2),
                blurRadius: 0,
              ),
            ],
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 17.w, vertical: 39.h),
        child: Form(
          key: controller.formKey,
          child: Column(
            children: [
              TextFieldComponent(
                label: "Task Name * ",
                controller: controller.tasNameController,
                validator: (data)=>data!.isEmpty?"Task Name Required":null,
              ),
              14.verticalSpace,
              TextFieldComponent(
                label: "Task Description ",
                controller: controller.tasDescriptionController,
                isMultiLine: true,
              ),
              Spacer(),
              PrimaryButton(label: "save",onPressed: ()=>controller.save())
            ],
          ),
        ),
      ),
    );
  }
}
