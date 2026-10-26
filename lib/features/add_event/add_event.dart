import 'package:evently/core/Models/category_model.dart';
import 'package:evently/core/Models/event_model.dart';
import 'package:evently/core/Models/user_model.dart';
import 'package:evently/core/Widget/custom_dialog.dart';
import 'package:evently/core/Widget/custom_elevated_button.dart';
import 'package:evently/core/Widget/custom_flutter_toast.dart';
import 'package:evently/core/Widget/custom_outlined_text_feild.dart';
import 'package:evently/core/Widget/custome_tab_bar/custom_tab_bar.dart';
import 'package:evently/core/extintions/date_extin.dart';
import 'package:evently/core/fireBase/firebase_services.dart';
import 'package:evently/core/provider/theme_provider.dart';
import 'package:evently/core/sourses/assets_manager.dart';
import 'package:evently/features/auth/widgets/custom_text_button.dart';
import 'package:evently/l10n/app_localizations.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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

  DateTime? eventDateTime;

  CategoryModel selectedCategory = CategoryModel.categories[0];
  @override
  Widget build(BuildContext context) {
    EventModel? eventdetails =
        ModalRoute.of(context)!.settings.arguments as EventModel;
    AppLocalizations lang = AppLocalizations.of(context)!;
    final themeProvider = context.watch<ThemeProvider>();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: _appBar(lang),
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
                borderRadius: BorderRadius.circular(16),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset(
                  themeProvider.isDark
                      ? selectedCategory.darkImagePath!
                      : selectedCategory.lightImagePath!,
                ),
              ),
            ),
            SizedBox(height: 16),
            CustomTabBar(
              categories: CategoryModel.categories,
              getCategory: (category) {
                setState(() {
                  selectedCategory = category;
                });
              },
            ),
            SizedBox(height: 16),
            Text(
              lang.title,
              textAlign: TextAlign.start,
              style: Theme.of(context).textTheme.titleLarge!
                  .copyWith(fontSize: 16),
            ),
            CustomOutlinedTextFeild(
              hintText: lang.event_title,
              controller: eventTitleController,
              maxLines: 1,
            ),
            SizedBox(height: 16),
            Text(
              lang.description,
              textAlign: TextAlign.start,
              style: Theme.of(context).textTheme.titleLarge!
                  .copyWith(fontSize: 16),
            ),
            CustomOutlinedTextFeild(
              hintText: lang.event_description,
              controller: eventDescriptionController,
              maxLines: 7,
            ),
            SizedBox(height: 16),
            Row(
              children: [
                Icon(Icons.date_range),
                SizedBox(width: 8),
                Text(
                  eventDateTime == null
                      ? lang.choose_date
                      : eventDateTime!.toFormattedDate2.toString(),
                  textAlign: TextAlign.start,
                  style: Theme.of(context).textTheme.titleLarge!
                      .copyWith(fontSize: 16),
                ),
                Spacer(),
                CustomTextButton(
                  hintText: lang.choose_date,
                  onTap: () async {
                    TimeOfDay eventTime = TimeOfDay(
                      hour: eventDateTime?.hour ?? 00,
                      minute: eventDateTime?.minute ?? 00,
                    );
                    eventDateTime =
                        await showDatePicker(
                          context: context,
                          firstDate: DateTime.now(),
                          lastDate: DateTime.now().add(Duration(days: 730)),
                          initialDate: DateTime.now(),
                        ) ??
                        DateTime.now();
                    eventDateTime = eventDateTime = DateTime(
                      eventDateTime!.year,
                      eventDateTime!.month,
                      eventDateTime!.day,
                      eventTime.hour,
                      eventTime.minute,
                    );
                    setState(() {});
                  },
                ),
              ],
            ),
            SizedBox(height: 16),
            Row(
              children: [
                Icon(Icons.av_timer),
                SizedBox(width: 8),
                Text(
                  eventDateTime == null
                      ? lang.event_time
                      : eventDateTime!.toFormattedTime,
                  textAlign: TextAlign.start,
                  style: Theme.of(context).textTheme.titleLarge!
                      .copyWith(fontSize: 16),
                ),
                Spacer(),
                CustomTextButton(
                  hintText: lang.choose_time,
                  onTap: () async {
                    TimeOfDay eventTime =
                        await showTimePicker(
                          context: context,
                          initialTime: TimeOfDay.now(),
                        ) ??
                        TimeOfDay.now();
                    eventDateTime = DateTime(
                      eventDateTime!.year,
                      eventDateTime!.month,
                      eventDateTime!.day,
                      eventTime.hour,
                      eventTime.minute,
                    );
                    setState(() {});
                  },
                ),
              ],
            ),
            Spacer(),
            CustomElevatedButton(
              hintText: lang.add_event,
              onPressed: () {
                _onPress(lang);
              },
            ),
          ],
        ),
      ),
    );
  }

  void _onPress(AppLocalizations lang) async {
    CustomDialog.showCustomDialog(context);
    await FirebaseServices.addEventToFireStore(
      EventModel(
        ownerId: UserModel.userLogged!.id,
        id: "",
        category: selectedCategory,
        title: eventTitleController.text,
        description: eventDescriptionController.text,
        eventDate: eventDateTime!,
      ),
    );
    await CustomDialog.waitAndPop(context, 2);
    Navigator.pop(context);
    CustomFlutterToast.showToast(context, lang.event_created);
  }

  AppBar _appBar(AppLocalizations lang) {
    return AppBar(title: Text(lang.add_event), centerTitle: true);
  }
}
