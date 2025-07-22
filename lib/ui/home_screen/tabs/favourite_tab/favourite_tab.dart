import 'package:event_planning_app/l10n/app_localizations.dart';
import 'package:event_planning_app/ui/home_screen/tabs/home_tab/widget/event_item.dart';
import 'package:event_planning_app/utils/app_colors.dart';
import 'package:event_planning_app/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../providers/event_list_provider.dart';
import '../../../../providers/user_provider.dart';
import '../../../../utils/app_assets.dart';
import '../widget/custom_text_form_field.dart';

class FavouriteTab extends StatefulWidget {
  FavouriteTab({super.key});

  @override
  State<FavouriteTab> createState() => _FavouriteTabState();
}

class _FavouriteTabState extends State<FavouriteTab> {
  TextEditingController searchController = TextEditingController();
  late EventListProvider eventListProvider;
  late UserProvider userProvider;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      //eventListProvider.getAllFavoriteEvents();
      eventListProvider.getAllFavoriteEventsFromFireStore(
          userProvider.currentUser!.id);
    });
  }

  @override
  Widget build(BuildContext context) {
    eventListProvider = Provider.of<EventListProvider>(context);
    userProvider = Provider.of<UserProvider>(context);
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    // if(eventListProvider.favoriteEventList.isEmpty){
    //   eventListProvider.getAllFavoriteEventsFromFireStore(userProvider.currentUser!.id);
    // }
    return SafeArea(
      child: Column(
        children: [
          SizedBox(height: height * 0.02),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.04),
            child: CustomTextFormField(
              colorBorderSide: AppColors.primaryLight,
              hintText: AppLocalizations.of(context)!.search_for_event,
              hintStyle: AppStyles.bold14Primary,
              prefixIcon: Image.asset(AppAssets.searchIcon),
              controller: searchController,
            ),
          ),
          Expanded(
            child: eventListProvider.favoriteEventList.isEmpty
                ? Center(
                    child: Text(
                      AppLocalizations.of(context)!.no_favorite_events_found,
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                  )
                : ListView.separated(
                    padding: EdgeInsets.only(top: height * 0.02),
                    itemBuilder: (context, index) {
                      return EventItem(
                        event: eventListProvider.favoriteEventList[index],
                      );
                    },
                    separatorBuilder: (context, index) {
                      return SizedBox(height: height * 0.02);
                    },
                    itemCount: eventListProvider.favoriteEventList.length,
                  ),
          ),
        ],
      ),
    );
  }
}
