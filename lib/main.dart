import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'config/navigation/navigator.dart';
import 'core/const/app_const.dart';
import 'core/const/color_const.dart';
import 'core/networkChecker/network_checker.dart';
import 'injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppConst.init();
  await di.init();
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
    final mQ = MediaQuery.of(context);
    screenHeight = mQ.size.height;
    screenWidth = mQ.size.width;
    pendingScreenHeight =
        mQ.size.height - (mQ.viewPadding.top + kBottomNavigationBarHeight);
    return MaterialApp(
      title: 'Flutter Demo',
      scaffoldMessengerKey: messangerKey,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: ColorsConst.black90,
        colorScheme: ColorScheme.fromSeed(
          seedColor: ColorsConst.purple,
        ),
        useMaterial3: true,
      ),
      navigatorKey: navigatorKey,
      // initialRoute: AppPages.home,
      onGenerateRoute: AppRoutes.generateRoute,
      // routes: AppRoutes.routes,
    );
  }
}
