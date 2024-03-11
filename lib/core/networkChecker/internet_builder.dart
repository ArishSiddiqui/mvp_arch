import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:mvp_arch/core/networkChecker/network_checker.dart';

class InternetBuilder extends StatelessWidget {
  final Widget child;
  final Widget? noInternetWidget;
  const InternetBuilder({
    required this.child,
    this.noInternetWidget,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: connection,
      child: child,
      builder: (context, value, child) {
        return value == ConnectivityResult.none
            ? noInternetWidget ?? const NoInternetWidget()
            : child ?? const SizedBox.shrink();
      },
    );
  }
}
