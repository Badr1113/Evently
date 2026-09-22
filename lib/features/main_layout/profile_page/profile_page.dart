import 'package:evently/core/sourses/assets_manager.dart';
import 'package:evently/core/sourses/color_manager.dart';
import 'package:evently/features/main_layout/profile_page/custom_box.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SizedBox(height: 32),
            ClipRRect(
              borderRadius: BorderRadiusGeometry.circular(100),
              child: Image.asset(
                AssetsManager.profileImage,
                fit: BoxFit.fill,
                height: 104,
                width: 104,
              ),
            ),
            SizedBox(height: 16),
            Text(
              "Badr Waleed",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.displayMedium!
                  .copyWith(fontSize: 20, fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 4),
            Text(
              "BadrWaleed.route@gmail.com",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.labelSmall,
            ),
            SizedBox(height: 32),
            CustomBox(
              title: "Dark Mode",
              function: Switch(
                value: false,
                onChanged: (onChanged) {},
                focusColor: ColorManager.red,
                hoverColor: ColorManager.red,
                inactiveThumbColor: ColorManager.white,
                inactiveTrackColor: Colors.grey,
                activeThumbColor: ColorManager.brightBlue,
              ),
            ),
            SizedBox(height: 16),
            CustomBox(
              title: "Language",
              function: DropdownButton(
                value: 1,
                items: [
                  DropdownMenuItem(value: 1, child: Text("  English ")),
                  DropdownMenuItem(value: 2, child: Text("  Arabic ")),
                ],
                onChanged: (onChanged) {},
              ),
            ),
            SizedBox(height: 16),
            CustomBox(
              title: "Logout",
              function: IconButton(
                onPressed: () {},
                icon: Icon(Icons.logout, color: ColorManager.red),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
