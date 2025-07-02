import 'package:event_planning_app/utils/app_styles.dart';
import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppThemes {
  static final ThemeData lightTheme = ThemeData(
      focusColor: AppColors.whiteColor,
      primaryColor: AppColors.primaryLight,
    scaffoldBackgroundColor: AppColors.whiteBgColor,
    textTheme: TextTheme(
      headlineLarge: AppStyles.bold20Black,
      headlineMedium: AppStyles.bold20Primary,
      headlineSmall: AppStyles.medium16White,
    ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: AppColors.primaryLight,
        showUnselectedLabels: true,
        selectedLabelStyle: AppStyles.bold12White,
        unselectedLabelStyle: AppStyles.bold12White,
        selectedItemColor: AppColors.whiteColor,
    ),

      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: AppColors.primaryLight,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
          side: BorderSide(color: AppColors.whiteColor, width: 6),
        ),
      ),
      appBarTheme: AppBarTheme(
          backgroundColor: AppColors.primaryLight,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(25),
                bottomRight: Radius.circular(25),
              )
          )
      ),
      colorScheme: ColorScheme.light(
        surface: AppColors.primaryLight,
        onSurface: AppColors.whiteColor,
      )

  );

  static final ThemeData darkTheme = ThemeData(
      focusColor: AppColors.primaryLight,
      primaryColor: AppColors.primaryDark,
      scaffoldBackgroundColor: AppColors.primaryDark,
      textTheme: TextTheme(
        headlineLarge: AppStyles.bold20White,
        headlineMedium: AppStyles.medium16White,
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        showUnselectedLabels: true,
        backgroundColor: AppColors.primaryDark,
        selectedLabelStyle: AppStyles.bold12White,
        unselectedLabelStyle: AppStyles.bold12White,
        selectedItemColor: AppColors.whiteColor,
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: AppColors.primaryDark,
        shape: StadiumBorder(
          side: BorderSide(width: 4, color: AppColors.whiteColor),
        ),
      ),
      appBarTheme: AppBarTheme(
          backgroundColor: AppColors.primaryDark,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(25),
                bottomRight: Radius.circular(25),
              )
          )
      ),
      colorScheme: ColorScheme.dark(
        surface: AppColors.primaryDark,
        onSurface: AppColors.whiteColor,
      )
  );
}
