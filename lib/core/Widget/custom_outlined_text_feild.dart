import 'package:evently/core/sourses/color_manager.dart';
import 'package:flutter/material.dart';

class CustomOutlinedTextFeild extends StatelessWidget {
  CustomOutlinedTextFeild({
    super.key,
    required this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    required this.controller,
    this.validator,
    this.maxLines
  });
  String hintText;
  Widget? prefixIcon;
  Widget? suffixIcon;
  TextEditingController controller;
  String? Function(String?)? validator;
  int? maxLines;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxLines,
      controller: controller,
      validator: validator,
      style: Theme.of(context).textTheme.labelSmall,
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
      ),
    );
  }
}
