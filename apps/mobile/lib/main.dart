import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile/views/screens/login/login-screen.dart';

void main() {
  runApp(const UELibApp());
}

class UELibApp extends StatelessWidget {
  const UELibApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'Poppins',
        primaryColor: const Color(0xff1E1E1E),
        backgroundColor: const Color(0xffEEEEEE),
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: const Color(0xff1E1E1E),
          secondary: const Color(0xffAF2F36),
          tertiary: const Color(0xffE0AB20),
          background: const Color(0xffEEEEEE),
        ),
        textTheme: TextTheme(
          headline4: GoogleFonts.poppins(
            fontSize: 26.0,
            fontWeight: FontWeight.w600,
          ),
          bodyText1: GoogleFonts.poppins(
            color: const Color(0xff1E1E1E),
            fontWeight: FontWeight.w500,
            fontSize: 14.0,
          ),
          bodyText2: GoogleFonts.poppins(
            color: const Color(0xff1E1E1E),
            fontWeight: FontWeight.w500,
            fontSize: 18.0,
          ),
          button: GoogleFonts.poppins(
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
              minimumSize: const Size(260.0, 55.0)),
        ),
        inputDecorationTheme: InputDecorationTheme(
          suffixIconColor: const Color(0xff1E1E1E),
          focusColor: const Color(0xff1E1E1E),
          labelStyle: GoogleFonts.poppins(
            color: const Color(0xff1E1E1E),
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
      ),
      home: const LoginScreen(),
    );
  }
}
