import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maps/app/data/colors.dart';

class TextFieldComponent extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final bool isMultiLine;
  String? Function(String?)? validator;

  TextFieldComponent({super.key,
    required this.label,
    required this.controller,
    this.isMultiLine = false,
    this.validator});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 16.sp,
            letterSpacing: (16.sp * 11) / 100,
          ),
        ),
        14.verticalSpace,
        TextFormField(
          validator:validator,
          minLines: isMultiLine ? 5 : 1,
          maxLines: isMultiLine ? 15 : 1,
          keyboardType: isMultiLine ? TextInputType.multiline : null,
          controller: controller,
          decoration: InputDecoration(
            filled: true,
            fillColor: AppColors.card,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(9.sp),
              borderSide: BorderSide(
                color: AppColors.divider,
                width: 2.sp,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(9.sp),
              borderSide: BorderSide(
                color: AppColors.divider,
                width: 2.sp,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(9.sp),
              borderSide: BorderSide(
                color: AppColors.divider,
                width: 2.sp,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
