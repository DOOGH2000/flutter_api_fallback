import 'package:flutter/material.dart';

import '../style/app_colors.dart';
import '../style/app_size.dart';
import 'custom_icon.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    this.title,
    this.hintText,
    this.controller,
    this.onSubmit,
    this.onChanged,
    this.iconStart,
    this.iconEnd,
    this.iconEndTap,
    this.minLines = 1,
    this.maxLines = 1,
    this.enabled = true,
    this.validator,
    this.iconColor = false,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
  });

  final TextInputType keyboardType;
  final TextEditingController? controller;

  final bool iconColor;
  final String? iconEnd;
  final String? iconStart;
  final Function()? iconEndTap;

  final String? title;
  final String? hintText;
  final bool obscureText;

  final int minLines;
  final int maxLines;
  final bool enabled;

  final Function(String)? onSubmit;
  final Function(String)? onChanged;

  final FormFieldValidator<String>? validator;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title != null) ...[
          Text(
            title!,
            style: TextStyle(
              color: AppColors.black,
              fontWeight: FontWeight.w500,
              fontSize: AppSize.fontSize(14),
            ),
          ),
          SizedBox(height: AppSize.getVerticalSize(6)),
        ],
        TextFormField(
          enabled: enabled,
          minLines: minLines,
          maxLines: maxLines,
          onChanged: onChanged,
          controller: controller,
          obscureText: obscureText,
          onFieldSubmitted: onSubmit,
          keyboardType: keyboardType,
          style: TextStyle(
            height: 1.6,
            fontWeight: FontWeight.w600,
            fontSize: AppSize.fontSize(14),
          ),
          validator: validator ?? (val) => null,
          decoration: InputDecoration(
            hintText: hintText ?? title ?? '',

            /// ICON IN START
            prefixIcon: iconStart != null
                ? CustomIcon(
                    icon: iconStart!,
                    color: iconColor ? null : AppColors.primary,
                  )
                : null,

            /// ICON IN END
            suffixIcon: iconEnd != null
                ? CustomIcon(
                    icon: iconEnd!,
                    onTap: iconEndTap,
                    color: iconColor ? null : AppColors.grey,
                  )
                : null,
          ),
        ),
      ],
    );
  }
}
