import 'package:flutter/material.dart';

class LangProvider extends ChangeNotifier {
  Locale currentLan = Locale("en");

  void changeCurrentLan(Locale lan) {
    if (currentLan == lan) return;
    currentLan = lan;
    notifyListeners();
  }
}
