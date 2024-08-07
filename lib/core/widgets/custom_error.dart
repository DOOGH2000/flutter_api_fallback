import 'package:flutter/material.dart';

import '../constant/app_images.dart';
import '../style/app_colors.dart';
import '../style/app_size.dart';
import 'custom_svg.dart';

class CustomError extends StatelessWidget {
  const CustomError({super.key, this.onTap, this.space});

  final double? space;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          SizedBox(height: space ?? AppSize.getVerticalSize(125)),

          /// IMAGE
          CustomSvg(svg: AppSvg.error, height: AppSize.getVerticalSize(225)),
          SizedBox(height: AppSize.getVerticalSize(30)),

          /// TEXT
          const Text(
            'There was a problem while downloading, please try again',
            style: TextStyle(fontWeight: FontWeight.bold, height: 1.8),
            textAlign: TextAlign.center,
          ),

          if (onTap != null) ...[
            SizedBox(height: AppSize.getVerticalSize(30)),
            InkWell(
              onTap: onTap,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColors.primary.withOpacity(.2),
                ),
                padding: AppSize.padding(vertical: 8, horizontal: 16),
                child: const Text(
                  'Refresh',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            )
          ],
        ],
      ),
    );
  }
}