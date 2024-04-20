import 'package:flutter/material.dart';

import '../../core/const/app_const.dart';

class AppPages {
  static const String login = '/';
  static const String signUp = '/signUp';
  static const String home = '/home';
  static const String detail = '/detail';
}

class Head {
  static Future<Object?> to(String pageName, {Object? arguments}) {
    return navigatorKey.currentState!.pushNamed(
      pageName,
      arguments: arguments,
    );
  }

  static Future<Object?> off(String pageName, {Object? arguments}) {
    return navigatorKey.currentState!.pushReplacementNamed(
      pageName,
      arguments: arguments,
    );
  }

  static Future<Object?> offAll(String pageName, {Object? arguments}) {
    return navigatorKey.currentState!.pushNamedAndRemoveUntil(
      pageName,
      ModalRoute.withName(pageName),
      arguments: arguments,
    );
  }

  static void back([Object? result]) {
    return navigatorKey.currentState!.pop(result);
  }

  static void backUntil(String pageName) {
    return navigatorKey.currentState!.popUntil(
      ModalRoute.withName(pageName),
    );
  }
}
