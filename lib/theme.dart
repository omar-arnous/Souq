import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SouqTheme {
  static TextTheme textTheme = TextTheme(
    titleLarge: GoogleFonts.poppins(
      fontSize: 28,
      color: const Color(0xff252525),
    ),
    titleMedium: GoogleFonts.poppins(
      fontSize: 24,
      fontWeight: FontWeight.w700,
      color: const Color(0xff252525),
    ),
    displayLarge: GoogleFonts.poppins(
      fontSize: 22,
      fontWeight: FontWeight.w700,
      color: const Color(0xff333333),
    ),
    bodyLarge: GoogleFonts.poppins(
      fontSize: 20,
      color: const Color(0xfff1f1f1),
    ),
    bodyMedium: GoogleFonts.poppins(
      fontSize: 22,
      color: const Color(0xff252525),
    ),
    bodySmall: GoogleFonts.poppins(
      fontSize: 16,
      color: const Color(0xfff1f1f1),
    ),
    labelLarge: GoogleFonts.poppins(
      fontSize: 20,
      fontWeight: FontWeight.w500,
      color: const Color(0xff333333),
    ),
    labelMedium: GoogleFonts.poppins(
      fontSize: 18,
      color: const Color(0xff1DE9B6),
    ),
  );

  static ThemeData theme() {
    return ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: Colors.white,
      brightness: Brightness.light,
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.white,
        foregroundColor: Color(0xff333333),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        selectedItemColor: Color(0xff1DE9B6),
        unselectedItemColor: Color(0xffe1e1e1),
        type: BottomNavigationBarType.fixed,
        backgroundColor: Color(0xff252525),
      ),
      elevatedButtonTheme: const ElevatedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: MaterialStatePropertyAll(Color(0xff1DE9B6)),
          foregroundColor: MaterialStatePropertyAll(Color(0xfff1f1f1)),
        ),
      ),
      outlinedButtonTheme: const OutlinedButtonThemeData(
        style: ButtonStyle(
          overlayColor: MaterialStatePropertyAll(Color(0xff1DE9B6)),
          backgroundColor: MaterialStatePropertyAll(Color(0xff252525)),
          foregroundColor: MaterialStatePropertyAll(Color(0xfff1f1f1)),
        ),
      ),
      textTheme: textTheme,
    );
  }
}
