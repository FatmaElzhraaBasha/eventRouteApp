import 'package:event_planning_app/l10n/app_localizations.dart';
import 'package:event_planning_app/ui/onboarding_screens/personalize_onboarding_screen/widget/language_animated_toggle.dart';
import 'package:event_planning_app/ui/onboarding_screens/personalize_onboarding_screen/widget/theme_animated_toggle.dart';
import 'package:event_planning_app/utils/app_colors.dart';
import 'package:event_planning_app/utils/app_routes.dart';
import 'package:event_planning_app/utils/app_styles.dart';
import 'package:flutter/material.dart';

import '../../../utils/app_assets.dart';

class PersonalizeOnboardingScreen extends StatefulWidget {
  const PersonalizeOnboardingScreen({super.key});

  @override
  State<PersonalizeOnboardingScreen> createState() =>
      _PersonalizeOnboardingScreenState();
}

class _PersonalizeOnboardingScreenState
    extends State<PersonalizeOnboardingScreen> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: width * 0.04,
          vertical: height * 0.01,
        ),
        color: AppColors.whiteColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Column(
                children: [
                  Image.asset(AppAssets.logoTop),
                  SizedBox(height: height * 0.03),
                  Image.asset(AppAssets.beingCreativeImage, scale: 1.1),
                ],
              ),
            ),
            SizedBox(height: height * 0.03),
            Text(
              'Personalize Your Experience',
              style: AppStyles.bold22Primary,
              textAlign: TextAlign.start,
            ),
            SizedBox(height: height * 0.03),
            Container(
              constraints: BoxConstraints(maxWidth: width * 0.9),
              child: Text(
                AppLocalizations.of(context)!.preferred_theme_language,
                style: AppStyles.medium16Black,
              ),
            ),
            SizedBox(height: height * 0.03),
            Row(
              children: [
                Text(
                  AppLocalizations.of(context)!.language,
                  style: AppStyles.medium20Primary,
                ),
                Spacer(),
                LanguageAnimatedToggle(),
              ],
            ),
            SizedBox(height: height * 0.02),
            Row(
              children: [
                Text(
                  AppLocalizations.of(context)!.theme,
                  style: AppStyles.medium20Primary,
                ),
                Spacer(),
                ThemeAnimatedToggle(),
              ],
            ),
            SizedBox(height: height * 0.02),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed(AppRoutes.onboardingScreen);
              },
              style: ButtonStyle(
                padding: WidgetStatePropertyAll(
                  EdgeInsets.symmetric(
                    vertical: height * 0.02,
                    horizontal: width * 0.32,
                  ),
                ),
                alignment: Alignment.center,
                shape: WidgetStatePropertyAll(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
              ),
              child: Text(
                AppLocalizations.of(context)!.lets_start,
                style: AppStyles.medium20White,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
