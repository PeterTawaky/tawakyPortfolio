import 'package:flutter/widgets.dart';

class AppColors {
  AppColors._();
  static const Color textSky = Color(0XFF00BFFF);
  static const Color borderSkyLight = Color(0XFF00BFFF);
  static const Color backGroundSkyDark = Color(0XFF1E3342);
  static const Color borderSkyDark = Color(0XFF0D5673);
  static const Color borderSkyMedium = Color(0XFF107296);
  static const Color buttonSky = Color(0XFF02AEE9);
  static const Color textBlack = Color(0XFF15181E);
  static const Color white = Color(0XFFF2F2F2);
  static const Color grey = Color(0XFF8F96A3);
  static const Color buttonBackgroundColor = Color(0XFF122935);
  static const Color cardBackgroundColor = Color(0XFF21242C);
  static const Color primaryBackgroundColor = Color(0XFF15181F);
  static const Gradient gradientBackground = LinearGradient(
    colors: [Color(0XFF15181F), Color(0XFF151A20), Color(0XFF15181F)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
  static const Gradient gradientContainer = LinearGradient(
    colors: [borderSkyDark, borderSkyMedium, borderSkyDark],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
  static const List<Color> projectColors = [
    Color(0XFF432C4B),
    Color(0XFF243953),
    Color(0XFF204438),
    Color(0XFF4C322A),
    Color(0XFF4A4025),
  ];
}
