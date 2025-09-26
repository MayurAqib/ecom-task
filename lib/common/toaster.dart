import 'package:flutter/material.dart';
import 'package:ecommercetask/common/navigation.dart';
import 'package:ecommercetask/constants/colors.dart';

void showSnackBar(String message, {Color color = themeRed}) {
  final scaffoldMessenger = ScaffoldMessenger.of(
    NavigationService.navigatorKey.currentContext!,
  );
  scaffoldMessenger.hideCurrentSnackBar();
  final snackBar = SnackBar(
    content: Text(message),
    duration: const Duration(seconds: 3),
    behavior: SnackBarBehavior.floating,
    backgroundColor: color,
  );

  scaffoldMessenger.showSnackBar(snackBar);
}
