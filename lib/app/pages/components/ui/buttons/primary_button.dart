import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final String label;
  const PrimaryButton({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {},
      child: Text(label,),
    );
  }
}
