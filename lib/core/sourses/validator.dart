import 'package:evently/l10n/app_localizations.dart';
import 'package:flutter/material.dart';


abstract class Validator {
  static String? validateName(String? name,BuildContext context) {
    if (name == null || name.trim().isEmpty) {
      return AppLocalizations.of(context)!.this_field_is_required;
    }
    if (name.length < 4) {
      return AppLocalizations.of(context)!.name_validator_msg;
    }
  }

  static String? validateEmail(String? email,BuildContext context) {
    RegExp emailRegExp = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
    );
    if (email == null || email.trim().isEmpty) {
      return AppLocalizations.of(context)!.this_field_is_required;
    }
    if (!emailRegExp.hasMatch(email)) {
      return AppLocalizations.of(context)!.invalid_email;
    }
  }

  static String? validatePassword(String? password,BuildContext context) {
    RegExp passwordRegExp = RegExp(
      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$',
    );
    if (password == null || password.trim().isEmpty) {
      return AppLocalizations.of(context)!.this_field_is_required;
    }
    if (!passwordRegExp.hasMatch(password)) {
      return AppLocalizations.of(context)!.invalid_password;
    }
  }


}
