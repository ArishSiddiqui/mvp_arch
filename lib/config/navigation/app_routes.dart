import 'package:flutter/material.dart';

import '../../core/custom/custom.dart';
import '../../feature/auth/login/view/login_page.dart';
import '../../feature/auth/signUp/view/sign_up_page.dart';
import '../../feature/home/view/home_page.dart';
import 'app_navigation.dart';

class AppRoutes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    return switch (settings.name) {
      AppPages.login => MaterialPageRoute(
          settings: settings,
          builder: (BuildContext context) => const LoginPage(),
        ),
      AppPages.signUp => MaterialPageRoute(
          settings: settings,
          builder: (BuildContext context) {
            final String eamilOrNumber = settings.arguments as String;
            return SignUpPage(
              eamilOrNumber: eamilOrNumber,
            );
          },
        ),
      AppPages.home => MaterialPageRoute(
          settings: settings,
          builder: (BuildContext context) => const HomePage(),
        ),
      _ => MaterialPageRoute(
          settings: settings,
          builder: (BuildContext context) => const CustomNoPageWidget(),
        ),
    };
  }
}
