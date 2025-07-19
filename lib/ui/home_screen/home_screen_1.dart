import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:event_planning_app/l10n/app_localizations.dart';
import 'package:event_planning_app/ui/home_screen/tabs/favourite_tab/favourite_tab.dart';
import 'package:event_planning_app/ui/home_screen/tabs/home_tab/home_tab.dart';
import 'package:event_planning_app/ui/home_screen/tabs/map_tab/map_tab.dart';
import 'package:event_planning_app/ui/home_screen/tabs/profile_tab/profile_tab.dart';
import 'package:event_planning_app/utils/app_assets.dart';
import 'package:event_planning_app/utils/app_colors.dart';
import 'package:event_planning_app/utils/app_styles.dart';
import 'package:flutter/material.dart';

import '../../utils/app_routes.dart';

class HomeScreen1 extends StatefulWidget {
  HomeScreen1({super.key});

  @override
  State<HomeScreen1> createState() => _HomeScreen1State();
}

class _HomeScreen1State extends State<HomeScreen1> {
  int selectedIndex = 0;

  final List<Widget> tabs = [HomeTab(), MapTab(), FavouriteTab(), ProfileTab()];

  final List<String> unSelectedIconPath = [
    AppAssets.iconHome,
    AppAssets.iconMap,
    AppAssets.iconFavourite,
    AppAssets.iconProfile,
  ];

  final List<String> selectedIconPath = [
    AppAssets.iconHomeSelected,
    AppAssets.iconMapSelected,
    AppAssets.iconFavouriteSelected,
    AppAssets.iconProfileSelected,
  ];

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    List<String> labelsName = [
      AppLocalizations.of(context)!.home,
      AppLocalizations.of(context)!.map,
      AppLocalizations.of(context)!.love,
      AppLocalizations.of(context)!.profile,
    ];
    return Scaffold(
      resizeToAvoidBottomInset: true,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed(AppRoutes.addEventRouteName);
        },
        child: Icon(Icons.add, size: 35, color: AppColors.whiteColor),
        //params
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar.builder(
        backgroundColor: Theme.of(context).primaryColor,
        itemCount: selectedIconPath.length,
        activeIndex: selectedIndex,
        gapLocation: GapLocation.center,
        notchSmoothness: NotchSmoothness.sharpEdge,
        notchMargin: 3.5,
        tabBuilder: (index, isActive) {
          return Padding(
            padding: EdgeInsets.only(top: height * 0.001),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                isActive
                    ? Image.asset(
                        selectedIconPath[index],
                        color: AppColors.whiteColor,
                      )
                    : Image.asset(
                        unSelectedIconPath[index],
                        color: AppColors.whiteColor,
                      ),
                SizedBox(height: height * 0.001),
                Text(labelsName[index], style: AppStyles.bold12White),
              ],
            ),
          );
        },
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
      ),
      body: Column(
        children: [
          //Image.asset(AppAssets.logoBg),
          Expanded(child: tabs[selectedIndex]),
        ],
      ),
    );
  }
}

/*
   tabBuilder: ,
            activeIndex: _bottomNavIndex,
            gapLocation: GapLocation.center,
            notchSmoothness: NotchSmoothness.softEdge,
            onTap: (index) => setState(() => _bottomNavIndex = index),
 */
