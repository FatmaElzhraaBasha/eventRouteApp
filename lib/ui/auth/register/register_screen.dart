import 'package:event_planning_app/l10n/app_localizations.dart';
import 'package:event_planning_app/ui/home_screen/tabs/widget/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../providers/app_theme_provider.dart';
import '../../../utils/app_assets.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_routes.dart';
import '../../../utils/app_styles.dart';
import '../../home_screen/tabs/widget/custom_elevated_button.dart';
import '../../onboarding_screens/personalize_onboarding_screen/widget/language_animated_toggle.dart';

class RegisterScreen extends StatefulWidget {
  RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  var formKey = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController rePasswordController = TextEditingController();

  bool isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    var themeProvider = Provider.of<AppThemeProvider>(context);
    Color iconColorTheming = themeProvider.isDarkMode()
        ? AppColors.whiteColor
        : AppColors.greyColor;
    Color backButtonColorTheming = themeProvider.isDarkMode()
        ? AppColors.primaryLight
        : AppColors.blackColor;
    TextStyle hintStyleTheming = themeProvider.isDarkMode()
        ? AppStyles.medium16White
        : AppStyles.medium16Gray;
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: backButtonColorTheming),
        centerTitle: true,
        title: Text(
          AppLocalizations.of(context)!.register,
          style: themeProvider.isDarkMode()
              ? AppStyles.semibold22Primary
              : AppStyles.semibold22Black,
        ),
        backgroundColor: AppColors.transparentColor,
      ),
      body: SingleChildScrollView(
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
                      hintText: AppLocalizations.of(context)!.name,
                      hintStyle: hintStyleTheming,
                      prefixIcon: Icon(
                        Icons.person_rounded,
                        color: iconColorTheming,
                      ),
                      controller: nameController,
                      validator: (text) {
                        if (text == null || text.trim().isEmpty) {
                          return AppLocalizations.of(
                            context,
                          )!.please_enter_name; //invalid
                        }
                        return null; //valid
                      },
                    ),
                    SizedBox(height: height * 0.02),
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
                    CustomTextFormField(
                      hintText: AppLocalizations.of(context)!.re_password,
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
                      controller: rePasswordController,
                      keyboardType: TextInputType.number,
                      obscureText: !isPasswordVisible,
                      obscuringCharacter: '*',
                      validator: (text) {
                        if (text == null || text.trim().isEmpty) {
                          //invalid
                          return AppLocalizations.of(
                            context,
                          )!.please_enter_repass;
                        }
                        if (text.length < 6) {
                          return AppLocalizations.of(
                            context,
                          )!.pass_length_error;
                        }
                        if (passwordController.text != text) {
                          return AppLocalizations.of(context)!.do_not_match;
                        }
                        //valid
                        return null;
                      },
                    ),
                    SizedBox(height: height * 0.02),
                    CustomElevatedButton(
                      onPressed: () {
                        register();
                      },
                      text: AppLocalizations.of(context)!.create_account,
                    ),
                    SizedBox(height: height * 0.02),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          AppLocalizations.of(context)!.already_have_account,
                          style: themeProvider.isDarkMode()
                              ? AppStyles.medium16White
                              : AppStyles.medium16Black,
                        ),
                        SizedBox(width: width * 0.02),
                        InkWell(
                          onTap: () {
                            Navigator.of(context).pop(AppRoutes.logInRouteName);
                          },
                          child: Text(
                            AppLocalizations.of(context)!.log_in,
                            style: AppStyles.bold16PrimaryItalic.copyWith(
                              decoration: TextDecoration.underline,
                              decorationColor: AppColors.primaryLight,
                            ),
                          ),
                        ),
                      ],
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
    );
  }

  void register() {
    if (formKey.currentState?.validate() == true) {}
  }
}
