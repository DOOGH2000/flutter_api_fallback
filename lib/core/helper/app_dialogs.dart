import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../style/app_colors.dart';

class AppDialogs {
  static void toast({
    required String msg,
    bg = AppColors.primary,
  }) {
    Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 2,
      backgroundColor: bg,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }
}
