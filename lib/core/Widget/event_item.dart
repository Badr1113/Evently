import 'dart:ui';

import 'package:evently/core/Models/event_model.dart';
import 'package:evently/core/Models/user_model.dart';
import 'package:evently/core/Widget/custom_dialog.dart';
import 'package:evently/core/Widget/custom_flutter_toast.dart';
import 'package:evently/core/extintions/date_extin.dart';
import 'package:evently/core/fireBase/firebase_services.dart';
import 'package:evently/core/provider/theme_provider.dart';
import 'package:evently/core/sourses/assets_manager.dart';
import 'package:evently/core/sourses/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EventItem extends StatefulWidget {
  EventItem({required this.event});
  EventModel event;

  @override
  State<EventItem> createState() => _EventItemState();
}

class _EventItemState extends State<EventItem> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = context.watch<ThemeProvider>();
    return Container(
      height: 186,
      width: 344,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: BoxBorder.all(
          color: Theme.of(context).colorScheme.surfaceContainer,
          width: 1,
        ),
      ),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadiusGeometry.circular(16),
            child: Image.asset(
              themeProvider.isDark
                  ? widget.event.category.darkImagePath!
                  : widget.event.category.lightImagePath!,
              fit: BoxFit.fill,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Theme.of(context).colorScheme.surface,
                    border: BoxBorder.all(
                      color: Theme.of(context).colorScheme.surfaceContainer,
                      width: 1,
                    ),
                  ),
                  child: Text(
                    widget.event.eventDate.toFormattedDate,
                    style: Theme.of(context).textTheme.headlineLarge!
                        .copyWith(fontSize: 16),
                  ),
                ),
                Spacer(),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Theme.of(context).colorScheme.surface,
                    border: BoxBorder.all(
                      color: Theme.of(context).colorScheme.surfaceContainer,
                      width: 1,
                    ),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 90,
                        child: Text(
                          widget.event.title,
                          style: Theme.of(context).textTheme.displayMedium,
                        ),
                      ),
                      Expanded(
                        flex: 15,
                        child: IconButton(
                          onPressed: () async {
                            if (!isFavorite(widget.event)) {
                              UserModel.userLogged!.favoriteEventsId.add(
                                widget.event.id,
                              );
                              CustomDialog.showCustomDialog(context);
                              await FirebaseServices.updateListOfFevoritsEvents(
                                UserModel.userLogged!,
                              );
                              await CustomDialog.waitAndPop(context, 2);
                              CustomFlutterToast.showToast(
                                context,
                                "Has Been Sucssfully added",
                              );
                            } else {
                              UserModel.userLogged!.favoriteEventsId.remove(
                                widget.event.id,
                              );
                              CustomDialog.showCustomDialog(context);
                              await FirebaseServices.updateListOfFevoritsEvents(
                                UserModel.userLogged!,
                              );
                              await CustomDialog.waitAndPop(context, 2);
                              CustomFlutterToast.showToast(
                                context,
                                "Has Been Successfully deleted",
                              );
                            }
                            setState(() {});
                          },
                          icon: isFavorite(widget.event)
                              ? Icon(Icons.favorite)
                              : Icon(Icons.favorite_border),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  bool isFavorite(EventModel event) {
    if (UserModel.userLogged!.favoriteEventsId == null) {
      return false;
    }
    for (int i = 0; i < UserModel.userLogged!.favoriteEventsId!.length; i++) {
      if (event.id == UserModel.userLogged!.favoriteEventsId![i]) {
        return true;
      }
    }
    return false;
  }
}
