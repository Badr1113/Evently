import 'package:evently/core/Models/category_model.dart';
import 'package:evently/core/Widget/custome_tab_bar/custom_tab_bar.dart';
import 'package:evently/core/Widget/custome_tab_bar/custom_tab_bar_item.dart';
import 'package:evently/core/Widget/event_item.dart';
import 'package:evently/core/sourses/assets_manager.dart';
import 'package:evently/core/sourses/color_manager.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SizedBox(height: 24),
            Row(
              children: [
                Column(
                  children: [
                    Text(
                      "Welcome Back ✨",
                      style: Theme.of(context).textTheme.labelSmall,
                    ),
                    SizedBox(height: 2),
                    Text(
                      "Badr Waleed",
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ],
                ),
                Spacer(),
                Icon(
                  Icons.light_mode_outlined,
                  color: ColorManager.primaryBlue,
                ),
                SizedBox(width: 8),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                  decoration: BoxDecoration(
                    color: ColorManager.primaryBlue,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    "En",
                    style: TextStyle(
                      color: ColorManager.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            CustomTabBar(
              selectedBGColor: ColorManager.primaryBlue,
              unSelectedBGColor: ColorManager.background,
              selectedFGTextColor: ColorManager.white,
              unselectedFGTextColor: ColorManager.black,
              selectedFGIconColor: ColorManager.white,
              unselectedFGIconColor: ColorManager.primaryBlue,
              categories: CategoryModel.categories,
            ),
            SizedBox(height: 24),
            Expanded(
              child: ListView.separated(
                itemBuilder: (BuildContext context, int index) {
                  return EventItem();
                },
                itemCount: 5, separatorBuilder: (BuildContext context, int index) { 
                  return SizedBox(height: 16,);
                 },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
