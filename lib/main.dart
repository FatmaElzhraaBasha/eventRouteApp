import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:event_planning_app/providers/app_Language_Provider.dart';
import 'package:event_planning_app/providers/app_theme_provider.dart';
import 'package:event_planning_app/providers/event_list_provider.dart';
import 'package:event_planning_app/ui/auth/log_in/log_in_screen.dart';
import 'package:event_planning_app/ui/auth/register/register_screen.dart';
import 'package:event_planning_app/ui/home_screen/add_event/add_event.dart';
import 'package:event_planning_app/ui/home_screen/home_screen.dart';
import 'package:event_planning_app/ui/home_screen/home_screen_1.dart';
import 'package:event_planning_app/ui/onboarding_screens/onboarding_screen.dart';
import 'package:event_planning_app/ui/onboarding_screens/personalize_onboarding_screen/personalize_onboarding_screen.dart';
import 'package:event_planning_app/utils/app_routes.dart';
import 'package:event_planning_app/utils/app_themes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'firebase_options.dart';
import 'l10n/app_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  final savedLang = prefs.getString('language') ?? 'en';
  final savedTheme =
  prefs.getString('theme') == 'dark' ? ThemeMode.dark : ThemeMode.light;

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FirebaseFirestore.instance.disableNetwork();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) =>
      AppLanguageProvider()
        ..setLanguage(savedLang)),
      ChangeNotifierProvider(create: (_) =>
      AppThemeProvider()
        ..setTheme(savedTheme)),
      ChangeNotifierProvider(create: (context) =>
          EventListProvider()),
    ],
    child: MyApp(),
  ));
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var languageProvider = Provider.of<AppLanguageProvider>(context);
    var themeProvider = Provider.of<AppThemeProvider>(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.personalizeOnboardingRouteName,
      routes: {
        AppRoutes.homeRouteName: (context) => HomeScreen(),
        AppRoutes.home1RouteName: (context) => HomeScreen1(),
        AppRoutes.personalizeOnboardingRouteName: (context) =>
            PersonalizeOnboardingScreen(),
        AppRoutes.onboardingRouteName: (context) => OnboardingScreen(),
        AppRoutes.logInRouteName: (context) => LogInScreen(),
        AppRoutes.registerRouteName: (context) => RegisterScreen(),
        AppRoutes.addEventRouteName: (context) => AddEvent(),

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
