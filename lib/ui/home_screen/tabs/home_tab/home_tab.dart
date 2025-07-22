import 'package:event_planning_app/l10n/app_localizations.dart';
import 'package:event_planning_app/providers/event_list_provider.dart';
import 'package:event_planning_app/ui/home_screen/tabs/home_tab/widget/event_item.dart';
import 'package:event_planning_app/ui/home_screen/tabs/home_tab/widget/event_tab_Item.dart';
import 'package:event_planning_app/utils/app_assets.dart';
import 'package:event_planning_app/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../providers/app_Language_Provider.dart';
import '../../../../providers/app_theme_provider.dart';
import '../../../../utils/app_colors.dart';

class HomeTab extends StatefulWidget {
  HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  @override
  Widget build(BuildContext context) {
    var eventListProvider = Provider.of<EventListProvider>(context);
    eventListProvider.getEventNameList(context);
    if (eventListProvider.eventList.isEmpty) {
      eventListProvider.getAllEvents();
    }

    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    var themeProvider = Provider.of<AppThemeProvider>(context);
    var languageProvider = Provider.of<AppLanguageProvider>(context);

    List<IconData> iconEventList = [
      Icons.supervised_user_circle,
      Icons.directions_bike_outlined,
      Icons.cake_outlined,
      Icons.meeting_room_outlined,
      Icons.videogame_asset_outlined,
      Icons.group_work_outlined,
      Icons.my_library_books_outlined,
      Icons.grade_outlined,
      Icons.holiday_village_outlined,
      Icons.fastfood_outlined,
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        toolbarHeight: height * 0.1,
        title: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      AppLocalizations.of(context)!.welcome_back,
                      style: AppStyles.regular14White,
                    ),
                    SizedBox(width: width * 0.01),
                    Image.asset(AppAssets.starIcon),
                  ],
                ),
                Text('John Safwat', style: AppStyles.bold24White),
              ],
            ),
            Spacer(),
            InkWell(
              onTap: () {
                final newTheme = themeProvider.isDarkMode()
                    ? ThemeMode.light
                    : ThemeMode.dark;
                themeProvider.changeTheme(newTheme);
              },
              child: Icon(
                themeProvider.isDarkMode() ? Icons.dark_mode : Icons.light_mode,
                color: AppColors.whiteColor,
              ),
            ),
            InkWell(
              onTap: () {
                languageProvider.changeLanguage(
                  languageProvider.appLanguage == 'en' ? 'ar' : 'en',
                );
              },
              child: Container(
                margin: EdgeInsets.only(
                  left: width * 0.02,
                  right: width * 0.01,
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: width * 0.02,
                  vertical: height * 0.01,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: AppColors.whiteColor,
                ),
                child: Text(
                  languageProvider.appLanguage.toUpperCase(),
                  style: AppStyles.bold14Primary,
                ),
              ),
            ),
          ],
        ),
        bottom: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          toolbarHeight: height * 0.11,
          title: Column(
            children: [
              Row(
                children: [
                  Image.asset(AppAssets.locationIcon),
                  SizedBox(width: width * 0.02),
                  Text('cairo,Egypt', style: AppStyles.medium14White),
                ],
              ),
              SizedBox(height: height * 0.002),
              DefaultTabController(
                length: eventListProvider.eventsNameList.length,
                child: TabBar(
                  isScrollable: true,
                  tabAlignment: TabAlignment.start,
                  labelPadding: EdgeInsets.zero,
                  indicatorColor: AppColors.transparentColor,
                  dividerColor: AppColors.transparentColor,
                  onTap: (index) {
                    eventListProvider.changeSelectedIndex(index);
                  },
                  tabs: eventListProvider.eventsNameList.map((eventName) {
                    return EventTabItem(
                      selectedBgColor: Theme.of(context).focusColor,
                      selectedTextStyle: Theme.of(
                        context,
                      ).textTheme.headlineMedium,
                      unSelectedTextStyle: Theme.of(
                        context,
                      ).textTheme.headlineSmall,
                      selectedIconColor: Theme.of(context).hoverColor,
                      unSelectedIconColor: AppColors.whiteColor,
                      isSelected:
                          eventListProvider.selectedIndex ==
                          eventListProvider.eventsNameList.indexOf(eventName),
                      eventName: eventName,
                      eventIcon:
                          iconEventList[eventListProvider.eventsNameList
                              .indexOf(eventName)],
                    );
                  }).toList(),
                ),
              ),
              SizedBox(height: height * 0.02),
            ],
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: eventListProvider.filterEventList.isEmpty
                ? Center(
                    child: Text(
                      AppLocalizations.of(context)!.no_events_found,
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                  )
                : ListView.separated(
                    padding: EdgeInsets.only(top: height * 0.02),
                    itemBuilder: (context, index) {
                      return EventItem(
                        event: eventListProvider.filterEventList[index],
                      );
                    },
                    separatorBuilder: (context, index) {
                      return SizedBox(height: height * 0.02);
                    },
                    itemCount: eventListProvider.filterEventList.length,
                  ),
          ),
        ],
      ),
    );
  }
}

/*
eventsNameList.map((eventName) {
                    return EventTabItem(
                      isSelected: false,
                      eventName: eventName,
                    );
                  }).toList(),
                ),
              ),
              SizedBox(height: height * 0.02),
 */

/*
itemBuilder: (context, index) =>
              Container(
                margin: EdgeInsets.all(10),
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  border: Border.all(
                      width: 2,
                      color: AppColors.primaryLight
                  ),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Stack(
                  children: [
                    Image.asset(AppAssets.birthday),
                    Column(
                      children: [
                        FloatingActionButton(onPressed: () {},
                          backgroundColor: AppColors.whiteColor,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                              side: BorderSide(
                                  width: 0
                              )
                          ),
                          child: Column(
                            children: [
                              Text('21', style: AppStyles.bold20Primary,),
                              Text('NOV', style: AppStyles.bold14Primary,)
                            ],
                          ),),
                        FloatingActionButton(onPressed: (){},
                      backgroundColor: AppColors.whiteColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                          side: BorderSide(
                              width: 0
                          ),

                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('This is a Birthday Party',
                          style: AppStyles.bold14Black,),
                          Icon(Icons.favorite,
                          color: AppColors.primaryLight,)
                        ],
                      )),
 */
