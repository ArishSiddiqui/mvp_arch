import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../const/asset_const.dart';
import '../const/color_const.dart';

class NoInternetWidget extends StatelessWidget {
  const NoInternetWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(30.0),
            decoration: BoxDecoration(
              color: ColorsConst.warningRed.withOpacity(0.15),
              shape: BoxShape.circle,
            ),
            child: SvgPicture.asset(
              AssetIcons.router,
              height: 50.0,
              colorFilter: const ColorFilter.mode(
                ColorsConst.warningRed,
                BlendMode.srcIn,
              ),
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),
          const Text(
            'No Internet Connection',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          const Text(
            'Please check your internet connection\nand try again',
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
