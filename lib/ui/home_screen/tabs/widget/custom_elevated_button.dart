import 'package:event_planning_app/utils/app_colors.dart';
import 'package:event_planning_app/utils/app_styles.dart';
import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  VoidCallback onPressed;
  String text;
  Color? backgroundColor;
  TextStyle? textStyle;
  Color? borderColor;
  double borderWidth;
  bool isIcon;
  Widget? iconImage;
  MainAxisAlignment mainAxisAlignment;

  CustomElevatedButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.backgroundColor = AppColors.primaryLight,
    this.textStyle,
    this.borderColor,
    this.borderWidth = 0,
    this.isIcon = false,
    this.iconImage,
    this.mainAxisAlignment = MainAxisAlignment.center,
  });

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        backgroundColor: backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: BorderSide(
            color: borderColor ?? AppColors.primaryLight,
            width: borderWidth,
          ),
        ),
        padding: EdgeInsets.symmetric(vertical: height * 0.02),
      ),
      onPressed: onPressed,
      child: isIcon
          ? Row(
              mainAxisAlignment: mainAxisAlignment,
              children: [
                iconImage!,
                SizedBox(width: width * 0.02),
                Text(text, style: textStyle ?? AppStyles.medium20White),
              ],
            )
          : Text(text, style: textStyle ?? AppStyles.medium20White),
    );
  }
}
