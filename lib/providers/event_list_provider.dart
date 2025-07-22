import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:event_planning_app/utils/toast_utils.dart';
import 'package:flutter/cupertino.dart';

import '../l10n/app_localizations.dart';
import '../model/event.dart';
import '../utils/app_colors.dart';
import '../utils/firebase_utils/firebase_utils.dart';

class EventListProvider extends ChangeNotifier {
  int selectedIndex = 0;
  List<Event> eventList = [];
  List<Event> filterEventList = [];
  List<String> eventsNameList = [];
  List<Event> favoriteEventList = [];

  //todo: get context
  List<String> getEventNameList(BuildContext context) {
    return eventsNameList = [
      AppLocalizations.of(context)!.all,
      AppLocalizations.of(context)!.sport,
      AppLocalizations.of(context)!.birthday,
      AppLocalizations.of(context)!.meeting,
      AppLocalizations.of(context)!.gaming,
      AppLocalizations.of(context)!.work_shop,
      AppLocalizations.of(context)!.book_club,
      AppLocalizations.of(context)!.exhibition,
      AppLocalizations.of(context)!.holiday,
      AppLocalizations.of(context)!.eating,
    ];
  }

  //todo: get all events
  void getAllEvents() async {
    QuerySnapshot<Event> querySnapshot =
        await FirebaseUtils.getEventCollection().get();
    eventList = querySnapshot.docs.map((doc) {
      return doc.data();
    }).toList();
    filterEventList = eventList;
    filterEventList.sort((event1, event2) {
      return event1.dateTime.compareTo(event2.dateTime);
    });
    notifyListeners();
  }

  //todo: get filter events => eventsName
  void getFilterEvents() async {
    var querySnapshot = await FirebaseUtils.getEventCollection().get();
    // querySnapshot.docs.where((event) {
    //   // if(event.data().eventName == eventsNameList[selectedIndex]){
    //   //   return true;
    //   // }else{
    //   //   return false;
    //   // }
    //   return event.data().eventName == eventsNameList[selectedIndex];
    // },).toList();
    eventList = querySnapshot.docs.map((doc) {
      return doc.data();
    }).toList();
    filterEventList = eventList.where((event) {
      return event.eventName == eventsNameList[selectedIndex];
    }).toList();
    //todo: sorting
    filterEventList.sort((event1, event2) {
      return event1.dateTime.compareTo(event2.dateTime);
    });
    notifyListeners();
  }

  void getFilterEventsFromFireStore() async {
    var querySnapshot = await FirebaseUtils.getEventCollection()
        .orderBy('dateTime')
        .where('eventName', isEqualTo: eventsNameList[selectedIndex])
        .get();
    filterEventList = querySnapshot.docs.map((doc) {
      return doc.data();
    }).toList();
    notifyListeners();
  }

  void updateIsFavourite(Event event, BuildContext context) {
//todo: update isFavorite
    FirebaseUtils.getEventCollection().doc(event.id)
        .update({'isFavorite': !event.isFavorite})
        .timeout(Duration(milliseconds: 500), onTimeout: () {
      ToastUtils.toastMsg(
          msg: AppLocalizations.of(context)!.event_updated_succefully,
          backgroundColor: AppColors.greenColor,
          textColor: AppColors.whiteColor);
    });
    //todo: get all events , filter events
    selectedIndex == 0 ? getAllEvents() : getFilterEvents();
    //todo: get all favorites events
    //getAllFavoriteEvents();
    getAllFavoriteEventsFromFireStore();
    notifyListeners();
  }

  void getAllFavoriteEvents() async {
    var querySnapshot = await FirebaseUtils.getEventCollection().get();
    querySnapshot.docs.map((doc) {
      return doc.data();
    }).toList();
    favoriteEventList = eventList.where((event) {
      return event.isFavorite == true;
    },).toList();
    notifyListeners();
  }

  void getAllFavoriteEventsFromFireStore() async {
    var querySnapshot = await FirebaseUtils.getEventCollection()
        .orderBy('dateTime')
        .where('isFavorite', isEqualTo: true).get();
    favoriteEventList = querySnapshot.docs.map((doc) {
      return doc.data();
    }).toList();
  }

  void changeSelectedIndex(int newSelectedIndex) {
    selectedIndex = newSelectedIndex;
    selectedIndex == 0 ? getAllEvents() : getFilterEventsFromFireStore();
  }
}
