import 'package:evently/core/Models/category_model.dart';
import 'package:evently/core/Models/event_model.dart';
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
                  color: Theme.of(context).iconTheme.color,
                ),
                SizedBox(width: 8),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.onSurface,
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
            SizedBox(height:24 ,),
            CustomTabBar(
              selectedBGColor: Theme.of(context).colorScheme.onSurface,
              unSelectedBGColor: Theme.of(context).colorScheme.surface,
              selectedFGTextColor: Theme.of(context).colorScheme.onPrimary,
              unselectedFGTextColor: Theme.of(context).colorScheme.primary,
              selectedFGIconColor: Theme.of(context).colorScheme.onSecondary,
              unselectedFGIconColor: Theme.of(context).colorScheme.secondary,
              borderColor: Theme.of(context).colorScheme.surface,
              categories: CategoryModel.categories,
            ),
            SizedBox(height: 24),
            Expanded(
              child: ListView.separated(
                itemBuilder: (BuildContext context, int index) {
                  return EventItem(
                    event: EventModel(
                      id: "1",
                      imagePath: AssetsManager.sportImage,
                      category: CategoryModel.categories[1],
                      title: "This Is Birthday Party",
                      description: "Event Description",
                      eventDate: DateTime.now(),
                      eventTime: TimeOfDay.now(),
                    ),
                  );
                },
                itemCount: 5,
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(height: 16);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
