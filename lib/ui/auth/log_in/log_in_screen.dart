import 'package:event_planning_app/l10n/app_localizations.dart';
import 'package:event_planning_app/ui/home_screen/tabs/widget/custom_text_form_field.dart';
import 'package:event_planning_app/utils/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../providers/app_theme_provider.dart';
import '../../../utils/app_assets.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_styles.dart';
import '../../home_screen/tabs/widget/custom_elevated_button.dart';
import '../../onboarding_screens/personalize_onboarding_screen/widget/language_animated_toggle.dart';

class LogInScreen extends StatefulWidget {
  LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  var formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  bool isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    var themeProvider = Provider.of<AppThemeProvider>(context);
    TextStyle hintStyleTheming = themeProvider.isDarkMode()
        ? AppStyles.medium16White
        : AppStyles.medium16Gray;
    Color iconColorTheming = themeProvider.isDarkMode()
        ? AppColors.whiteColor
        : AppColors.greyColor;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.04),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: height * 0.04),
                Image.asset(AppAssets.logo, height: height * 0.20),
                SizedBox(height: height * 0.02),
                Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      CustomTextFormField(
                        hintText: AppLocalizations.of(context)!.email,
                        prefixIcon: Icon(Icons.email, color: iconColorTheming),
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        validator: (text) {
                          if (text == null || text.trim().isEmpty) {
                            //invalid
                            return AppLocalizations.of(
                              context,
                            )!.please_enter_email;
                          }
                          final bool emailValid =
                              RegExp(
                                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
                              ).hasMatch(
                                emailController.text.trim(),
                              ); //or type text in validator
                          if (!emailValid) {
                            return AppLocalizations.of(
                              context,
                            )!.please_enter_valid_email;
                          }
                          //valid
                          return null;
                        },
                      ),
                      SizedBox(height: height * 0.02),
                      CustomTextFormField(
                        hintText: AppLocalizations.of(context)!.password,
                        prefixIcon: Icon(
                          Icons.lock_rounded,
                          color: iconColorTheming,
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(
                            isPasswordVisible
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: iconColorTheming,
                          ),
                          onPressed: () {
                            isPasswordVisible = !isPasswordVisible;
                            setState(() {});
                          },
                        ),
                        controller: passwordController,
                        keyboardType: TextInputType.number,
                        obscureText: !isPasswordVisible,
                        obscuringCharacter: '*',
                        validator: (text) {
                          if (text == null || text.trim().isEmpty) {
                            //invalid
                            return AppLocalizations.of(
                              context,
                            )!.please_enter_pass;
                          }
                          if (text.length < 6) {
                            return AppLocalizations.of(
                              context,
                            )!.pass_length_error;
                          }
                          //valid
                          return null;
                        },
                      ),
                      SizedBox(height: height * 0.02),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              AppLocalizations.of(context)!.forget_password,
                              style: AppStyles.bold16PrimaryItalic.copyWith(
                                decoration: TextDecoration.underline,
                                decorationColor: AppColors.primaryLight,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: height * 0.02),
                      CustomElevatedButton(
                        onPressed: () {
                          login();
                        },
                        text: AppLocalizations.of(context)!.log_in,
                      ),
                      SizedBox(height: height * 0.02),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            AppLocalizations.of(context)!.do_not_have_account,
                            style: themeProvider.isDarkMode()
                                ? AppStyles.medium16White
                                : AppStyles.medium16Black,
                          ),
                          SizedBox(width: width * 0.02),
                          InkWell(
                            onTap: () {
                              Navigator.of(
                                context,
                              ).pushNamed(AppRoutes.registerRouteName);
                            },
                            child: Text(
                              AppLocalizations.of(context)!.create_account,
                              style: AppStyles.bold16PrimaryItalic.copyWith(
                                decoration: TextDecoration.underline,
                                decorationColor: AppColors.primaryLight,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: height * 0.02),
                      Row(
                        children: [
                          Expanded(
                            child: Divider(
                              thickness: 2,
                              indent: width * 0.1,
                              endIndent: width * 0.04,
                              color: AppColors.primaryLight,
                            ),
                          ),
                          Text(
                            AppLocalizations.of(context)!.or,
                            style: AppStyles.medium16Primary,
                          ),
                          Expanded(
                            child: Divider(
                              thickness: 2,
                              indent: width * 0.04,
                              endIndent: width * 0.1,
                              color: AppColors.primaryLight,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: height * 0.02),
                      CustomElevatedButton(
                        backgroundColor: AppColors.transparentColor,
                        textStyle: AppStyles.medium16Primary,
                        isIcon: true,
                        iconImage: Image.asset(AppAssets.googleIcon),
                        borderWidth: 1,
                        onPressed: () {
                          login();
                        },
                        text: AppLocalizations.of(context)!.login_with_google,
                      ),
                      SizedBox(height: height * 0.02),
                      LanguageAnimatedToggle(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void login() {
    if (formKey.currentState?.validate() == true) {
      Navigator.pushReplacementNamed(context, AppRoutes.home1RouteName);
    }
  }
}
