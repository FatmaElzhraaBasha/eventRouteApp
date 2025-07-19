import 'package:event_planning_app/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../providers/app_theme_provider.dart';
import '../../../../utils/app_colors.dart';

class DateOrTimeWidget extends StatelessWidget {
  String imagePath;
  String text;
  String chooseDateOrTime;
  VoidCallback onPressesd;

  DateOrTimeWidget({
    super.key,
    required this.imagePath,
    required this.text,
    required this.chooseDateOrTime,
    required this.onPressesd,
  });

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    var themeProvider = Provider.of<AppThemeProvider>(context);
    return Row(
      children: [
        Image.asset(
          imagePath,
          color: themeProvider.isDarkMode()
              ? AppColors.whiteColor
              : AppColors.blackColor,
        ),
        SizedBox(width: width * 0.04),
        Text(text, style: Theme.of(context).textTheme.titleLarge),
        Spacer(),
        TextButton(
          onPressed: onPressesd,
          child: Text(chooseDateOrTime, style: AppStyles.medium16Primary),
        ),
      ],
    );
  }
}
