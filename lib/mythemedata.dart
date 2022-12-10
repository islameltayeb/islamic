import 'package:flutter/material.dart';

class MythemeData {
  static Color primiaryColor = Color(0xffB7935F);
  static Color accentColor = Color(0xff242424);
  static Color primiaryColorDark = Color(0xff141A2E);
  static Color accentColorDark = Color(0xffFACC1D);
  static ThemeData lightTheme = ThemeData(
      primaryColor: primiaryColor,
      accentColor: accentColor,
      scaffoldBackgroundColor: Colors.transparent,
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        selectedItemColor: accentColor,
      ),
      appBarTheme: const AppBarTheme(
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          )),
      textTheme: TextTheme(
          bodyText1: TextStyle(
              fontSize: 25, fontWeight: FontWeight.w500, color: accentColor),
        bodyText2: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: accentColor
        ),
          subtitle1: TextStyle(
              fontSize: 14,
              color: accentColor,
              fontWeight: FontWeight.bold

          ),
        headline1:TextStyle(
          color: Colors.black,
          fontSize: 30,
          fontWeight: FontWeight.bold,
        ),

      )

  );
  static ThemeData darkTheme = ThemeData(
    primaryColor: primiaryColor,
    accentColor: accentColor,
    scaffoldBackgroundColor: Colors.transparent,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: accentColorDark,
    ),
    appBarTheme: const AppBarTheme(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 30,
          fontWeight: FontWeight.bold,
        )),
    textTheme: const TextTheme(
      bodyText1: TextStyle(
          fontSize: 25, fontWeight: FontWeight.w500, color: Colors.white),

      bodyText2: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
          color: Color(0xffF8F8F8)
      ),
      subtitle1: TextStyle(
        fontSize: 24,
        color: Colors.white,
        fontWeight: FontWeight.bold

      ),
      headline1:TextStyle(
        color:Color(0xffFACC1D),
        fontSize: 30,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}
