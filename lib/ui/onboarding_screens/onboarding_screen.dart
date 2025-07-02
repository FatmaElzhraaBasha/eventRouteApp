import 'package:event_planning_app/ui/home_screen/home_screen_1.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

import '../../utils/app_assets.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_styles.dart';

class OnboardingScreen extends StatelessWidget {
  OnboardingScreen({super.key});

  final introKey = GlobalKey<IntroductionScreenState>();

  void _onIntroEnd(context) {
    Navigator.of(
      context,
    ).pushReplacement(MaterialPageRoute(builder: (_) => HomeScreen1()));
  }

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      key: introKey,
      globalBackgroundColor: Colors.white,
      allowImplicitScrolling: true,
      pages: [
        PageViewModel(
          title: "",
          body: "",
          backgroundImage: AppAssets.onboardingScreen1,
        ),
        PageViewModel(
          title: "",
          body: "",
          backgroundImage: AppAssets.onboardingScreen2,
        ),
        PageViewModel(
          title: "",
          body: "",
          backgroundImage: AppAssets.onboardingScreen3,
        ),
      ],
      onDone: () => _onIntroEnd(context),
      onSkip: () => _onIntroEnd(context),
      // You can override onSkip callback
      showSkipButton: true,
      showDoneButton: true,
      skipOrBackFlex: 0,
      nextFlex: 0,
      showBackButton: false,
      //rtl: true, // Display as right-to-left
      back: const Icon(Icons.arrow_back, color: AppColors.primaryLight),
      skip: Text('Skip', style: AppStyles.bold16Primary),
      next: Icon(Icons.arrow_forward, color: AppColors.primaryLight),
      done: Text('Done', style: AppStyles.bold16Primary),
      curve: Curves.fastLinearToSlowEaseIn,
      controlsMargin: const EdgeInsets.all(16),
      controlsPadding: const EdgeInsets.all(12.0),
      dotsDecorator: DotsDecorator(
        activeColor: AppColors.primaryLight,
        size: Size(10.0, 10.0),
        color: AppColors.blackColor,
        activeSize: Size(22.0, 10.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
    );
  }
}
