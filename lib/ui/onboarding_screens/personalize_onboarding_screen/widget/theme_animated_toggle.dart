import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:event_planning_app/utils/app_assets.dart';
import 'package:flutter/material.dart';

import '../../../../utils/app_colors.dart';

class ThemeAnimatedToggle extends StatefulWidget {
  ThemeAnimatedToggle({super.key});

  @override
  State<ThemeAnimatedToggle> createState() => _ThemeAnimatedToggleState();
}

class _ThemeAnimatedToggleState extends State<ThemeAnimatedToggle> {
  bool islight = true;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Center(
      child: AnimatedToggleSwitch<bool>.dual(
        current: islight,
        first: true,
        second: false,
        borderWidth: 5.0,
        height: height * 0.06,
        spacing: width * 0.05,
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
          return Padding(
            padding: const EdgeInsets.all(1.0),
            child: ClipOval(
              child: Image.asset(
                value ? AppAssets.light : AppAssets.moon,
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.fill,
              ),
            ),
          );
        },
        onChanged: (value) {
          setState(() => islight = value);
          //  Localization
        },
      ),
    );
  }
}
