import 'package:flutter/material.dart';

import '../home_tab/widget/event_item.dart';

class FavouriteTab extends StatelessWidget {
  const FavouriteTab({super.key});

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
    return SafeArea(child: Column(
      children: [
        Expanded(child: ListView.separated(
            padding: EdgeInsets.only(
                top: height * 0.02
            ),
            itemBuilder: (context, index) {
              return EventItem();
            },
            separatorBuilder: (context, index) {
              return SizedBox(
                height: height * 0.02,
              );
            },
            itemCount: 20)
        ),
      ],
    ));
  }
}
