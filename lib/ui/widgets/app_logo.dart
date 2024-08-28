import 'package:amaliyot_oxiringi_oy/core/constants/app_constants.dart';
import 'package:flutter/material.dart';

class AppLogo extends StatelessWidget {
  final double? width;
  final double? height;
  final BoxFit? fit;
  const AppLogo({
    super.key,
    this.width,
    this.height,
    this.fit,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      Images.logo,
      width: width ?? 178,
      height: height ?? 173,
      fit: fit,
    );
  }
}
