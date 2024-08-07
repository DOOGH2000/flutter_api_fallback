import 'package:flutter/material.dart';

import '../style/app_colors.dart';
import '../style/app_size.dart';
import 'custom_icon.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.icon,
    this.onTap,
    this.width,
    this.height,
    this.radius,
    this.bgColor,
    this.textColor,
    this.borderColor,
    required this.title,
    this.loading = false,
    this.iconColored = false,
    required Future<Null> Function() onPressed,
    required String text,
  });

  final String title;
  final bool loading;
  final String? icon;
  final double? width;
  final double? radius;
  final double? height;
  final Color? bgColor;
  final Color? textColor;
  final bool? iconColored;
  final Function()? onTap;
  final Color? borderColor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap,
      borderRadius: BorderRadius.circular(AppSize.getVerticalSize(8)),
      child: Container(
        width: width ?? double.infinity,
        height: height ?? AppSize.getVerticalSize(48),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            radius ?? AppSize.getVerticalSize(8),
          ),
          color: loading ? AppColors.grey : bgColor ?? AppColors.primary,
          border: borderColor != null && !loading
              ? Border.all(width: 1, color: borderColor!)
              : null,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            /// ICON
            if (icon != null && !loading) ...[
              CustomIcon(
                icon: icon!,
                withColor: iconColored!,
              ),
              SizedBox(width: AppSize.getHorizontalSize(15)),
            ],

            /// LOADING
            if (loading)
              SizedBox(
                width: AppSize.getSize(26),
                height: AppSize.getSize(26),
                child: const CircularProgressIndicator(
                  strokeWidth: 3,
                  color: AppColors.white,
                ),
              ),

            /// TEXT
            if (!loading)
              Text(
                title,
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: AppSize.fontSize(16),
                  color: textColor ?? AppColors.white,
                ),
                textAlign: TextAlign.center,
              ),
          ],
        ),
      ),
    );
  }
}
