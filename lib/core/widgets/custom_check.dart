import 'package:flutter/material.dart';


import '../constant/app_images.dart';
import '../style/app_size.dart';
import 'custom_icon.dart';

class CustomCheck extends StatelessWidget {
  const CustomCheck({super.key, required this.value, required this.onChange});

  final bool value;
  final Function(bool) onChange;

  @override
  Widget build(BuildContext context) {
    return CustomIcon(
      withColor: true,
      width: AppSize.getSize(20),
      height: AppSize.getSize(20),
      onTap: () => onChange(!value),
      icon: value ? AppIcons.checkOn : AppIcons.checkOff,
    );
  }
}
