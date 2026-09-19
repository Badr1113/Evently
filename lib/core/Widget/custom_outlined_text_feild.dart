import 'package:evently/core/sourses/color_manager.dart';
import 'package:flutter/material.dart';

class CustomOutlinedTextFeild extends StatelessWidget {
  CustomOutlinedTextFeild({
    super.key,
    required this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    required this.controller,
    required this.validator,
  });
  String hintText;
  Widget? prefixIcon;
  Widget? suffixIcon;
  TextEditingController
  controller; // dont forget after you finishid to make it not accept "Null"
  String? Function(String?)
  validator; //dont forget after you finishid to make it not accept "Null"
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      style:Theme.of(context).textTheme.labelSmall,
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
      ),
    );
  }
}
