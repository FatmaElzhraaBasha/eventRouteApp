import 'package:event_planning_app/providers/app_Language_Provider.dart';
import 'package:event_planning_app/providers/app_theme_provider.dart';
import 'package:event_planning_app/ui/home_screen/home_screen.dart';
import 'package:event_planning_app/ui/home_screen/home_screen_1.dart';
import 'package:event_planning_app/ui/onboarding_screens/onboarding_screen.dart';
import 'package:event_planning_app/ui/onboarding_screens/personalize_onboarding_screen/personalize_onboarding_screen.dart';
import 'package:event_planning_app/utils/app_routes.dart';
import 'package:event_planning_app/utils/app_themes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'l10n/app_localizations.dart';

void main() {
  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AppLanguageProvider()),
        ChangeNotifierProvider(create: (context) => AppThemeProvider()),
      ],

      child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var languageProvider = Provider.of<AppLanguageProvider>(context);
    var themeProvider = Provider.of<AppThemeProvider>(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.personalizeOnboardingScreen,
      routes: {
        AppRoutes.homeRouteName: (context) => HomeScreen(),
        AppRoutes.home1RouteName: (context) => HomeScreen1(),
        AppRoutes.personalizeOnboardingScreen: (context) =>
            PersonalizeOnboardingScreen(),
        AppRoutes.onboardingScreen: (context) => OnboardingScreen()
      },
      locale: Locale(languageProvider.appLanguage),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      theme: AppThemes.lightTheme,
      darkTheme: AppThemes.darkTheme,
      themeMode: themeProvider.appTheme,
    );
  }
}
