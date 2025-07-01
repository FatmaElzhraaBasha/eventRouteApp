import 'package:event_planning_app/l10n/app_localizations.dart';
import 'package:event_planning_app/ui/home_screen/tabs/profile/profile_tab.dart';
import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryLight,
        title: Text(AppLocalizations.of(context)!.language),
        leading: Icon(Icons.arrow_back_ios),
      ),
      body: ProfileTab(),
    );
  }
}
