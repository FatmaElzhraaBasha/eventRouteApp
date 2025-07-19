import 'package:flutter/material.dart';

import '../../../../../utils/app_colors.dart';

class EventTabItem extends StatelessWidget {
  bool isSelected;
  String eventName;
  IconData eventIcon;
  Color? borderColor;
  Color selectedBgColor;
  Color selectedIconColor;
  Color unSelectedIconColor;
  TextStyle? selectedTextStyle;
  TextStyle? unSelectedTextStyle;
  EventTabItem({
    super.key,
    required this.isSelected,
    required this.eventName,
    required this.eventIcon,
    this.borderColor,
    required this.selectedBgColor,
    required this.selectedTextStyle,
    required this.unSelectedTextStyle,
    required this.selectedIconColor,
    required this.unSelectedIconColor
  });

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: width * 0.02,
        vertical: height * 0.01,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: width * 0.03,
        vertical: height * 0.002,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(46),
        color: isSelected
            ? selectedBgColor
            : AppColors.transparentColor,
        border: Border.all(width: 2, color: borderColor ?? Theme
            .of(context)
            .focusColor),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(
            eventIcon,
            color: isSelected
                ? selectedIconColor
                : unSelectedIconColor,
          ),
          SizedBox(width: width * 0.01),
          Text(
            eventName,
            style: isSelected
                ? selectedTextStyle
                : unSelectedTextStyle
          ),
        ],
      ),
    );
  }
}
