import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../../../utils/app_assets.dart';

class ImgBgWidget extends StatelessWidget {
  const ImgBgWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Image.asset(
      AppImages.bgImg,
      height: size.height,
      width: size.width,
      fit: BoxFit.fitHeight,
      alignment: Alignment(
        ResponsiveBreakpoints.of(context).screenWidth > 1100
            ? -0.8
            : ResponsiveBreakpoints.of(context).screenWidth > 1200
                ? -0.75
                : -0.83,
        0,
      ),
    );
  }
}
