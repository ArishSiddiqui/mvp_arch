import 'package:flutter/material.dart';
import 'package:mvp_arch/config/navigation/app_navigation.dart';

import '../../feature/auth/login/view/login_page.dart';

class AppRoutes {
  static Map<String, Widget Function(BuildContext)> routes = {
    AppPages.login: (context) => const LoginPage(),
  };
}
