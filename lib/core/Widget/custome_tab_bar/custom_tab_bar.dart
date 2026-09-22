import 'package:evently/core/Models/category_model.dart';
import 'package:evently/core/Widget/custome_tab_bar/custom_tab_bar_item.dart';
import 'package:evently/core/sourses/color_manager.dart';
import 'package:flutter/material.dart';

class CustomTabBar extends StatefulWidget {
  CustomTabBar({
    required this.selectedBGColor,
    required this.selectedFGIconColor,
    required this.selectedFGTextColor,
    required this.unSelectedBGColor,
    required this.unselectedFGIconColor,
    required this.unselectedFGTextColor,
    required this.categories,
    required this.borderColor
  });
  List<CategoryModel> categories;
  Color selectedBGColor;
  Color unSelectedBGColor;
  Color selectedFGTextColor;
  Color unselectedFGTextColor;
  Color selectedFGIconColor;
  Color unselectedFGIconColor;
  Color borderColor;

  @override
  State<CustomTabBar> createState() => _CustomTabBarState();
}

class _CustomTabBarState extends State<CustomTabBar> {
  int selectedTab = 0;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: widget.categories.length,
      child: TabBar(
        onTap: (tabIndex) {
          setState(() {
            selectedTab = tabIndex;
          });
        },
        tabAlignment: TabAlignment.start,
        isScrollable: true,
        indicatorColor: Colors.transparent,
        dividerColor: Colors.transparent,
        tabs: widget.categories
            .map(
              (category) => CustomTabBarItem(
                selectedBGColor: widget.selectedBGColor,
                unSelectedBGColor: widget.unSelectedBGColor,
                selectedFGIconColor: widget.selectedFGIconColor,
                unselectedFGIconColor: widget.unselectedFGIconColor,
                selectedFGTextColor: widget.selectedFGTextColor,
                unselectedFGTextColor: widget.unselectedFGTextColor,
                borderColor: widget.borderColor,
                category: category,
                isSelected: category.index == selectedTab,
              ),
            )
            .toList(),
      ),
    );
  }
}
