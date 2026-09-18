import 'package:flutter/material.dart';

abstract class Validator {
  static String? validateName(String? name) {
    if (name == null || name.trim().isEmpty) {
      return "This Field Is Required";
    }
    if (name.length < 4) {
      return "Name Must Be 4 or more";
    }
  }

  static String? validateEmail(String? email) {
    RegExp emailRegExp = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
    );
    if (email == null || email.trim().isEmpty) {
      return "This Field Is Required";
    }
    if (!emailRegExp.hasMatch(email)) {
      return "Invalid Email";
    }
  }

  static String? validatePassword(String? password) {
    RegExp passwordRegExp = RegExp(
      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$',
    );
    if (password == null || password.trim().isEmpty) {
      return "This Field Is Required";
    }
    if (!passwordRegExp.hasMatch(password)) {
      return "Invalid Password";
    }
  }


}
