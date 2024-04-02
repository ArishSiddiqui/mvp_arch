import 'package:flutter/material.dart';

import '../const/color_const.dart';

class CustomLoader extends StatelessWidget {
  const CustomLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        color: ColorsConst.purple,
      ),
    );
  }
}
