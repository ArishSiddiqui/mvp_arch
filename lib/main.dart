import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'config/navigation/navigator.dart';
import 'core/const/app_const.dart';
import 'core/const/color_const.dart';
import 'core/networkChecker/network_checker.dart';

void main() {
  runApp(
    const ProviderScope(child: MyApp()),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  initState() {
    super.initState();
    verifyConnection();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      scaffoldMessengerKey: messangerKey,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: ColorsConst.purple,
        ),
        useMaterial3: true,
      ),
      navigatorKey: navigatorKey,
      initialRoute: AppPages.login,
      routes: AppRoutes.routes,
    );
  }
}
