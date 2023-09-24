import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:to_do/shared/styles/colors.dart';

class MyThemeData {
  static ThemeData lightTheme = ThemeData(
      scaffoldBackgroundColor: MyColors.backColor,
      appBarTheme: AppBarTheme(
        backgroundColor: MyColors.appBarColor,
        iconTheme: IconThemeData(color: MyColors.whiteColor),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedItemColor: MyColors.appBarColor,
          unselectedItemColor: MyColors.unselectedIconColor,
          backgroundColor: Colors.transparent,
          elevation: 0),
      textTheme: TextTheme(
          bodyLarge: GoogleFonts.poppins(
              fontSize: 22,
              fontWeight: FontWeight.w700,
              color: MyColors.whiteColor),
          bodySmall: GoogleFonts.poppins(
              fontSize: 12,
              color: MyColors.lighterBlack,
              fontWeight: FontWeight.w400)));
  static ThemeData darkTheme = ThemeData(
      scaffoldBackgroundColor: MyColors.backColorDark,
      appBarTheme: AppBarTheme(
        backgroundColor: MyColors.appBarColor,
        iconTheme: IconThemeData(color: MyColors.blackColor),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        elevation: 0,
        selectedItemColor: MyColors.appBarColor,
        backgroundColor: Colors.transparent,
        unselectedItemColor: MyColors.unselectedIconColor,
      ),
      bottomAppBarTheme: BottomAppBarTheme(
          //elevation: 0,
          color: MyColors.bottomAppBarDark),
      textTheme: TextTheme(
          bodyLarge: GoogleFonts.poppins(
              fontSize: 22,
              fontWeight: FontWeight.w700,
              color: MyColors.blackColor),
          bodySmall: GoogleFonts.poppins(
              fontSize: 12,
              color: MyColors.whiteColor,
              fontWeight: FontWeight.w400)));
}
