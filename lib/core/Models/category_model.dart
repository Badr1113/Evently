import 'package:flutter/material.dart';

class CategoryModel {
  CategoryModel({
    required this.id,
    required this.label,
    required this.icon,
    required this.index,
  });
  String id;
  String label;
  IconData icon;
  int index;

  static List<CategoryModel> categories = [
    CategoryModel(id: "0",index: 0, label: "All", icon: Icons.square),
    CategoryModel(id: "1",index: 1, label: "Sport", icon: Icons.sports),
    CategoryModel(id: "2",index: 2, label: "BookClub", icon: Icons.book),
    CategoryModel(id: "3",index: 3, label: "Birthday", icon: Icons.cake),
    CategoryModel(id: "4",index: 4, label: "Meeting", icon: Icons.laptop),
    CategoryModel(id: "5",index: 5, label: "Exhibition", icon: Icons.place),
  ];
}
