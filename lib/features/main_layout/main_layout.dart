import 'package:evently/core/sourses/color_manager.dart';
import 'package:evently/features/main_layout/favorite_page/favorite_page.dart';
import 'package:evently/features/main_layout/home_page/home_page.dart';
import 'package:evently/features/main_layout/profile_page/profile_page.dart';
import 'package:evently/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class MainLayout extends StatefulWidget {
  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  List<Widget> pages = [HomePage(), FavoritePage(), ProfilePage()];

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _bottomNavigationBar(context),
      body: pages[selectedIndex],
    );
  }

  void onTap(int pageIndex) {
    setState(() {
      selectedIndex = pageIndex;
    });
  }

  BottomNavigationBar _bottomNavigationBar(BuildContext context) {
    AppLocalizations lang = AppLocalizations.of(context)!;
    return BottomNavigationBar(
      onTap: onTap,
      currentIndex: selectedIndex,
      backgroundColor: Theme.of(context).primaryColor,
      selectedItemColor: Theme.of(context).colorScheme.secondary,
      unselectedItemColor: ColorManager.darkGray,
      showSelectedLabels: true,
      showUnselectedLabels: false,
      items: [
        BottomNavigationBarItem(
          icon: Icon(
            selectedIndex == 0 ? Icons.home_filled : Icons.home_outlined,
          ),
          label: lang.home,
        ),
        BottomNavigationBarItem(
          icon: Icon(
            selectedIndex == 1 ? Icons.favorite : Icons.favorite_border,
          ),
          label: lang.favorite,
        ),
        BottomNavigationBarItem(
          icon: Icon(selectedIndex == 2 ? Icons.person : Icons.person_outline),
          label: lang.profile,
        ),
      ],
    );
  }
}
