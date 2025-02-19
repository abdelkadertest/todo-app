import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo/theme/my_theme.dart';

class LightTheme extends BaseTheme {
  @override
  Color get backgroundColor => const Color(0xffF2FEFF);

  @override
  Color get primaryColor => const Color(0xff5669FF);

  @override
  Color get textColor => const Color(0xff1C1C1C);

  @override
  ThemeData get themeData => ThemeData(
        primaryColor: primaryColor,
        cardColor: backgroundColor,
        hintColor: textColor,
        focusColor: const Color(0xff7B7B7B),
        canvasColor: const Color(0xff7B7B7B),
        appBarTheme: AppBarTheme(
          titleTextStyle: GoogleFonts.inter(
            fontSize: 24.0,
            fontWeight: FontWeight.w400,
            color: const Color(0xff101127),
          ),
          centerTitle: true,
          backgroundColor: backgroundColor,
        ),
        scaffoldBackgroundColor: backgroundColor,
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          showSelectedLabels: true,
          showUnselectedLabels: true,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white,
          backgroundColor: primaryColor,
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
          backgroundColor: primaryColor,
          elevation: 0,
          iconSize: 40,
          shape: OutlineInputBorder(
            borderRadius: BorderRadius.circular(40),
            borderSide: const BorderSide(
              color:  Color(0xffF2FEFF),
              width: 3,
            ),
          ),

        ),
        textTheme: TextTheme(
          titleSmall: GoogleFonts.inter(
            fontSize: 16.0,
            fontWeight: FontWeight.w500,
            color: const Color(0xff1C1C1C),
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
