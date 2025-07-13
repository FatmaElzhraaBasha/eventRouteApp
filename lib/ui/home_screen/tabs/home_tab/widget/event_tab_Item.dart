import 'package:flutter/material.dart';

import '../../../../../utils/app_colors.dart';

class EventTabItem extends StatelessWidget {
  bool isSelected;
  String eventName;
  IconData eventIcon;

  EventTabItem({
    super.key,
    required this.isSelected,
    required this.eventName,
    required this.eventIcon,
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
            ? Theme.of(context).focusColor
            : AppColors.transparentColor,
        border: Border.all(width: 2, color: Theme.of(context).focusColor),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(
            eventIcon,
            color: isSelected
                ? Theme.of(context).hoverColor
                : AppColors.whiteColor,
          ),
          SizedBox(width: width * 0.01),
          Text(
            eventName,
            style: isSelected
                ? Theme.of(context).textTheme.headlineMedium
                : Theme.of(context).textTheme.headlineSmall,
          ),
        ],
      ),
    );
  }
}
