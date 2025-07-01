import 'package:event_planning_app/utils/app_styles.dart';
import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppThemes {
  static final ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.whiteBgColor,
    textTheme: TextTheme(
        headlineLarge: AppStyles.bold20Black,
        headlineMedium: AppStyles.bold20Primary
    ),

  );

  static final ThemeData darkTheme = ThemeData(
      scaffoldBackgroundColor: AppColors.primaryDark,
      textTheme: TextTheme(
          headlineLarge: AppStyles.bold20White,
          headlineMedium: AppStyles.bold20Primary
      )
  );
}
