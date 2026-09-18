import 'package:evently/core/sourses/color_manager.dart';
import 'package:flutter/material.dart';

class CustomOutlinedTextFeild extends StatelessWidget {
  CustomOutlinedTextFeild({
    super.key,
    required this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    this.controller,
    this.validator,
  });
  String hintText;
  Widget? prefixIcon;
  Widget? suffixIcon;
  TextEditingController?
  controller; // dont forget after you finishid to make it not accept "Null"
  String? Function(String?)?
  validator; //dont forget after you finishid to make it not accept "Null"
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(color: ColorManager.darkGray),
        prefixIcon: prefixIcon,
        prefixIconColor: ColorManager.lightGray,
        suffixIconColor: ColorManager.lightGray,
        suffixIcon: suffixIcon,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: ColorManager.primaryBlue),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: ColorManager.red),
          borderRadius: BorderRadius.circular(16)
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: ColorManager.lightGray),
        ),
      ),
    );
  }
}
