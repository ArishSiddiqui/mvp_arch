import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

import '../const/color_const.dart';
import '../utils/snack_bar_util.dart';

final ValueNotifier<ConnectivityResult?> connection =
    ValueNotifier(null);

ConnectivityResult? previousState;

verifyConnection() {
  final Connectivity connectivity = Connectivity();
  connectivity.onConnectivityChanged.listen(
    (connectionStatus) {
      connection.value = connectionStatus;
      if (connectionStatus == ConnectivityResult.none) {
        previousState = connectionStatus;
        showCustomSnackBar(
          message: 'No Internet Connection',
          icon: Icons.public_off_rounded,
          backgroundColor: ColorsConst.warningRed,
          dismissDirection: DismissDirection.none,
          duration: const Duration(days: 1),
        );
      } else if (connectionStatus == ConnectivityResult.mobile &&
          previousState == ConnectivityResult.none) {
        showCustomSnackBar(
          message: 'Back Online.',
          icon: Icons.network_cell_rounded,
          backgroundColor: ColorsConst.coolGreen,
        );
      } else if (connectionStatus == ConnectivityResult.wifi &&
          previousState == ConnectivityResult.none) {
        showCustomSnackBar(
          message: 'Back Online.',
          icon: Icons.wifi_rounded,
          backgroundColor: ColorsConst.coolGreen,
        );
      }
    },
  );
}
