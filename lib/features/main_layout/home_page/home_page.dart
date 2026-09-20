import 'package:evently/core/sourses/color_manager.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const new({super.key});

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
          ],
        ),
      ),
    );
  }
}
