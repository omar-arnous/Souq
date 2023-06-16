import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:souq/utils/constants.dart';

class SouqTheme {
  static TextTheme textTheme = TextTheme(
    titleLarge: GoogleFonts.poppins(
      fontSize: 24,
      color: kBlack,
    ),
    titleMedium: GoogleFonts.poppins(
      fontSize: 22,
      fontWeight: FontWeight.w700,
      color: kBlack,
    ),
    displayLarge: GoogleFonts.poppins(
      fontSize: 22,
      fontWeight: FontWeight.w700,
      color: kGray,
    ),
    bodyLarge: GoogleFonts.poppins(
      fontSize: 20,
      color: kWhite,
    ),
    bodyMedium: GoogleFonts.poppins(
      fontSize: 22,
      color: kBlack,
    ),
    bodySmall: GoogleFonts.poppins(
      fontSize: 16,
      color: kWhite,
    ),
    labelLarge: GoogleFonts.poppins(
      fontSize: 18,
      fontWeight: FontWeight.w500,
      color: kGray,
    ),
    labelMedium: GoogleFonts.poppins(
      fontSize: 16,
      color: kPrimary,
    ),
  );

  static ThemeData theme() {
    return ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: kWhite,
      brightness: Brightness.light,
      appBarTheme: const AppBarTheme(
        backgroundColor: kWhite,
        foregroundColor: kGray,
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        selectedItemColor: kPrimary,
        unselectedItemColor: kWhite,
        type: BottomNavigationBarType.fixed,
        backgroundColor: kBlack,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: const MaterialStatePropertyAll(kPrimary),
          foregroundColor: const MaterialStatePropertyAll(kWhite),
          shape: MaterialStateProperty.resolveWith<OutlinedBorder>((_) {
            return RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10));
          }),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: ButtonStyle(
          overlayColor: const MaterialStatePropertyAll(kPrimary),
          backgroundColor: const MaterialStatePropertyAll(kBlack),
          foregroundColor: const MaterialStatePropertyAll(kWhite),
          shape: MaterialStateProperty.resolveWith<OutlinedBorder>((_) {
            return RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10));
          }),
        ),
      ),
      cardTheme: CardTheme(
        color: kBlack,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        clipBehavior: Clip.hardEdge,
        elevation: 2,
      ),
      inputDecorationTheme: const InputDecorationTheme(
        labelStyle: TextStyle(
          color: kGray,
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: kPrimary,
          ),
        ),
      ),
      textTheme: textTheme,
    );
  }
}
