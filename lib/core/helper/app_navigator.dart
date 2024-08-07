import 'package:page_transition/page_transition.dart';
import 'package:flutter/material.dart';

class AppNavigator {
  /// NAVIGATOR KEY
  static GlobalKey<NavigatorState> key = GlobalKey<NavigatorState>();



  /// NAVIGATOR PUSH
  static Future<void> push(
    Widget screen, {
    type = PageTransitionType.fade,
  }) async {
    await Navigator.push(
      key.currentState!.context,
      PageTransition(type: type, child: screen),
    );
  }

  /// NAVIGATOR PUSH AND REMOVE
  static Future<void> remove(
    Widget screen, {
    type = PageTransitionType.fade,
  }) async {
    await Navigator.pushAndRemoveUntil(
      key.currentState!.context,
      PageTransition(type: type, child: screen),
      (route) => false,
    );
  }

  /// NAVIGATOR PUSH
  static Future<void> pop() async => Navigator.pop(key.currentState!.context);
}
