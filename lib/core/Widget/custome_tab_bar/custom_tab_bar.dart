import 'package:evently/core/Models/category_model.dart';
import 'package:evently/core/Widget/custome_tab_bar/custom_tab_bar_item.dart';
import 'package:evently/core/sourses/color_manager.dart';
import 'package:flutter/material.dart';

class CustomTabBar extends StatefulWidget {
  CustomTabBar({required this.categories});
  List<CategoryModel> categories;

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
                selectedBGColor: Theme.of(context).colorScheme.onSurface,
                unSelectedBGColor: Theme.of(context).colorScheme.surface,
                selectedFGTextColor: Theme.of(context).colorScheme.onPrimary,
                unselectedFGTextColor: Theme.of(context).colorScheme.primary,
                selectedFGIconColor: Theme.of(context).colorScheme.onSecondary,
                unselectedFGIconColor: Theme.of(context).colorScheme.secondary,
                borderColor: Theme.of(context).colorScheme.surface,
                category: category,
                isSelected: widget.categories.indexOf(category) == selectedTab,
              ),
            )
            .toList(),
      ),
    );
  }
}
