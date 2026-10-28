import 'package:evently/config/theme/theme_manager.dart';
import 'package:evently/core/Models/event_model.dart';
import 'package:evently/core/Models/user_model.dart';
import 'package:evently/core/Widget/custom_dialog.dart';
import 'package:evently/core/Widget/custom_flutter_toast.dart';
import 'package:evently/core/Widget/custome_tab_bar/custom_tab_bar.dart';
import 'package:evently/core/extintions/date_extin.dart';
import 'package:evently/core/fireBase/firebase_services.dart';
import 'package:evently/core/provider/theme_provider.dart';
import 'package:evently/core/sourses/assets_manager.dart';
import 'package:evently/core/sourses/color_manager.dart';
import 'package:evently/core/sourses/routes_manager.dart';
import 'package:evently/l10n/app_localizations.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EventDetails extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    EventModel eventDetails =
        ModalRoute.of(context)!.settings.arguments as EventModel;
    ThemeProvider themeProvider = context.watch<ThemeProvider>();
    AppLocalizations lang = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(
        actionsPadding: EdgeInsets.only(right: 8),
        title: Text(lang.event_details),
        centerTitle: true,
        actions: eventDetails.ownerId == UserModel.userLogged!.id
            ? [
                InkWell(
                  onTap: () {
                    Navigator.pushReplacementNamed(
                      context,
                      RoutesManager.addEventScreen,
                      arguments: eventDetails,
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Theme.of(context).colorScheme.onPrimary,
                        border: BoxBorder.all(
                          color: Theme.of(context).colorScheme.surfaceContainer,
                        ),
                      ),
                      child: Image.asset(
                        AssetsManager.editIcon,
                        color: Theme.of(context).iconTheme.color,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 8),
                InkWell(
                  onTap: () async {
                    CustomDialog.showCustomDialog(context);
                    await FirebaseServices.deleteEventFromFireStore(
                      eventDetails,
                    );
                    UserModel.userLogged!.favoriteEventsId.remove(
                      eventDetails.id,
                    );
                    await FirebaseServices.updateListOfFavoritesEvents(
                      UserModel.userLogged!,
                    );
                    await CustomDialog.waitAndPop(context, 2);
                    Navigator.pop(context);
                    CustomFlutterToast.showToast(
                      context,
                      lang.event_has_been_deleted,
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Theme.of(context).colorScheme.onPrimary,
                        border: BoxBorder.all(
                          color: Theme.of(context).colorScheme.surfaceContainer,
                        ),
                      ),
                      child: Image.asset(AssetsManager.trashIcon),
                    ),
                  ),
                ),
              ]
            : null,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                border: BoxBorder.all(
                  color: Theme.of(context).colorScheme.surfaceContainer,
                ),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset(
                  themeProvider.isDark
                      ? eventDetails.category.darkImagePath!
                      : eventDetails.category.lightImagePath!,
                ),
              ),
            ),
            SizedBox(height: 16),
            Text(
              textAlign: TextAlign.start,
              eventDetails.title,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            SizedBox(height: 16),
            Container(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.onPrimary,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Theme.of(context).colorScheme.surface,
                        border: BoxBorder.all(
                          color: Theme.of(context).colorScheme.surfaceContainer,
                        ),
                      ),
                      child: Image.asset(
                        AssetsManager.calendarIcon,
                        color: Theme.of(context).iconTheme.color,
                      ),
                    ),
                    SizedBox(width: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          eventDetails.eventDate.toFormattedDate3,
                          style: Theme.of(context).textTheme.titleLarge!
                              .copyWith(fontSize: 16),
                        ),
                        SizedBox(height: 8),
                        Text(
                          eventDetails.eventDate.toFormattedTime,
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16),
            Text(
              lang.description,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            SizedBox(height: 8),
            Container(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.onPrimary,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Text(
                  eventDetails.description,
                  style: Theme.of(context).textTheme.titleLarge!
                      .copyWith(fontSize: 14, fontWeight: FontWeight.w400),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
