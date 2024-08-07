import 'package:flutter/material.dart';

class AppShadow {
  /// DEFAULT APP SHADOW
  static List<BoxShadow> primary = [
    BoxShadow(
      blurRadius: 60,spreadRadius: 20,
      offset: const Offset(0, 30),
      color: const Color(0xff8A959E).withOpacity(.15),
    ),
  ];
}
