

import 'package:evently/core/sourses/color_manager.dart';
import 'package:flutter/material.dart';

abstract class CustomDialog {
  static Future showCustomDialog(BuildContext context) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return PopScope(
          canPop: false,
          child: AlertDialog(
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            title: LinearProgressIndicator(
              color: Theme.of(context).iconTheme.color,
              backgroundColor: Theme.of(context).colorScheme.surface,
            ),
          ),
        );
      },
    );
  }

  static Future<void> waitAndPop(BuildContext context, int seconds) async {
    debugPrint("=========================\nIam Here fucntion");
    await Future.delayed(Duration(seconds: seconds));
    Navigator.pop(context);
  }
}
