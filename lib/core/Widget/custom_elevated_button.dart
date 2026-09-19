import 'package:evently/core/sourses/color_manager.dart';
import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  String hintText;
  CustomElevatedButton({required this.hintText , required this.onPressed});
  VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: Theme.of(context).elevatedButtonTheme.style,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          hintText,
          style: TextStyle(
            color: ColorManager.white,
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
