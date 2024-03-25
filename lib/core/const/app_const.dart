import 'package:flutter/material.dart';

final GlobalKey<ScaffoldMessengerState> messangerKey =
    GlobalKey<ScaffoldMessengerState>();

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

enum ApiStatus { initial, loading, success, error }

double? screenHeight;
double? pendingScreenHeight;
double? screenWidth;
