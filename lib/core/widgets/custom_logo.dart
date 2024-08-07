import 'package:flutter/material.dart';

import '../constant/app_images.dart';
import '../style/app_colors.dart';
import '../style/app_size.dart';
import 'custom_svg.dart';

class CustomLogo extends StatelessWidget {
  const CustomLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomSvg(
          svg: AppSvg.logo,
          width: AppSize.getSize(120),
          height: AppSize.getSize(120),
        ),
        SizedBox(height: AppSize.getVerticalSize(22)),
        Text(
          'KROK PLUS',
          style: TextStyle(
            color: AppColors.primary,
            fontWeight: FontWeight.w700,
            fontSize: AppSize.fontSize(26),
          ),
        ),
      ],
    );
  }
}
