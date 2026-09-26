import 'package:evently/core/Models/category_model.dart';
import 'package:evently/core/Models/event_model.dart';
import 'package:evently/core/Widget/custome_tab_bar/custom_tab_bar.dart';
import 'package:evently/core/Widget/custome_tab_bar/custom_tab_bar_item.dart';
import 'package:evently/core/Widget/event_item.dart';
import 'package:evently/core/provider/lang_provider.dart';
import 'package:evently/core/provider/theme_provider.dart';
import 'package:evently/core/sourses/assets_manager.dart';
import 'package:evently/core/sourses/color_manager.dart';
import 'package:evently/l10n/app_localizations.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = context.watch<ThemeProvider>();
    LangProvider langProvider = Provider.of<LangProvider>(context);
    AppLocalizations lang = AppLocalizations.of(context)!;
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
                      lang.welcome_back,
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
                  themeProvider.isDark
                      ? Icons.dark_mode_outlined
                      : Icons.light_mode_outlined,
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
                    langProvider.currentLan == Locale("en") ? "En" : "Ar",
                    style: TextStyle(
                      color: ColorManager.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 24),
            CustomTabBar(
              categories: [
                CategoryModel(
                  id: "0",
                  label: "All",
                  icon: Icons.square,
                ),
                ...CategoryModel.categories,
              ],
            ),
            SizedBox(height: 24),
            Expanded(
              child: ListView.separated(
                itemBuilder: (BuildContext context, int index) {
                  return EventItem(
                    event: EventModel(
                      id: "1",
                      imagePathLight: AssetsManager.lightSportImage,
                      imagePathDark: AssetsManager.darkSportImage,
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
