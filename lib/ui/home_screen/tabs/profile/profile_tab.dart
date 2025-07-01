import 'package:event_planning_app/l10n/app_localizations.dart';
import 'package:event_planning_app/ui/home_screen/tabs/profile/language/language_bottom_Sheet.dart';
import 'package:event_planning_app/ui/home_screen/tabs/profile/theme/theme_bottom_Sheet.dart';
import 'package:event_planning_app/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../providers/app_Language_Provider.dart';
import '../../../../providers/app_theme_provider.dart';
import '../../../../utils/app_colors.dart';

class ProfileTab extends StatefulWidget {
  const ProfileTab({super.key});

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery
        .of(context)
        .size
        .height;
    var width = MediaQuery
        .of(context)
        .size
        .width;
    var themeProvider = Provider.of<AppThemeProvider>(context);
    var languageProvider = Provider.of<AppLanguageProvider>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryLight,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: width * 0.04,
            vertical: height * 0.04
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(AppLocalizations.of(context)!.language,
              style: Theme
                  .of(context)
                  .textTheme
                  .headlineLarge,),
            Container(
              margin: EdgeInsets.symmetric(
                  vertical: height * 0.02
              ),
              padding: EdgeInsets.symmetric(
                  horizontal: width * 0.02,
                  vertical: height * 0.01
              ),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                      color: AppColors.primaryLight,
                      width: 2
                  )
              ),
              child: InkWell(
                onTap: () {
                  showLanguageBottomSheet();
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(languageProvider.appLanguage == 'en' ?
                    AppLocalizations.of(context)!.english :
                    AppLocalizations.of(context)!.arabic,
                      style: AppStyles.bold20Primary,),
                    Icon(Icons.arrow_drop_down_outlined,
                      size: 35, color: AppColors.primaryLight,)
                  ],
                ),
              ),
            ),
            SizedBox(height: height * 0.02,),
            Text(AppLocalizations.of(context)!.theme,
              style: Theme
                  .of(context)
                  .textTheme
                  .headlineLarge,),
            Container(
              margin: EdgeInsets.symmetric(
                  vertical: height * 0.02
              ),
              padding: EdgeInsets.symmetric(
                  horizontal: width * 0.02,
                  vertical: height * 0.01
              ),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                      color: AppColors.primaryLight,
                      width: 2
                  )
              ),
              child: InkWell(
                onTap: () {
                  showThemeBottomSheet();
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(themeProvider.isDarkMode() ?
                    AppLocalizations.of(context)!.dark :
                    AppLocalizations.of(context)!.light,
                      style: AppStyles.bold20Primary,),
                    Icon(Icons.arrow_drop_down_outlined,
                      size: 35, color: AppColors.primaryLight,)
                  ],
                ),
              ),
            ),

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
