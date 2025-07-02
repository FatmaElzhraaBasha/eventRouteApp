import 'package:event_planning_app/l10n/app_localizations.dart';
import 'package:event_planning_app/ui/home_screen/tabs/home_tab/widget/event_tab_Item.dart';
import 'package:event_planning_app/utils/app_assets.dart';
import 'package:event_planning_app/utils/app_styles.dart';
import 'package:flutter/material.dart';

import '../../../../utils/app_colors.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    List<String> eventsNameList = [
      AppLocalizations.of(context)!.all,
      AppLocalizations.of(context)!.sport,
      AppLocalizations.of(context)!.birthday,
      AppLocalizations.of(context)!.meeting,
      AppLocalizations.of(context)!.gaming,
      AppLocalizations.of(context)!.work_shop,
      AppLocalizations.of(context)!.book_club,
      AppLocalizations.of(context)!.exhibition,
      AppLocalizations.of(context)!.holiday,
      AppLocalizations.of(context)!.eating,
    ];

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: height * 0.18,
        title: Row(
          children: [
            Column(
              children: [
                Row(
                  children: [
                    Text(
                      AppLocalizations.of(context)!.welcome_back,
                      style: AppStyles.regular14White,
                    ),
                    Image.asset(AppAssets.starIcon),
                  ],
                ),
                Text('john Safwat', style: AppStyles.bold24White),
              ],
            ),
            Spacer(),
            Image.asset(AppAssets.modeIcon),
            Container(
              margin: EdgeInsets.only(left: width * 0.02, right: width * 0.01),
              padding: EdgeInsets.symmetric(horizontal: width * 0.02),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: AppColors.whiteColor,
              ),
              child: Text('EN', style: AppStyles.bold14Primary),
            ),
          ],
        ),
        bottom: AppBar(
          toolbarHeight: height * 0.10,
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
                length: eventsNameList.length,
                child: TabBar(
                  isScrollable: true,
                  tabAlignment: TabAlignment.start,
                  labelPadding: EdgeInsets.zero,
                  indicatorColor: AppColors.transparentColor,
                  dividerColor: AppColors.transparentColor,
                  tabs: eventsNameList.map((eventName) {
                    return EventTabItem(
                      isSelected: false,
                      eventName: eventName,
                    );
                  }).toList(),
                ),
              ),
              SizedBox(height: height * 0.02),
            ],
          ),
        ),
      ),
    );
  }
}
