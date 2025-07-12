import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:event_planning_app/utils/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../providers/app_theme_provider.dart';
import '../../../../utils/app_colors.dart';

class ThemeAnimatedToggle extends StatefulWidget {
  ThemeAnimatedToggle({super.key});

  @override
  State<ThemeAnimatedToggle> createState() => _ThemeAnimatedToggleState();
}

class _ThemeAnimatedToggleState extends State<ThemeAnimatedToggle> {
  bool isLight = true;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    var themeProvider = Provider.of<AppThemeProvider>(context);
    return Center(
      child: AnimatedToggleSwitch<bool>.dual(
        current: isLight,
        first: true,
        second: false,
        borderWidth: 5.0,
        height: height * 0.059,
        spacing: width * 0.03,
        style: ToggleStyle(
          borderColor: AppColors.primaryLight,
          backgroundColor: Colors.transparent,
          indicatorColor: AppColors.primaryLight,
          indicatorBorder: BoxBorder.all(
            color: AppColors.primaryLight,
            width: 50,
          ),
          indicatorBorderRadius: BorderRadius.circular(1000),
        ),
        iconBuilder: (value) {
          return ClipOval(
            child: Image.asset(
                value ? AppAssets.light : AppAssets.moon,
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.fill,
              ),
          );
        },
        onChanged: (value) {
          isLight
              ? themeProvider.changeTheme(ThemeMode.dark)
              : themeProvider.changeTheme(ThemeMode.light);

          setState(() => isLight = value);
          //  Localization
        },
      ),
    );
  }
}
