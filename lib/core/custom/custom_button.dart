import 'package:flutter/material.dart';

import '../const/color_const.dart';

class CustomButton extends StatelessWidget {
  final String name;
  final void Function()? onTap;
  final bool disable;
  const CustomButton({
    required this.name,
    required this.onTap,
    this.disable = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.0,
      width: double.infinity,
      child: TextButton(
        style: TextButton.styleFrom(
          foregroundColor: ColorsConst.white,
          backgroundColor:
              disable ? ColorsConst.disabledGrey : ColorsConst.purple,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
        onPressed: onTap,
        child: Text(
          name,
          style: const TextStyle(
            fontSize: 14.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
