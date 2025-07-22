import 'package:flutter/material.dart';

import '../../../l10n/app_localizations.dart';
import '../../../utils/app_assets.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_styles.dart';

class EventDetails extends StatelessWidget {
  const EventDetails({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.transparentColor,
        centerTitle: true,
        iconTheme: IconThemeData(color: AppColors.primaryLight),
        title: Text(
          AppLocalizations.of(context)!.event_details,
          style: AppStyles.medium20Primary,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Image.asset(AppAssets.editEventIcon),
          ),
          IconButton(
            onPressed: () {},
            icon: Image.asset(AppAssets.deleteEventIcon),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: width * 0.04,
          vertical: height * 0.01,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset(AppAssets.sportImageLight),
              ),
              SizedBox(height: height * 0.01),
              Text(
                'We Are Going To Play Football',
                style: AppStyles.medium24Primary,
              ),
              SizedBox(height: height * 0.01),
              Container(
                padding: EdgeInsets.symmetric(
                  vertical: height * 0.01,
                  horizontal: width * 0.01,
                ),
                margin: EdgeInsets.only(top: height * 0.01),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: AppColors.primaryLight, width: 1),
                ),
                child: Row(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(
                        vertical: height * 0.02,
                        horizontal: width * 0.04,
                      ),
                      margin: EdgeInsets.symmetric(horizontal: width * 0.02),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: AppColors.primaryLight,
                      ),
                      child: Icon(
                        Icons.calendar_month_outlined,
                        color: AppColors.whiteColor,
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '21 November 2024 ',
                          style: AppStyles.medium16Primary,
                        ),
                        Text('12:12PM ', style: AppStyles.medium16Black),
                      ],
                    ),
                    Spacer(),
                    Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: AppColors.primaryLight,
                    ),
                  ],
                ),
              ),
              SizedBox(height: height * 0.01),
              Container(
                padding: EdgeInsets.symmetric(
                  vertical: height * 0.01,
                  horizontal: width * 0.01,
                ),
                margin: EdgeInsets.only(top: height * 0.01),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: AppColors.primaryLight, width: 1),
                ),
                child: Row(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(
                        vertical: height * 0.02,
                        horizontal: width * 0.04,
                      ),
                      margin: EdgeInsets.symmetric(horizontal: width * 0.02),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: AppColors.primaryLight,
                      ),
                      child: Icon(
                        Icons.my_location_rounded,
                        color: AppColors.whiteColor,
                      ),
                    ),
                    Text('Cairo , Egypt', style: AppStyles.medium16Primary),
                    Spacer(),
                    Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: AppColors.primaryLight,
                    ),
                  ],
                ),
              ),
              SizedBox(height: height * 0.01),
              Image.asset(AppAssets.editEventMap),
              SizedBox(height: height * 0.01),
              Text(
                AppLocalizations.of(context)!.description,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              SizedBox(height: height * 0.01),
              Text(
                'Lorem ipsum dolor sit amet consectetur. Vulputate eleifend suscipit eget neque senectus a. Nulla at non malesuada odio duis lectus amet nisi sit. Risus hac enim maecenas auctor et. At cras massa diam porta facilisi lacus purus. Iaculis eget quis ut amet. Sit ac malesuada nisi quis  feugiat.',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              SizedBox(height: height * 0.02),
            ],
          ),
        ),
      ),
    );
  }
}
