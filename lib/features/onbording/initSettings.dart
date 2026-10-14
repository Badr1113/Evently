import 'package:evently/config/theme/theme_manager.dart';
import 'package:evently/core/Models/onbording_model.dart';
import 'package:evently/core/Widget/custom_elevated_button.dart';
import 'package:evently/core/provider/lang_provider.dart';
import 'package:evently/core/provider/theme_provider.dart';
import 'package:evently/core/sourses/assets_manager.dart';
import 'package:evently/core/sourses/color_manager.dart';
import 'package:evently/core/sourses/routes_manager.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/*

 OnbordingModel(
      lightimagePath: AssetsManager.onbordinglight1,
      darkimagePath: AssetsManager.onbordingdark1,
      title: "Personalize Your Experience",
      description: ,
    ),

 */

class initSettings extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    LangProvider langProvider = context.watch<LangProvider>();
    ThemeProvider themeProvider = context.watch<ThemeProvider>();
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset(
                themeProvider.isDark
                    ? AssetsManager.main_logo_dark
                    : AssetsManager.main_logo_light,
                height: 27,
              ),
              SizedBox(height: 24),
              Column(
                children: [
                  Image.asset(
                    themeProvider.isDark
                        ? AssetsManager.onbordingdark1
                        : AssetsManager.onbordinglight1,
                    height: 343,
                    fit: BoxFit.fill,
                  ),
                  SizedBox(height: 24),
                  Text(
                    "Personalize Your Experience",
                    textAlign: TextAlign.start,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  SizedBox(height: 8),
                  Text(
                    "Choose your preferred theme andlanguage to get started with a comfortable, tailored experience that suits your style.",
                    textAlign: TextAlign.start,
                    style: Theme.of(context).textTheme.labelSmall!
                        .copyWith(fontSize: 16),
                  ),
                  SizedBox(height: 16),

                  Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            "Language",
                            style: Theme.of(context).textTheme.labelMedium,
                          ),
                          Spacer(),
                          InkWell(
                            onTap: () {
                              if (langProvider.isEN) {
                                return;
                              }
                              langProvider.changeCurrentLan(Locale("en"));
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 6,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: langProvider.isEN
                                    ? Theme.of(context).colorScheme.onSurface
                                    : Theme.of(context).colorScheme.surface,
                                border: langProvider.isEN
                                    ? null
                                    : BoxBorder.all(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .surfaceContainer,
                                      ),
                              ),
                              child: Text(
                                "English",
                                style: TextStyle(
                                  color: langProvider.isEN
                                      ? ColorManager.white
                                      : Theme.of(context).colorScheme.tertiary,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 8),
                          InkWell(
                            onTap: () {
                              if (langProvider.isEN) {
                                langProvider.changeCurrentLan(Locale("ar"));
                              }
                              return;
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 6,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: langProvider.isEN
                                    ? Theme.of(context).colorScheme.surface
                                    : Theme.of(context).colorScheme.onSurface,
                                border: langProvider.isEN
                                    ? BoxBorder.all(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .surfaceContainer,
                                      )
                                    : null,
                              ),
                              child: Text(
                                "Arabic",
                                style: TextStyle(
                                  color: langProvider.isEN
                                      ? Theme.of(context).colorScheme.tertiary
                                      : ColorManager.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 16),
                      Row(
                        children: [
                          Text(
                            "Theme",
                            style: Theme.of(context).textTheme.labelMedium,
                          ),
                          Spacer(),
                          InkWell(
                            onTap: () {
                              if (themeProvider.isDark) {
                                themeProvider.changeCurrentTheme();
                              }
                              return;
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 6,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: themeProvider.isDark
                                    ? Theme.of(context).colorScheme.surface
                                    : Theme.of(context).colorScheme.onSurface,
                                border: themeProvider.isDark
                                    ? BoxBorder.all(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .surfaceContainer,
                                      )
                                    : null,
                              ),
                              child: Icon(
                                themeProvider.isDark
                                    ? Icons.light_mode_outlined
                                    : Icons.light_mode,
                                color: themeProvider.isDark
                                    ? Theme.of(context).colorScheme.tertiary
                                    : ColorManager.white,
                              ),
                            ),
                          ),
                          SizedBox(width: 16),
                          InkWell(
                            onTap: () {
                              if (themeProvider.isDark) {
                                return;
                              }
                              themeProvider.changeCurrentTheme();
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 6,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: themeProvider.isDark
                                    ? Theme.of(context).colorScheme.onSurface
                                    : Theme.of(context).colorScheme.surface,
                                border: themeProvider.isDark
                                    ? null
                                    : BoxBorder.all(
                                        color: ColorManager.offWhite,
                                      ),
                              ),
                              child: Icon(
                                themeProvider.isDark
                                    ? Icons.dark_mode
                                    : Icons.dark_mode_outlined,
                                color: themeProvider.isDark
                                    ? ColorManager.white
                                    : Theme.of(context).colorScheme.tertiary,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 54),
                      CustomElevatedButton(
                        hintText: "Let’s start",
                        onPressed: () {
                          Navigator.pushNamed(
                            context,
                            RoutesManager.onbordingScreens,
                          );
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
