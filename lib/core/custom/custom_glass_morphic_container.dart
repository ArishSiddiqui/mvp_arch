import 'dart:ui';

import 'package:flutter/material.dart';

import '../const/color_const.dart';

class CustomGlassMorphicContainer extends StatelessWidget {
  final Widget child;
  final double? width;
  final double? height;
  final double? blurValue;
  final BorderRadiusGeometry? borderRadius;
  final EdgeInsets? padding;
  const CustomGlassMorphicContainer({
    required this.child,
    this.width,
    this.height,
    this.blurValue,
    this.borderRadius,
    this.padding = EdgeInsets.zero,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? double.infinity,
      height: height,
      decoration: BoxDecoration(
        borderRadius: borderRadius ?? BorderRadius.circular(15.0),
      ),
      child: ClipRRect(
        borderRadius: borderRadius ?? BorderRadius.circular(15.0),
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: blurValue ?? 5.0,
            sigmaY: blurValue ?? 5.0,
          ),
          child: Container(
            padding: padding,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  ColorsConst.gradientGrey.withOpacity(0.19),
                  ColorsConst.gradientGrey.withOpacity(0.5),
                  ColorsConst.gradientGrey.withOpacity(0.85),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
              borderRadius: borderRadius ?? BorderRadius.circular(15.0),
            ),
            child: child,
          ),
        ),
      ),
    );
  }
}
