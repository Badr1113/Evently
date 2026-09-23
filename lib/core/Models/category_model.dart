import 'package:evently/core/sourses/assets_manager.dart';
import 'package:evently/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class CategoryModel {
  CategoryModel({
    required this.id,
    required this.label,
    required this.icon,
    required this.index,
    required this.imagePath,
  });
  String id;
  String label;
  IconData icon;
  int index;
  String imagePath;

  static List<CategoryModel> categories = [
    // dont forget to change every item Image
    CategoryModel(
      id: "0",
      index: 0,
      label: "All",
      icon: Icons.square,
      imagePath: AssetsManager.sportImage,
    ),
    CategoryModel(
      id: "1",
      index: 1,
      label: "Sport",
      icon: Icons.sports,
      imagePath: AssetsManager.sportImage,
    ),
    CategoryModel(
      id: "2",
      index: 2,
      label: "BookClub",
      icon: Icons.book,
      imagePath: AssetsManager.sportImage,
    ),
    CategoryModel(
      id: "3",
      index: 3,
      label: "Birthday",
      icon: Icons.cake,
      imagePath: AssetsManager.sportImage,
    ),
    CategoryModel(
      id: "4",
      index: 4,
      label: "Meeting",
      icon: Icons.laptop,
      imagePath: AssetsManager.sportImage,
    ),
    CategoryModel(
      id: "5",
      index: 5,
      label: "Exhibition",
      icon: Icons.place,
      imagePath: AssetsManager.sportImage,
    ),
  ];
}
