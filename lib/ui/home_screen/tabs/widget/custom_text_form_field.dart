import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../providers/app_theme_provider.dart';
import '../../../../utils/app_colors.dart';
import '../../../../utils/app_styles.dart';

typedef OnValidator = String? Function(String?)?;

class CustomTextFormField extends StatelessWidget {
  Color colorBorderSide;
  String? hintText;
  TextStyle? hintStyle;
  String? labelText;
  TextStyle? labelStyle;
  Widget? prefixIcon;
  Widget? suffixIcon;
  OnValidator validator;
  TextEditingController controller;
  TextInputType keyboardType;
  bool obscureText;
  String? obscuringCharacter;
  int? maxLines;

  CustomTextFormField({
    super.key,
    this.colorBorderSide = AppColors.greyColor,
    this.hintText,
    this.hintStyle,
    this.labelText,
    this.labelStyle,
    this.prefixIcon,
    this.suffixIcon,
    this.validator,
    required this.controller,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.obscuringCharacter,
    this.maxLines
  });

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    var themeProvider = Provider.of<AppThemeProvider>(context);
    TextStyle hintStyleTheming = themeProvider.isDarkMode()
        ? AppStyles.medium16White
        : AppStyles.medium16Gray;
    return TextFormField(
      maxLines: maxLines ?? 1,
      style: hintStyleTheming,
      decoration: InputDecoration(
        enabledBorder: builtDecorationBorder(colorBorderSide: colorBorderSide),
        focusedBorder: builtDecorationBorder(colorBorderSide: colorBorderSide),
        errorBorder: builtDecorationBorder(colorBorderSide: AppColors.redColor),
        focusedErrorBorder: builtDecorationBorder(
          colorBorderSide: AppColors.redColor,
        ),
        errorStyle: AppStyles.medium16Primary.copyWith(
          color: AppColors.redColor,
        ),
        hintText: hintText,
        hintStyle: hintStyleTheming,
        labelText: labelText,
        labelStyle: labelStyle,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
      ),
      validator: validator,
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText,
      obscuringCharacter: obscuringCharacter ?? '*',
    );
  }

  OutlineInputBorder builtDecorationBorder({required colorBorderSide}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide(color: colorBorderSide, width: 1),
    );
  }
}
