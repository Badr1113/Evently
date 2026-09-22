import 'package:evently/core/Models/event_model.dart';
import 'package:evently/core/sourses/assets_manager.dart';
import 'package:evently/core/sourses/color_manager.dart';
import 'package:flutter/material.dart';

class EventItem extends StatelessWidget {
  EventItem({required this.event});
  EventModel event;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 193,
      width: 343,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: BoxBorder.all(color: ColorManager.offWhite, width: 1),
      ),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadiusGeometry.circular(16),
            child: Image.asset(event.imagePath),
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
                    color: ColorManager.background,
                    border: BoxBorder.all(
                      color: ColorManager.offWhite,
                      width: 1,
                    ),
                  ),
                  child: Text(
                    event.eventDate.toString(),
                    style: Theme.of(context).textTheme.headlineLarge!
                        .copyWith(fontSize: 16),
                  ),
                ),
                Spacer(),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: ColorManager.background,
                    border: BoxBorder.all(
                      color: ColorManager.offWhite,
                      width: 1,
                    ),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 90,
                        child: Text(
                          event.title,
                          style: Theme.of(context).textTheme.displayMedium,
                        ),
                      ),
                      // Spacer(),
                      Expanded(
                        flex: 10,
                        child: IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.favorite, size: 20),
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
}
