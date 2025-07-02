import 'package:event_planning_app/utils/app_styles.dart';
import 'package:flutter/material.dart';

import '../../../../../utils/app_colors.dart';

class EventTabItem extends StatelessWidget {
  bool isSelected;
  String eventName;

  EventTabItem({super.key, required this.isSelected, required this.eventName});

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
        vertical: height * 0.001,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(46),
        color: isSelected
            ? Theme.of(context).focusColor
            : AppColors.transparentColor,
        border: Border.all(
          width: 1,
          color: isSelected
              ? Theme.of(context).focusColor
              : AppColors.whiteColor,
        ),
      ),
      child: Text(
        eventName,
        style: isSelected ? AppStyles.medium16Primary : AppStyles.medium16White,
      ),
    );
  }
}
