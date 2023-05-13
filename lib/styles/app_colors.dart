import 'dart:ui';

enum AppColors {
  primaryColor(Color(0xFF333333)),

  secondaryColor(Color(0xFF333333)),
  background(Color(0xFFFFFFFF)),
  accentColor(Color(0xFF333333));

  final Color color;
  const AppColors(this.color);
}
