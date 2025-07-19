import 'package:event_planning_app/utils/app_styles.dart';
import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppThemes {
  static final ThemeData lightTheme = ThemeData(
    focusColor: AppColors.whiteColor,
    primaryColor: AppColors.primaryLight,
    hoverColor: AppColors.primaryLight,
    canvasColor: AppColors.whiteColor,
    scaffoldBackgroundColor: AppColors.whiteBgColor,
    textTheme: TextTheme(
      headlineLarge: AppStyles.bold20Black,
      headlineMedium: AppStyles.medium16Primary,
      headlineSmall: AppStyles.medium16White,
      labelMedium: AppStyles.medium16Gray,
        labelLarge: AppStyles.medium16White,
        titleLarge: AppStyles.medium16Black
    ),
    bottomSheetTheme: BottomSheetThemeData(),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: AppColors.transparentColor,
        type: BottomNavigationBarType.fixed,
        elevation: 0,
        showUnselectedLabels: true,
        selectedLabelStyle: AppStyles.bold12White,
        unselectedLabelStyle: AppStyles.bold12White,
        selectedItemColor: AppColors.whiteColor,
        unselectedItemColor: AppColors.whiteColor
    ),

    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: AppColors.primaryLight,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
        side: BorderSide(color: AppColors.whiteColor, width: 4),
      ),
    ),
    appBarTheme: AppBarTheme(

      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(25),
          bottomRight: Radius.circular(25),
        ),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
            backgroundColor: WidgetStatePropertyAll(AppColors.primaryLight)
        )
    ),
    /*colorScheme: ColorScheme.light(
      surface: AppColors.primaryLight,
      onSurface: AppColors.whiteColor,
    ),*/
  );

  static final ThemeData darkTheme = ThemeData(
    focusColor: AppColors.primaryLight,
    primaryColor: AppColors.primaryDark,
    hoverColor: AppColors.whiteColor,
    canvasColor: AppColors.primaryDark,
    scaffoldBackgroundColor: AppColors.primaryDark,
    textTheme: TextTheme(
      headlineLarge: AppStyles.bold20White,
      headlineMedium: AppStyles.medium16White,
      headlineSmall: AppStyles.medium16White,
      labelMedium: AppStyles.medium16White,
        labelLarge: AppStyles.medium16PrimaryDark,
        titleLarge: AppStyles.medium16White

    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: AppColors.transparentColor,
        type: BottomNavigationBarType.fixed,
        elevation: 0,
        showUnselectedLabels: true,
        selectedLabelStyle: AppStyles.bold12White,
        unselectedLabelStyle: AppStyles.bold12White,
        selectedItemColor: AppColors.whiteColor,
        unselectedItemColor: AppColors.whiteColor

    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      elevation: 0,
      backgroundColor: AppColors.primaryDark,
      shape: StadiumBorder(
        side: BorderSide(width: 4, color: AppColors.whiteColor),
      ),
    ),
    appBarTheme: AppBarTheme(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(25),
          bottomRight: Radius.circular(25),
        ),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
            backgroundColor: WidgetStatePropertyAll(AppColors.primaryLight)
        )
    ),
    /*colorScheme: ColorScheme.dark(
      surface: AppColors.primaryDark,
      onSurface: AppColors.whiteColor,
    ),*/
  );
}
