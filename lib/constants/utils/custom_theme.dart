import 'package:flutter/material.dart';

import 'colors.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
      primaryColor: JobBoardColors.primaryColor,
      scaffoldBackgroundColor: Colors.white,
      fontFamily: 'Poppins',
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              elevation: 0,
              backgroundColor: JobBoardColors.primaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ))),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      appBarTheme: AppBarTheme(
          backgroundColor: JobBoardColors.bgColor,
          elevation: 0.25,
          centerTitle: true,
          titleTextStyle: TextStyle(
            color: JobBoardColors.primaryColor,
            fontWeight: FontWeight.w600,
            letterSpacing: 1.2,
            fontSize: 18,
            // fontStyle: FontStyle.italic
          ),
          iconTheme: IconThemeData(color: JobBoardColors.primaryColor)),
      iconTheme: IconThemeData(
        color: JobBoardColors.primaryColor,
      ),
      listTileTheme: ListTileThemeData(
        titleTextStyle: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w700,
          color: Colors.grey.shade800,
        ),
        subtitleTextStyle: const TextStyle(
          fontSize: 12,
          letterSpacing: 1.5,
          fontWeight: FontWeight.w500,
        ),
        iconColor: JobBoardColors.primaryColor,
        tileColor: Colors.grey.shade100,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10), side: BorderSide.none),
      ),
      cardColor: Colors.grey.shade50,
      cardTheme: CardTheme(
          elevation: 0.5,
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          color: Colors.grey.shade50),
      inputDecorationTheme: InputDecorationTheme(
          hintStyle: const TextStyle(
              color: Colors.grey, fontWeight: FontWeight.w400, fontSize: 12.0),
          contentPadding:
          const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.grey.shade300),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: JobBoardColors.primaryColor),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.red),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: JobBoardColors.primaryColor),
          )
      ),

      textTheme: TextTheme(
        displayLarge:
        TextStyle(fontSize: 32, fontWeight: FontWeight.w700, color: JobBoardColors.black),
        displayMedium:
        TextStyle(fontSize: 28, fontWeight: FontWeight.w700, color: JobBoardColors.black),
        displaySmall:
        TextStyle(fontSize: 26, fontWeight: FontWeight.w700, color: JobBoardColors.black),
        headlineLarge:
        TextStyle(fontSize: 22, fontWeight: FontWeight.w700, color: JobBoardColors.black),
        headlineMedium: TextStyle(
            fontSize: 18, fontWeight: FontWeight.w600, color: JobBoardColors.black),
        headlineSmall: TextStyle(
            fontSize: 16, fontWeight: FontWeight.w600, color: JobBoardColors.black),
        titleLarge: TextStyle(
          fontSize: 16,
          letterSpacing: 1.5,
          color: Colors.grey.shade700,
        ),
        titleMedium: TextStyle(
          fontSize: 14,
          letterSpacing: 1.7,
          color: Colors.grey.shade600,
        ),
        titleSmall: TextStyle(
          fontSize: 12,
          color: Colors.grey.shade400,
        ),
        bodyLarge: const TextStyle(),
        bodyMedium: const TextStyle(),
        bodySmall: const TextStyle(),
        labelLarge: TextStyle(
            color: JobBoardColors.black, fontSize: 15, fontWeight: FontWeight.w600),
        labelMedium: TextStyle(
            fontSize: 12, fontWeight: FontWeight.w600, color: JobBoardColors.black),
        labelSmall: TextStyle(
          fontSize: 9.5, letterSpacing: 1.0, fontWeight: FontWeight.w700, color: JobBoardColors.black,),
      ));
}