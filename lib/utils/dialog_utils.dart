import 'package:event_planning_app/utils/app_styles.dart';
import 'package:flutter/material.dart';

import 'app_colors.dart';

class DialogUtils {
  static void showLoading({
    required BuildContext context,
    required String loadingText,
  }) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => AlertDialog(
        content: Row(
          children: [
            const CircularProgressIndicator(color: AppColors.primaryLight),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(loadingText, style: AppStyles.medium16Black),
            ),
          ],
        ),
      ),
    );
  }

  static void hideLoading({required BuildContext context}) {
    Navigator.pop(context);
  }

  static void showMessage({
    required BuildContext context,
    required String message,
    String? title,
    String? posActionName,
    Function? posAction,
    String? negActionName,
    Function? negAction,
    bool barrierDismissible = true,
  }) {
    List<Widget>? actions = [];
    if (posActionName != null) {
      actions.add(
        TextButton(
          onPressed: () {
            Navigator.pop(context);
            // if(posAction != null){
            //   posAction.call();
            // }
            posAction?.call();
          },
          child: Text(posActionName, style: AppStyles.medium16Black),
        ),
      );
      if (negActionName != null) {
        actions.add(
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              negAction?.call();
            },
            child: Text(negActionName, style: AppStyles.medium16Black),
          ),
        );
      }
    }

    showDialog(
      barrierDismissible: barrierDismissible,
      context: context,
      builder: (context) => AlertDialog(
        content: Text(message, style: AppStyles.medium16Black),
        title: Text(title ?? '', style: AppStyles.medium16Black),
        actions: actions,
      ),
    );
  }
}
