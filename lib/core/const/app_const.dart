import 'package:flutter/material.dart';

// Declare variables that can globally used through out the App.

final GlobalKey<ScaffoldMessengerState> messangerKey =
    GlobalKey<ScaffoldMessengerState>();

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

enum ApiStatus { initial, loading, success, error }

double? screenHeight;
double? pendingScreenHeight;
double? screenWidth;

const String baseUrl = 'https://dattebayo-api.onrender.com';

const Map<String, dynamic> apiHeader = {
  "username": "",
  "password": "",
};

class AppConst {
  AppConst._();

  static late final String _baseUrl;
  static late final String _imgBaseUrl;

  /// Getter for baseUrl of Application
  static String get baseUrl => _baseUrl;
  static String get imgBaseUrl => _imgBaseUrl;

  static Future<void> init() async {
    // await dotenv.load(fileName: ".env");
    // final envBaseUrl = dotenv.env['BASE_URL'];
    // final envImgBaseUrl = dotenv.env['IMG_BASE_URL'];

    // if (envBaseUrl == null || envBaseUrl.isEmpty) {
    //   throw Exception("BASE_URL is not defined in .env file");
    // } else if (envImgBaseUrl == null || envImgBaseUrl.isEmpty) {
    //   throw Exception("IMG_BASE_URL is not defined in .env file");
    // }

    // _baseUrl = envBaseUrl;
    // _imgBaseUrl = envImgBaseUrl;
  }
}
