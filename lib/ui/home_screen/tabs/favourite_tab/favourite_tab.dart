import 'package:event_planning_app/l10n/app_localizations.dart';
import 'package:event_planning_app/utils/app_colors.dart';
import 'package:event_planning_app/utils/app_styles.dart';
import 'package:flutter/material.dart';

import '../../../../utils/app_assets.dart';
import '../widget/custom_text_form_field.dart';

class FavouriteTab extends StatelessWidget {
  FavouriteTab({super.key});

  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery
        .of(context)
        .size
        .width;
    var height = MediaQuery
        .of(context)
        .size
        .height;
    return SafeArea(
      child: Column(
        children: [
          SizedBox(height: height * 0.02,),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: width * 0.04),
            child: CustomTextFormField(
              colorBorderSide: AppColors.primaryLight,
              hintText: AppLocalizations.of(context)!.search_for_event,
              hintStyle: AppStyles.bold14Primary,
              prefixIcon: Image.asset(AppAssets.searchIcon),
              controller: searchController,
            ),
          ),
          Expanded(
            child: ListView.separated(
              padding: EdgeInsets.only(top: height * 0.02),
              itemBuilder: (context, index) {
                return Container();
              },
              separatorBuilder: (context, index) {
                return SizedBox(height: height * 0.02);
              },
              itemCount: 20,
            ),
          ),
        ],
      ),
    );
  }
}
