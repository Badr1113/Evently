import 'package:evently/core/provider/lang_provider.dart';
import 'package:evently/core/provider/theme_provider.dart';
import 'package:evently/core/sourses/assets_manager.dart';
import 'package:evently/core/sourses/color_manager.dart';
import 'package:evently/features/main_layout/profile_page/custom_box.dart';
import 'package:evently/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    AppLocalizations lang = AppLocalizations.of(context)!;
    final themeProvider = context.watch<ThemeProvider>();
    final langProvider = context.watch<LangProvider>();
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
              title: lang.dark_mode,
              function: Switch(
                value: themeProvider.isDark,
                onChanged: (onChanged) {
                  themeProvider.changeCurrentTheme();
                },
                focusColor: ColorManager.red,
                hoverColor: ColorManager.red,
                inactiveThumbColor: ColorManager.white,
                inactiveTrackColor: Colors.grey,
                activeThumbColor: ColorManager.brightBlue,
              ),
            ),
            SizedBox(height: 16),
            CustomBox(
              title: lang.language,
              function: DropdownButton(
                underline: Container(),
                icon: Icon(
                  Icons.arrow_forward_ios,
                  color: Theme.of(context).iconTheme.color,
                ),
                items: [
                  DropdownMenuItem(value: "en", child: Text("  English ")),
                  DropdownMenuItem(value: "ar", child: Text("  Arabic ")),
                ],
                onChanged: (onChanged) {
                  if (onChanged == "en") {
                    langProvider.changeCurrentLan(Locale("en"));
                  } else {
                    langProvider.changeCurrentLan(Locale("ar"));
                  } 
                },
              ),
            ),
            SizedBox(height: 16),
            CustomBox(
              title: lang.logout,
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
