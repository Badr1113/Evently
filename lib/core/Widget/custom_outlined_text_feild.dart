import 'package:evently/core/sourses/color_manager.dart';
import 'package:flutter/material.dart';

class CustomOutlinedTextFeild extends StatelessWidget {
  CustomOutlinedTextFeild({
    super.key,
    required this.hintText,
    this.prefixIcon,
    this.suffixIcon,
  });
  String hintText;
  Widget? prefixIcon;
  Widget? suffixIcon;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
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
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: ColorManager.lightGray),
        ),
      ),
    );
  }
}
