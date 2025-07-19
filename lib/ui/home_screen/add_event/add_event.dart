import 'package:event_planning_app/l10n/app_localizations.dart';
import 'package:event_planning_app/model/event.dart';
import 'package:event_planning_app/providers/event_list_provider.dart';
import 'package:event_planning_app/ui/home_screen/add_event/widget/date_or_time_widget.dart';
import 'package:event_planning_app/ui/home_screen/tabs/home_tab/widget/event_tab_Item.dart';
import 'package:event_planning_app/ui/home_screen/tabs/widget/custom_elevated_button.dart';
import 'package:event_planning_app/ui/home_screen/tabs/widget/custom_text_form_field.dart';
import 'package:event_planning_app/utils/app_assets.dart';
import 'package:event_planning_app/utils/app_styles.dart';
import 'package:event_planning_app/utils/firebase_utils/firebase_utils.dart';
import 'package:event_planning_app/utils/toast_utils.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../../providers/app_theme_provider.dart';
import '../../../utils/app_colors.dart';

class AddEvent extends StatefulWidget {
  AddEvent({super.key});

  @override
  State<AddEvent> createState() => _AddEventState();
}

class _AddEventState extends State<AddEvent> {
  int selectedIndex = 0;
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  DateTime? selectedDate;
  TimeOfDay? selectedTime;
  String formatedDate = '';
  String formatedTime = '';
  String selectedImage = '';
  String selectedEventName = '';
  late EventListProvider eventListProvider;

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
    var themeProvider = Provider.of<AppThemeProvider>(context);
    eventListProvider = Provider.of<EventListProvider>(context);

    List<String> eventsNameList = [
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
    List<IconData> iconEventList = [
      Icons.directions_bike_outlined,
      Icons.cake_outlined,
      Icons.meeting_room_outlined,
      Icons.videogame_asset_outlined,
      Icons.group_work_outlined,
      Icons.my_library_books_outlined,
      Icons.grade_outlined,
      Icons.holiday_village_outlined,
      Icons.fastfood_outlined,
    ];
    List<String> eventImageDarkList = [
      AppAssets.sportImageDark,
      AppAssets.birthdayImageDark,
      AppAssets.meetingImageDark,
      AppAssets.gamingImageDark,
      AppAssets.workShopImageDark,
      AppAssets.bookClubImageDark,
      AppAssets.exhibitionImageDark,
      AppAssets.holidayImageDark,
      AppAssets.eatingImageDark,
    ];
    List<String> eventImageLightList = [
      AppAssets.sportImageLight,
      AppAssets.birthdayImageLight,
      AppAssets.meetingImageLight,
      AppAssets.gamingImageLight,
      AppAssets.workShopImageLight,
      AppAssets.bookClubImageLight,
      AppAssets.exhibitionImageLight,
      AppAssets.holidayImageLight,
      AppAssets.eatingImageLight,
    ];

    selectedImage = themeProvider.isDarkMode() ?
    eventImageDarkList[selectedIndex] : eventImageLightList[selectedIndex];
    selectedEventName = eventsNameList[selectedIndex];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.transparentColor,
        centerTitle: true,
        iconTheme: IconThemeData(color: AppColors.primaryLight),
        title: Text(
          AppLocalizations.of(context)!.create_event,
          style: AppStyles.medium20Primary,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: width * 0.04),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset(
                    selectedImage
                ),
              ),
              // Container(
              //   clipBehavior: Clip.antiAlias,
              //   decoration: BoxDecoration(
              //     borderRadius: BorderRadius.circular(16)
              //   ),
              //   child: Image.asset(AppAssets.birthday),
              // )
              SizedBox(height: height * 0.02),
              SizedBox(
                height: height * 0.06,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        selectedIndex = index;
                        setState(() {});
                      },
                      child: EventTabItem(
                        selectedBgColor: AppColors.primaryLight,
                        selectedTextStyle: Theme
                            .of(
                          context,
                        )
                            .textTheme
                            .labelLarge,
                        unSelectedTextStyle: AppStyles.medium16Primary,
                        selectedIconColor: Theme
                            .of(context)
                            .canvasColor,
                        unSelectedIconColor: AppColors.primaryLight,
                        borderColor: AppColors.primaryLight,
                        isSelected: selectedIndex == index,
                        eventName: eventsNameList[index],
                        eventIcon: iconEventList[index],
                      ),
                    );
                  },
                  itemCount: eventsNameList.length,
                ),
              ),
              SizedBox(height: height * 0.01),
              Text(
                AppLocalizations.of(context)!.title,
                style: Theme
                    .of(context)
                    .textTheme
                    .titleLarge,
              ),
              SizedBox(height: height * 0.01),
              CustomTextFormField(
                controller: titleController,
                hintText: AppLocalizations.of(context)!.event_title,
                prefixIcon: Image.asset(AppAssets.editIcon,
                  color: themeProvider.isDarkMode() ?
                  AppColors.whiteColor : AppColors.greyColor,),
                colorBorderSide: themeProvider.isDarkMode() ?
                AppColors.primaryLight : AppColors.greyColor,
              ),
              SizedBox(height: height * 0.01),
              Text(
                AppLocalizations.of(context)!.description,
                style: Theme
                    .of(context)
                    .textTheme
                    .titleLarge,
              ),
              SizedBox(height: height * 0.01),
              CustomTextFormField(
                controller: descriptionController,
                hintText: AppLocalizations.of(context)!.event_description,
                maxLines: 4,
                colorBorderSide: themeProvider.isDarkMode() ?
                AppColors.primaryLight : AppColors.greyColor,
              ),
              SizedBox(height: height * 0.01),
              DateOrTimeWidget(
                imagePath: AppAssets.dateIcon,
                text: AppLocalizations.of(context)!.event_date,
                chooseDateOrTime: selectedDate == null
                    ? AppLocalizations.of(context)!.choose_date
                    : formatedDate,
                // : '${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}',
                onPressesd: chooseDate,
              ),
              DateOrTimeWidget(
                imagePath: AppAssets.timeIcon,
                text: AppLocalizations.of(context)!.event_time,
                chooseDateOrTime: selectedTime == null
                    ? AppLocalizations.of(context)!.choose_time
                    : formatedTime,
                onPressesd: chooseTime,
              ),
              SizedBox(height: height * 0.01),
              Text(
                AppLocalizations.of(context)!.location,
                style: Theme
                    .of(context)
                    .textTheme
                    .titleLarge,
              ),
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
                    Text(
                      AppLocalizations.of(context)!.choose_event_location,
                      style: AppStyles.medium16Primary,
                    ),
                    Spacer(),
                    Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: AppColors.primaryLight,
                    ),
                  ],
                ),
              ),
              SizedBox(height: height * 0.02),
              CustomElevatedButton(
                onPressed: addEvent,
                text: AppLocalizations.of(context)!.add_event,
              ),
              SizedBox(height: height * 0.03),
            ],
          ),
        ),
      ),
    );
  }

  void chooseDate() async {
    var chooseDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(Duration(days: 365)),
    );
    selectedDate = chooseDate;
    if (selectedDate != null) {
      formatedDate = DateFormat('dd/MM/yyyy').format(selectedDate!);
      setState(() {});
    }
  }

  void chooseTime() async {
    var chooseTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    selectedTime = chooseTime;
    if (selectedTime != null) {
      formatedTime = selectedTime!.format(context);
      setState(() {});
    }
  }

  void addEvent() {
    Event event = Event(
        title: titleController.text,
        description: descriptionController.text,
        dateTime: selectedDate!,
        eventName: selectedEventName,
        image: selectedImage,
        time: formatedTime!);
    FirebaseUtils.addEventToFireStore(event).timeout(
        Duration(microseconds: 500),
        onTimeout: () {
          //todo: alert dialog , flutter toast , snack
          ToastUtils.toastMsg(
              msg: AppLocalizations.of(context)!.toast_msg,
              backgroundColor: AppColors.primaryLight,
              textColor: AppColors.whiteColor);
          //todo: refresh eventsList
          eventListProvider.getAllEvents();
          Navigator.pop(context);
        });
  }
}
