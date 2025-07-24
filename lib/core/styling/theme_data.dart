import 'package:flutter/material.dart';
import 'package:go_transitions/go_transitions.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';
import 'app_styles.dart';

class AppThemes {
  static final lightTheme = ThemeData(
    pageTransitionsTheme: PageTransitionsTheme(
      builders: {
        TargetPlatform.android: GoTransitions.slide.toRight.withFade,
        TargetPlatform.iOS: GoTransitions.slide.toRight.withFade,
        TargetPlatform.macOS: GoTransitions.slide.toRight.withFade,
      },
    ),
    primaryColor: AppColors.primaryColor,
    scaffoldBackgroundColor: AppColors.whiteColor,
    fontFamily: GoogleFonts.readexPro().fontFamily,
    textTheme: GoogleFonts.readexProTextTheme().copyWith(
      titleLarge: AppStyles.primaryHeadLinesStyle,
      titleMedium: AppStyles.subtitlesStyles,
    ),
    buttonTheme: ButtonThemeData(
      buttonColor: AppColors.primaryColor,
      disabledColor: AppColors.secondaryColor,
    ),
  );
}
