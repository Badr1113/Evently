import 'package:evently/core/Models/category_model.dart';
import 'package:evently/core/sourses/color_manager.dart';
import 'package:flutter/material.dart';

class CustomTabBarItem extends StatelessWidget {
  CustomTabBarItem({
    required this.selectedBGColor,
    required this.unSelectedBGColor,
    required this.selectedFGTextColor,
    required this.unselectedFGTextColor,
    required this.category,
    required this.isSelected,
    required this.selectedFGIconColor,
    required this.unselectedFGIconColor,
    required this.borderColor,
  });

  Color selectedBGColor;
  Color unSelectedBGColor;
  Color selectedFGTextColor;
  Color unselectedFGTextColor;
  Color selectedFGIconColor;
  Color unselectedFGIconColor;
  Color borderColor;
  CategoryModel category;
  bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        border: isSelected ? null : BoxBorder.all(color: borderColor, width: 2),
        color: isSelected ? selectedBGColor : unSelectedBGColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Icon(
            category.icon,
            color: isSelected ? selectedFGIconColor : unselectedFGIconColor,
          ),
          SizedBox(width: 8),
          Text(
            category.label,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: isSelected ? selectedFGTextColor : unselectedFGTextColor,
            ),
          ),
        ],
      ),
    );
  }
}
