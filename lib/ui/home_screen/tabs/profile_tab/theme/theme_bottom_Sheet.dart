import 'package:event_planning_app/l10n/app_localizations.dart';
import 'package:event_planning_app/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../providers/app_theme_provider.dart';
import '../../../../../utils/app_colors.dart';

class ThemeBottomSheet extends StatefulWidget {
  const ThemeBottomSheet({super.key});

  @override
  State<ThemeBottomSheet> createState() => _ThemeBottomSheetState();
}

class _ThemeBottomSheetState extends State<ThemeBottomSheet> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var themeProvider = Provider.of<AppThemeProvider>(context);

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: width * 0.04,
        vertical: height * 0.04,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () {
              themeProvider.changeTheme(ThemeMode.dark);
            },
            child: themeProvider.isDarkMode()
                ? getSelectedThemeItem(
                    textTheme: AppLocalizations.of(context)!.dark,
                  )
                : getUnSelectedThemeItem(
                    textTheme: AppLocalizations.of(context)!.dark,
                  ),
          ),
          SizedBox(height: height * 0.02),
          InkWell(
            onTap: () {
              themeProvider.changeTheme(ThemeMode.light);
            },
            child: themeProvider.isDarkMode()
                ? getUnSelectedThemeItem(
                    textTheme: AppLocalizations.of(context)!.light,
                  )
                : getSelectedThemeItem(
                    textTheme: AppLocalizations.of(context)!.light,
                  ),
          ),
        ],
      ),
    );
  }

  Widget getSelectedThemeItem({required String textTheme}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(textTheme, style: AppStyles.bold20Primary),
        Icon(Icons.check, color: AppColors.primaryLight, size: 35),
      ],
    );
  }

  Widget getUnSelectedThemeItem({required String textTheme}) {
    return Text(textTheme, style: AppStyles.bold20Primary);
  }
}
