import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppThemes {
  static final lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.blue,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.blue,
      foregroundColor: Colors.white,
    ),
    scaffoldBackgroundColor: Colors.white,
    fontFamily: GoogleFonts.openSans.toString(),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: Colors.black),
    ),
  );

  static final darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: Colors.grey[900],
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.black,
      foregroundColor: Colors.white,
    ),
    scaffoldBackgroundColor: Colors.black,
    fontFamily: GoogleFonts.openSans.toString(),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: Colors.white),
    ),
  );
}
