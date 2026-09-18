import 'package:evently/core/sourses/color_manager.dart';
import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  CustomTextButton({required this.hintText , required this.onTap});
  String hintText;
  VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Text(
        hintText,
        textAlign: TextAlign.end,
        style: TextStyle(
          decoration: TextDecoration.underline,
          decorationColor: ColorManager.primaryBlue,
          color: ColorManager.primaryBlue,
          fontSize: 14,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
