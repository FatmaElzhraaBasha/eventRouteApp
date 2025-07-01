import 'package:event_planning_app/ui/home_screen/tabs/profile/profile_tab.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ProfileTab(),
    );
  }
}
