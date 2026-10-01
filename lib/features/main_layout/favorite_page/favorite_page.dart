import 'package:evently/core/Models/category_model.dart';
import 'package:evently/core/Models/event_model.dart';
import 'package:evently/core/Widget/custom_outlined_text_feild.dart';
import 'package:evently/core/Widget/event_item.dart';
import 'package:evently/core/sourses/assets_manager.dart';
import 'package:evently/core/sourses/color_manager.dart';
import 'package:evently/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class FavoritePage extends StatefulWidget {
  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  late TextEditingController searchController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    searchController = TextEditingController();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    AppLocalizations lang = AppLocalizations.of(context)!;
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            CustomOutlinedTextFeild(
              hintText: lang.search_for_event,
              controller: searchController,
              suffixIcon: Icon(
                Icons.search,
                color: Theme.of(context).iconTheme.color,
              ),
              maxLines: 2,
            ),
            SizedBox(height: 16),
            Expanded(
              child: ListView.separated(
                itemBuilder: (BuildContext context, int index) {
                  return EventItem(
                    event: EventModel(
                      id: "1",
                      category: CategoryModel.categories[1],
                      title: "This Is Birthday Party",
                      description: "Event Description",
                      eventDate: DateTime.now(),
                      eventTime: TimeOfDay.now(),
                      imagePathLight: AssetsManager.lightSportImage,
                      imagePathDark: AssetsManager.darkSportImage,
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
