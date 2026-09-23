import 'package:evently/core/Models/category_model.dart';
import 'package:evently/core/Widget/custom_elevated_button.dart';
import 'package:evently/core/Widget/custom_outlined_text_feild.dart';
import 'package:evently/core/Widget/custome_tab_bar/custom_tab_bar.dart';
import 'package:evently/core/sourses/assets_manager.dart';
import 'package:evently/features/auth/widgets/custom_text_button.dart';
import 'package:evently/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class AddEventScreen extends StatefulWidget {
  const new({super.key});

  @override
  State<AddEventScreen> createState() => _AddEventScreenState();
}

class _AddEventScreenState extends State<AddEventScreen> {
  late TextEditingController eventTitleController;
  late TextEditingController eventDescriptionController;
  @override
  void initState() {
    super.initState();
    eventTitleController = TextEditingController();
    eventDescriptionController = TextEditingController();
  }

  @override
  void dispose() {
    eventTitleController.dispose();
    eventDescriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              decoration: BoxDecoration(
                border: BoxBorder.all(
                  color: Theme.of(context).colorScheme.surfaceContainer,
                ),
                borderRadius: BorderRadius.circular(16)
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset(AssetsManager.sportImage),
              ),
            ),
            SizedBox(height: 16),
            CustomTabBar(categories: CategoryModel.categories),
            SizedBox(height: 16),
            Text(
              "Title",
              textAlign: TextAlign.start,
              style: Theme.of(context).textTheme.titleLarge!
                  .copyWith(fontSize: 16),
            ),
            CustomOutlinedTextFeild(
              hintText: "Event Title",
              controller: eventTitleController,
            ),
            SizedBox(height: 16),
            Text(
              "Description",
              textAlign: TextAlign.start,
              style: Theme.of(context).textTheme.titleLarge!
                  .copyWith(fontSize: 16),
            ),
            CustomOutlinedTextFeild(
              hintText: "Event Description....",
              controller: eventDescriptionController,
              maxLines: 7,
            ),
            SizedBox(height: 16),
            Row(
              children: [
                Icon(Icons.date_range),
                SizedBox(width: 8),
                Text(
                  "Event Date",
                  textAlign: TextAlign.start,
                  style: Theme.of(context).textTheme.titleLarge!
                      .copyWith(fontSize: 16),
                ),
                Spacer(),
                CustomTextButton(hintText: "Choose date", onTap: () {}),
              ],
            ),
            SizedBox(height: 16),
            Row(
              children: [
                Icon(Icons.av_timer),
                SizedBox(width: 8),
                Text(
                  "Event Time",
                  textAlign: TextAlign.start,
                  style: Theme.of(context).textTheme.titleLarge!
                      .copyWith(fontSize: 16),
                ),
                Spacer(),
                CustomTextButton(hintText: "Choose time", onTap: () {}),
              ],
            ),
            Spacer(),
            CustomElevatedButton(hintText: "Add Event", onPressed: () {}),
          ],
        ),
      ),
    );
  }

  AppBar _appBar() {
    return AppBar(title: Text("Add Event"), centerTitle: true);
  }
}
