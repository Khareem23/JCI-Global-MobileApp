import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jci_remit_mobile/values/values.dart';

extension CustomThemeContext on BuildContext {
  ThemeData get themeData => ThemeData(
        primaryColor: AppColors.primaryColor,
        accentColor: AppColors.accentColor,
        backgroundColor: Colors.white,
        textTheme: textTheme,
        appBarTheme: AppBarTheme(
            color: AppColors.primaryColor.withOpacity(0.4),
            titleTextStyle: TextStyle(color: Colors.black),
            centerTitle: true,
            elevation: 0,
            iconTheme: IconThemeData(color: Colors.black)),
        //textTheme: ,
      );

  TextTheme get textTheme =>
      GoogleFonts.dmSansTextTheme(Theme.of(this).textTheme.copyWith(
          headline2: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 30,
              letterSpacing: -0.165,
              color: AppColors.accentColor),
          headline4: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 18,
              letterSpacing: -0.165,
              color: AppColors.accentColor),
          headline3: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 15,
              letterSpacing: -0.165,
              color: AppColors.accentColor.withOpacity(0.8))));
}
