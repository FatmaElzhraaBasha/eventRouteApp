import 'package:event_planning_app/l10n/app_localizations.dart';
import 'package:event_planning_app/ui/home_screen/tabs/favourite_tab/favourite_tab.dart';
import 'package:event_planning_app/ui/home_screen/tabs/home_tab/home_tab.dart';
import 'package:event_planning_app/ui/home_screen/tabs/map_tab/map_tab.dart';
import 'package:event_planning_app/ui/home_screen/tabs/profile_tab/profile_tab.dart';
import 'package:event_planning_app/utils/app_assets.dart';
import 'package:event_planning_app/utils/app_routes.dart';
import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  List<Widget> tabs = [
    HomeTab(), MapTab(), FavouriteTab(), ProfileTab()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      bottomNavigationBar:
      /*Theme(
        data: Theme.of(context).copyWith(
            canvasColor: AppColors.primaryLight
        ),*/
      BottomAppBar(
        color: Theme
            .of(context)
            .primaryColor,
          shape: CircularNotchedRectangle(),
        notchMargin: 6,
        child: Expanded(
          child: BottomNavigationBar(
              currentIndex: selectedIndex,
              onTap: (index) {
                selectedIndex = index;
                setState(() {

                });
              },
              items: [
                builtBottomNavigationBarItem(
                    selectedIconName: AppAssets.iconHomeSelected,
                    unSelectedIconName: AppAssets.iconHome,
                    index: 0,
                    label: AppLocalizations.of(context)!.home),
                builtBottomNavigationBarItem(
                    selectedIconName: AppAssets.iconMapSelected,
                    unSelectedIconName: AppAssets.iconMap,
                    index: 1,
                    label: AppLocalizations.of(context)!.map),
                builtBottomNavigationBarItem(
                    selectedIconName: AppAssets.iconFavouriteSelected,
                    unSelectedIconName: AppAssets.iconFavourite,
                    index: 2,
                    label: AppLocalizations.of(context)!.love),
                builtBottomNavigationBarItem(
                    selectedIconName: AppAssets.iconProfileSelected,
                    unSelectedIconName: AppAssets.iconProfile,
                    index: 3,
                    label: AppLocalizations.of(context)!.profile),

              ]),
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        Navigator.of(context).pushNamed(AppRoutes.addEventRouteName);
      },
        child: Icon(Icons.add, color: AppColors.whiteColor, size: 35,),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: Column(
        children: [
          //Image.asset(AppAssets.logoBg),
          Expanded(child: tabs[selectedIndex]),
        ],
      ),
    );
  }

  BottomNavigationBarItem builtBottomNavigationBarItem({
    required String selectedIconName,
    required String unSelectedIconName,
    required String label,
    required int index}) {
    return BottomNavigationBarItem(
        icon: ImageIcon(AssetImage(
            selectedIndex == index ?
            selectedIconName : unSelectedIconName)),
        label: label
    );
  }
}
