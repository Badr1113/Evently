import 'package:evently/core/Models/onbording_model.dart';
import 'package:evently/core/Widget/custom_elevated_button.dart';
import 'package:evently/core/provider/lang_provider.dart';
import 'package:evently/core/provider/theme_provider.dart';
import 'package:evently/core/sourses/assets_manager.dart';
import 'package:evently/core/sourses/routes_manager.dart';
import 'package:evently/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Onbording extends StatefulWidget {
  @override
  State<Onbording> createState() => _OnbordingState();
}

class _OnbordingState extends State<Onbording> {
  late PageController _pageController;

  // !dont forget to make it stafful widget
  int pageIndex = 0;
  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = context.watch<ThemeProvider>();
    AppLocalizations lang = AppLocalizations.of(context)!;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Image.asset(
              themeProvider.isDark
                  ? AssetsManager.main_logo_dark
                  : AssetsManager.main_logo_light,
              height: 27,
            ),
            SizedBox(height: 16),
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: (value) {
                  setState(() {
                    pageIndex = value;
                  });
                },
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      children: [
                        Image.asset(
                          themeProvider.isDark
                              ? OnbordingModel
                                    .onbordingScreens[index]
                                    .darkimagePath
                              : OnbordingModel
                                    .onbordingScreens[index]
                                    .lightimagePath,
                          height: 343,
                          fit: BoxFit.fill,
                        ),
                        SizedBox(height: 24),
                        Text(
                          switch (index) {
                            0 => lang.onbording_title_1,
                            1 => lang.onbording_title_2,
                            2 => lang.onbording_title_3,
                            3 => lang.onbording_title_4,
                            _ => lang.onbording_title_1,
                          },
                          textAlign: TextAlign.start,
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        SizedBox(height: 8),
                        Text(
                        switch (index) {
                            0 => lang.description_onbording_1,
                            1 => lang.description_onbording_2,
                            2 => lang.description_onbording_3,
                            3 => lang.description_onbording_4,
                            _ => lang.description_onbording_1,
                          },
                          textAlign: TextAlign.start,
                          style: Theme.of(context).textTheme.labelSmall!
                              .copyWith(fontSize: 16),
                        ),
                        SizedBox(height: 16),
                      ],
                    ),
                  );
                },
                itemCount: OnbordingModel.onbordingScreens.length,
              ),
            ),
            pageIndex == 2
                ? CustomElevatedButton(
                    hintText: lang.get_started,
                    onPressed: () {
                      Navigator.pushNamed(context, RoutesManager.loginScreen);
                    },
                  )
                : CustomElevatedButton(
                    hintText: lang.next,
                    onPressed: () {
                      _pageController.nextPage(
                        duration: Duration(milliseconds: 500),
                        curve: Curves.linear,
                      );
                    },
                  ),
            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
