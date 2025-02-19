import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo/theme/my_theme.dart';

class DarkTheme extends BaseTheme {
  @override
  Color get backgroundColor => const Color(0xff101127);

  @override
  Color get primaryColor => const Color(0xff5669FF);

  @override
  Color get textColor => const Color(0xffF4EBDC);

  @override
  ThemeData get themeData => ThemeData(
        primaryColor: primaryColor,
        cardColor: backgroundColor,
        hintColor: textColor,
        focusColor: primaryColor,
        canvasColor: const Color(0xff7B7B7B),
        appBarTheme: AppBarTheme(
          centerTitle: true,
          backgroundColor: backgroundColor,
        ),
        scaffoldBackgroundColor: backgroundColor,
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          showSelectedLabels: true,
          showUnselectedLabels: true,
          type: BottomNavigationBarType.fixed,
          unselectedItemColor: Colors.white,
          selectedItemColor: Colors.white,
          backgroundColor: backgroundColor,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          ),
        ),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: backgroundColor,
          elevation: 0,
          iconSize: 40,
          shape: OutlineInputBorder(
            borderRadius: BorderRadius.circular(40),
            borderSide: const BorderSide(
              color: Colors.white,
              width: 3,
            ),
          ),
        ),
        textTheme: TextTheme(
          titleSmall: GoogleFonts.inter(
            fontSize: 16.0,
            fontWeight: FontWeight.w500,
            color: textColor,
          ),
          titleMedium: GoogleFonts.inter(
            fontSize: 20.0,
            fontWeight: FontWeight.w700,
            color: primaryColor,
          ),
          titleLarge: GoogleFonts.inter(
            fontSize: 24.0,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
          bodySmall: GoogleFonts.inter(
            fontSize: 14.0,
            fontWeight: FontWeight.w400,
            color: Colors.white,
          ),
          bodyMedium: GoogleFonts.inter(
            fontSize: 20.0,
            fontWeight: FontWeight.w500,
            color: primaryColor,
          ),
        ),
      );
}
