import 'package:flutter/material.dart';
import 'package:flutter_flex_website/styles/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyle {
  static TextStyle bannerFont = GoogleFonts.archivo(
    textStyle: TextStyle(
      color: AppColors.background.color,
      fontSize: 16,
      fontWeight: FontWeight.w500,
    ),
  );

  static get titleFont => GoogleFonts.ibmPlexMono(
        textStyle: TextStyle(
          color: AppColors.primaryColor.color,
          fontSize: 20,
          fontWeight: FontWeight.normal,
        ),
      );

  static TextStyle highlightTitleFont = GoogleFonts.ibmPlexMono(
    textStyle: TextStyle(
      color: AppColors.background.color,
      fontSize: 21,
      fontWeight: FontWeight.w600,
    ),
  );

  static TextStyle subtitleFont = GoogleFonts.spaceGrotesk(
    textStyle: TextStyle(
      color: AppColors.primaryColor.color,
      fontSize: 14,
      fontWeight: FontWeight.normal,
    ),
  );
  static get subtitleWhiteFont => GoogleFonts.spaceGrotesk(
        textStyle: TextStyle(
          color: AppColors.background.color,
          fontSize: 14,
          fontWeight: FontWeight.normal,
        ),
      );

  static TextStyle buttonFont = GoogleFonts.spaceGrotesk(
    textStyle: TextStyle(
      color: AppColors.background.color,
      fontWeight: FontWeight.bold,
      fontSize: 16,
    ),
  );
}
