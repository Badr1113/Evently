import 'package:evently/core/sourses/assets_manager.dart';
import 'package:evently/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class CategoryModel {
  CategoryModel({
    required this.id,
    required this.label,
    required this.icon,
    this.lightImagePath,
    this.darkImagePath,
  });
  String id;
  String label;
  IconData icon;
  String? lightImagePath;
  String? darkImagePath;

  static List<CategoryModel> categories = [
    CategoryModel(
      id: "0",
      label: "Sport",
      icon: Icons.sports,
      lightImagePath: AssetsManager.lightSportImage,
      darkImagePath: AssetsManager.darkSportImage,
    ),
    CategoryModel(
      id: "1",
      label: "BookClub",
      icon: Icons.book,
      lightImagePath: AssetsManager.lightBookclubImage,
      darkImagePath: AssetsManager.darkBookclubImage,
    ),
    CategoryModel(
      id: "2",
      label: "Birthday",
      icon: Icons.cake,
      lightImagePath: AssetsManager.lightBirthdayImage,
      darkImagePath: AssetsManager.darkBirthdayImage,
    ),
    CategoryModel(
      id: "3",
      label: "Meeting",
      icon: Icons.laptop,
      lightImagePath: AssetsManager.lightMeetingImage,
      darkImagePath: AssetsManager.darkMeetingImage,
    ),
    CategoryModel(
      id: "4",
      label: "Exhibition",
      icon: Icons.place,
      lightImagePath: AssetsManager.lightExhibitionImage,
      darkImagePath: AssetsManager.darkExhibitionImage,
    ),
  ];
}
