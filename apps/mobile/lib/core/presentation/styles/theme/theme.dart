import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final ThemeData themeData = ThemeData(
  fontFamily: 'Roboto',
  primaryColor: const Color(0xff1E1E1E),
  backgroundColor: const Color(0xffEEEEEE),
  colorScheme: ColorScheme.fromSwatch().copyWith(
    primary: const Color(0xff1E1E1E),
    secondary: const Color(0xffAF2F36),
    tertiary: const Color(0xffE0AB20),
    background: const Color(0xffEEEEEE),
  ),
  scaffoldBackgroundColor: const Color(0xffEEEEEE),
  textTheme: TextTheme(
    labelMedium: GoogleFonts.roboto(
      color: const Color(0xff7D7777),
      fontWeight: FontWeight.w300,
      fontSize: 20.0,
    ),
    headline6: GoogleFonts.roboto(
      color: const Color(0xff1E1E1E),
      fontSize: 20.0,
      fontWeight: FontWeight.w600,
    ),
    headline5: GoogleFonts.roboto(
      color: const Color(0xff1E1E1E),
      fontSize: 22.0,
      fontWeight: FontWeight.w400,
    ),
    headline4: GoogleFonts.poppins(
      color: const Color(0xff1E1E1E),
      fontSize: 26.0,
      fontWeight: FontWeight.w500,
    ),
    headline3: GoogleFonts.poppins(
      color: const Color(0xff1E1E1E),
      fontSize: 28.0,
      fontWeight: FontWeight.w500,
    ),
    headline2: GoogleFonts.poppins(
      color: const Color(0xff1E1E1E),
      fontSize: 60.0,
      fontWeight: FontWeight.w300,
    ),
    bodyText1: GoogleFonts.roboto(
      color: const Color(0xff1E1E1E),
      fontWeight: FontWeight.w500,
      fontSize: 14.0,
    ),
    bodyText2: GoogleFonts.roboto(
      color: const Color(0xff1E1E1E),
      fontWeight: FontWeight.w500,
      fontSize: 18.0,
    ),
    button: GoogleFonts.roboto(
      color: Colors.white,
      fontWeight: FontWeight.w500,
      fontSize: 18.0,
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(25.0),
        ),
      ),
      minimumSize: const Size(260.0, 55.0),
    ),
  ),
  iconTheme: const IconThemeData(
    color: Color(0xff1E1E1E),
  ),
  inputDecorationTheme: InputDecorationTheme(
    suffixIconColor: const Color(0xff1E1E1E),
    prefixIconColor: const Color(0xff1E1E1E),
    focusColor: const Color(0xff1E1E1E),
    labelStyle: GoogleFonts.roboto(
      color: const Color(0xff1E1E1E),
      fontWeight: FontWeight.w500,
      fontSize: 18.0,
    ),
    hintStyle: GoogleFonts.roboto(
      color: const Color(0xff686666),
      fontWeight: FontWeight.w500,
      fontSize: 18.0,
    ),
    contentPadding:
        const EdgeInsets.symmetric(vertical: 23.0, horizontal: 20.0),
    border: const OutlineInputBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(12.0),
      ),
      borderSide: BorderSide(
        width: 2.0,
      ),
    ),
    focusedBorder: const OutlineInputBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(12.0),
      ),
      borderSide: BorderSide(
        width: 2.0,
      ),
    ),
    enabledBorder: const OutlineInputBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(12.0),
      ),
      borderSide: BorderSide(
        width: 2.0,
      ),
    ),
  ),
  listTileTheme: ListTileThemeData(
    textColor: const Color(0xff1E1E1E),
    iconColor: const Color(0xff1E1E1E),
    tileColor: Colors.white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15.0),
    ),
  ),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: const Color(0xff1E1E1E),
    foregroundColor: Colors.white,
    extendedIconLabelSpacing: 25.0,
    extendedPadding: const EdgeInsets.symmetric(horizontal: 30.0),
    extendedTextStyle: GoogleFonts.roboto(
      color: Colors.white,
      fontWeight: FontWeight.w500,
      fontSize: 18.0,
    ),
  ),
);
