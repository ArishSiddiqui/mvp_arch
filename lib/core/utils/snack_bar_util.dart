import 'package:flutter/material.dart';

import '../const/app_const.dart';
import '../const/color_const.dart';

showCustomSnackBar({
  required String message,
  IconData? icon,
  Color? backgroundColor,
  DismissDirection dismissDirection = DismissDirection.down,
  Duration? duration,
}) {
  messangerKey.currentState!.clearSnackBars();
  messangerKey.currentState!.showSnackBar(
    SnackBar(
      content: Row(
        children: [
          Visibility(
            visible: icon != null,
            child: Icon(
              icon,
              color: ColorsConst.white,
            ),
          ),
          Visibility(
            visible: icon != null,
            child: const SizedBox(
              width: 10.0,
            ),
          ),
          Expanded(
            child: Text(
              message,
            ),
          ),
        ],
      ),
      backgroundColor: backgroundColor,
      behavior: SnackBarBehavior.floating,
      dismissDirection: dismissDirection,
      duration: duration ?? const Duration(seconds: 4),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
    ),
  );
}
