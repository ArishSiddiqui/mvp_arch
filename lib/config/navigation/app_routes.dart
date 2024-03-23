import 'package:flutter/material.dart';

import '../../feature/auth/login/view/login_page.dart';
import '../../feature/auth/signUp/view/sign_up_page.dart';
import 'app_navigation.dart';

class AppRoutes {
  static Map<String, Widget Function(BuildContext)> routes = {
    AppPages.login: (context) => const LoginPage(),
    AppPages.signUp: (context) => const SignUpPage(),
  };
}
