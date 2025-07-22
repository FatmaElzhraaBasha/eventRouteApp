import 'package:event_planning_app/providers/event_list_provider.dart';
import 'package:event_planning_app/utils/app_assets.dart';
import 'package:event_planning_app/utils/app_colors.dart';
import 'package:event_planning_app/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../../../../model/event.dart';

class EventItem extends StatelessWidget {
  Event event;

  EventItem({super.key, required this.event});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    var eventListProvider = Provider.of<EventListProvider>(context);
    return Container(
      margin: EdgeInsets.symmetric(horizontal: width * 0.04),
      height: height * 0.25,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.primaryLight, width: 2),
        image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage(event.image),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.symmetric(
              horizontal: width * 0.02,
              vertical: height * 0.02,
            ),
            padding: EdgeInsets.symmetric(horizontal: width * 0.02),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: AppColors.whiteColor,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  //'${event.dateTime.day}'
                  event.dateTime.day.toString(),
                  style: AppStyles.bold20Primary,
                ),
                Text(
                  DateFormat('MMM').format(event.dateTime),
                  style: AppStyles.bold14Primary,
                ),
              ],
            ),
          ),
          Container(
            alignment: Alignment.bottomCenter,
            margin: EdgeInsets.symmetric(
              horizontal: width * 0.02,
              vertical: height * 0.01,
            ),
            padding: EdgeInsets.symmetric(
              horizontal: width * 0.02,
                vertical: height * 0.01
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: AppColors.whiteColor,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(event.title, style: AppStyles.bold14Black),
                ),
                //ImageIcon(AssetImage(AppAssets.iconFavourite))
                InkWell(
                    onTap: () {
                      eventListProvider.updateIsFavourite(event, context);
                    },
                    child: event.isFavorite == true ?
                    Image.asset(AppAssets.iconFavouriteSelected,
                      color: AppColors.primaryLight,)
                        :
                    Image.asset(AppAssets.iconFavourite,
                      color: AppColors.primaryLight,)
                ),

              ],
            ),
          ),
        ],
      ),
    );
  }
}
