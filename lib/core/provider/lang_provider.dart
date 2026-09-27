import 'package:evently/core/local_storage/prefs_manager.dart';
import 'package:flutter/material.dart';

class LangProvider extends ChangeNotifier {
  Locale currentLan = PrefsManager.getLang ?? Locale("en");

  void changeCurrentLan(Locale lan) {
    if (currentLan == lan) return;
    currentLan = lan;
    PrefsManager.storeLang(currentLan);
    notifyListeners();
  }
}
