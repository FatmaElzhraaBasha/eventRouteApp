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

class ForgetPassword extends StatefulWidget {
  ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  var formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();

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
          AppLocalizations.of(context)!.forget_password2,
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
              Image.asset(AppAssets.forgetPassImage),
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
                    CustomElevatedButton(
                      onPressed: () {},
                      text: AppLocalizations.of(context)!.reset_password,
                    ),
                    SizedBox(height: height * 0.02),
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
