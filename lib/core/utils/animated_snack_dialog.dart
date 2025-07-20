import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';

/// Shows an animated snack bar dialog with customizable message and type
void showAnimatedSnackDialog(
    BuildContext context, {
      required String message,
      AnimatedSnackBarType type = AnimatedSnackBarType.success,
    }) {
  // Always show a user-friendly error message for error type
  final displayMessage = type == AnimatedSnackBarType.error
      ? "Something went wrong. Please try again."
      : message;

  AnimatedSnackBar.material(
    displayMessage,
    type: type,
    mobileSnackBarPosition: MobileSnackBarPosition.bottom,
    desktopSnackBarPosition: DesktopSnackBarPosition.topRight,
  ).show(context);
}