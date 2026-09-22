import 'package:evently/core/sourses/color_manager.dart';
import 'package:flutter/material.dart';

class CustomBox extends StatelessWidget {
  CustomBox({required this.title, required this.function});
  Widget function;
  String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      decoration: BoxDecoration(
        border: BoxBorder.all(
          color: Theme.of(context).colorScheme.surfaceContainer,
        ),
        borderRadius: BorderRadius.circular(16),
        color: Theme.of(context).primaryColor,
      ),
      child: Row(
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.displayMedium!
                .copyWith(fontSize: 16),
          ),
          Spacer(),
          function,
        ],
      ),
    );
  }
}
