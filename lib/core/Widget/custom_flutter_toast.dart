import 'package:evently/core/sourses/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

abstract class CustomFlutterToast {
  static Future<bool?> showToast(BuildContext context,String msg) {
    return Fluttertoast.showToast(
      msg: msg,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Theme.of(context).colorScheme.onSurface,
      textColor: ColorManager.white,
    );
  }
}
