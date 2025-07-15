import 'package:event_planning_app/l10n/app_localizations.dart';
import 'package:event_planning_app/ui/auth/log_in/log_in_screen.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:provider/provider.dart';

import '../../providers/app_theme_provider.dart';
import '../../utils/app_assets.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_styles.dart';

class OnboardingScreen extends StatelessWidget {
  OnboardingScreen({super.key});

  final introKey = GlobalKey<IntroductionScreenState>();

  void _onIntroEnd(context) {
    Navigator.of(
      context,
    ).pushReplacement(MaterialPageRoute(builder: (_) => LogInScreen()));
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var themeProvider = Provider.of<AppThemeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: themeProvider.isDarkMode()
            ? AppColors.primaryDark
            : AppColors.whiteBgColor,
        title: Image.asset(AppAssets.logoTop),
        centerTitle: true,
        toolbarHeight: height * 0.13,
      ),
      body: IntroductionScreen(
        key: introKey,
        allowImplicitScrolling: true,
        pages: [
          PageViewModel(
            image: themeProvider.isDarkMode()
                ? Image.asset(AppAssets.onboardingDarkImage1)
                : Image.asset(AppAssets.onboardingLightImage1),
            titleWidget: Text(
              AppLocalizations.of(context)!.find_events_that_inspire_you,
              style: AppStyles.bold20Primary,
            ),
            bodyWidget: Text(
              AppLocalizations.of(context)!.onboarding_1,
              style: themeProvider.isDarkMode()
                  ? AppStyles.medium16White
                  : AppStyles.medium16Black,
            ),
          ),
          PageViewModel(
            image: themeProvider.isDarkMode()
                ? Image.asset(AppAssets.onboardingDarkImage2)
                : Image.asset(AppAssets.onboardingLightImage2),
            titleWidget: Text(
              AppLocalizations.of(context)!.effortless_event_planning,
              style: AppStyles.bold20Primary,
            ),
            bodyWidget: Text(
              AppLocalizations.of(context)!.onboarding_2,
              style: themeProvider.isDarkMode()
                  ? AppStyles.medium16White
                  : AppStyles.medium16Black,
            ),
          ),
          PageViewModel(
            image: themeProvider.isDarkMode()
                ? Image.asset(AppAssets.onboardingDarkImage3)
                : Image.asset(AppAssets.onboardingLightImage3),
            titleWidget: Text(
              AppLocalizations.of(context)!.connect_with_friends,
              style: AppStyles.bold20Primary,
            ),
            bodyWidget: Text(
              AppLocalizations.of(context)!.onboarding_3,
              style: themeProvider.isDarkMode()
                  ? AppStyles.medium16White
                  : AppStyles.medium16Black,
            ),
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
      ),
    );
  }
}
