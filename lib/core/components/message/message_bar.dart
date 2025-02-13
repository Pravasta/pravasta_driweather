import 'package:flutter/material.dart';

import '../../constant/style/app_colors.dart';
import '../../constant/style/app_text.dart';

class MessageBar {
  static ScaffoldFeatureController<SnackBar, SnackBarClosedReason> messageBar(
      BuildContext context, String message) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: AppColors.backgroundColorLast,
        content: Text(message, style: AppText.text14),
      ),
    );
  }
}
