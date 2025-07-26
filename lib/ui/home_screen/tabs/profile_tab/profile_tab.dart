import 'package:event_planning_app/l10n/app_localizations.dart';
import 'package:event_planning_app/ui/home_screen/tabs/profile_tab/language/language_bottom_Sheet.dart';
import 'package:event_planning_app/ui/home_screen/tabs/profile_tab/theme/theme_bottom_Sheet.dart';
import 'package:event_planning_app/ui/home_screen/tabs/widget/custom_elevated_button.dart';
import 'package:event_planning_app/utils/app_assets.dart';
import 'package:event_planning_app/utils/app_routes.dart';
import 'package:event_planning_app/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../providers/app_Language_Provider.dart';
import '../../../../providers/app_theme_provider.dart';
import '../../../../providers/event_list_provider.dart';
import '../../../../providers/user_provider.dart';
import '../../../../utils/app_colors.dart';

class ProfileTab extends StatefulWidget {
  const ProfileTab({super.key});

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var themeProvider = Provider.of<AppThemeProvider>(context);
    var languageProvider = Provider.of<AppLanguageProvider>(context);
    var userProvider = Provider.of<UserProvider>(context);
    var eventListProvider = Provider.of<EventListProvider>(context);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.primaryLight,
        toolbarHeight: height * 0.18,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(45)),
        ),
        title: Padding(
          padding: EdgeInsets.only(bottom: height * 0.01),
          child: Row(
            children: [
              Image.asset(AppAssets.routeImage),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.03),
                child: Container(
                  constraints: BoxConstraints(maxWidth: width * 0.6),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(userProvider.currentUser!.name,
                          style: AppStyles.bold24White),
                      Text(
                        userProvider.currentUser!.email,
                        style: AppStyles.medium16White,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: width * 0.04,
          vertical: height * 0.04,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              AppLocalizations.of(context)!.language,
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: height * 0.02),
              padding: EdgeInsets.symmetric(
                horizontal: width * 0.02,
                vertical: height * 0.01,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: AppColors.primaryLight, width: 2),
              ),
              child: InkWell(
                onTap: () {
                  showLanguageBottomSheet();
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      languageProvider.appLanguage == 'en'
                          ? AppLocalizations.of(context)!.english
                          : AppLocalizations.of(context)!.arabic,
                      style: AppStyles.bold20Primary,
                    ),
                    Icon(
                      Icons.arrow_drop_down_outlined,
                      size: 35,
                      color: AppColors.primaryLight,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: height * 0.02),
            Text(
              AppLocalizations.of(context)!.theme,
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: height * 0.02),
              padding: EdgeInsets.symmetric(
                horizontal: width * 0.02,
                vertical: height * 0.01,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: AppColors.primaryLight, width: 2),
              ),
              child: InkWell(
                onTap: () {
                  showThemeBottomSheet();
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      themeProvider.isDarkMode()
                          ? AppLocalizations.of(context)!.dark
                          : AppLocalizations.of(context)!.light,
                      style: AppStyles.bold20Primary,
                    ),
                    Icon(
                      Icons.arrow_drop_down_outlined,
                      size: 35,
                      color: AppColors.primaryLight,
                    ),
                  ],
                ),
              ),
            ),
            Spacer(),
            CustomElevatedButton(
              backgroundColor: AppColors.redColor,
              borderColor: AppColors.redColor,
              isIcon: true,
              iconImage: Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.04),
                child: Icon(
                    Icons.logout, color: AppColors.whiteColor, size: 30),
              ),
              mainAxisAlignment: MainAxisAlignment.start,
              onPressed: () {
                //todo: logout
                //FirebaseAuth.instance.signOut();
                //todo: favoriteEventList => empty
                eventListProvider.favoriteEventList = [];
                //todo: change selected index to get all event
                //eventlistProvider.changeSelectedIndex(0, userProvider.currentUser!.id);
                Navigator.of(context).pushNamedAndRemoveUntil(
                    AppRoutes.logInRouteName,
                        (route) => false);
              },
              text: AppLocalizations.of(context)!.logout,),
          ],
        ),
      ),
    );
  }

  void showLanguageBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (context) => LanguageBottomSheet(),
    );
  }

  void showThemeBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (context) => ThemeBottomSheet(),
    );
  }
}


/*
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.redColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusGeometry.circular(16),
                ),
                padding: EdgeInsets.symmetric(
                  vertical: height * 0.02,
                  horizontal: width * 0.04,
                ),
              ),
              onPressed: () {},
              child: Row(
                children: [
                  Icon(Icons.logout, color: AppColors.whiteColor, size: 30),
                  SizedBox(width: width * 0.02),
                  Text(
                    AppLocalizations.of(context)!.logout,
                    style: AppStyles.regular20White,
                  ),
                ],
              ),
            ),

 */
