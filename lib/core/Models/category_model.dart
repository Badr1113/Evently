import 'package:evently/core/sourses/assets_manager.dart';
import 'package:evently/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class CategoryModel {
  CategoryModel({
    required this.id,
    required this.label,
    required this.icon,
  });
  String id;
  String label;
  IconData icon;

  static List<CategoryModel> categories = [
    // dont forget to change every item Image
    CategoryModel(
      id: "1",
      label: "Sport",
      icon: Icons.sports,
    ),
    CategoryModel(
      id: "2",
      label: "BookClub",
      icon: Icons.book,
    ),
    CategoryModel(
      id: "3",
      label: "Birthday",
      icon: Icons.cake,

    ),
    CategoryModel(
      id: "4",
      label: "Meeting",
      icon: Icons.laptop,

    ),
    CategoryModel(
      id: "5",
      label: "Exhibition",
      icon: Icons.place,

    ),
  ];
}
