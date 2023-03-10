import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:treint/app/style/app_text_styles.dart';

import 'app_colors.dart';

class AppTheme {
  AppTheme({
    required this.context,
  });

  final BuildContext context;

  ThemeData get ligitTheme {
    return ThemeData(
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          padding: MaterialStateProperty.all(EdgeInsets.zero),
        ),
      ),
      buttonTheme: const ButtonThemeData().copyWith(
        padding: EdgeInsets.zero,
        colorScheme: ThemeData().colorScheme.copyWith(primary: AppColors.white),
      ),
      iconTheme: const IconThemeData(
        color: AppColors.white,
      ),
      scaffoldBackgroundColor: AppColors.grayBackground,
      appBarTheme: AppBarTheme(
        elevation: 0,
        titleTextStyle: AppTextStyle.bold20(context)!.copyWith(
          color: AppColors.black,
        ),
        shape: const RoundedRectangleBorder(
          side: BorderSide(width: 1.5, color: AppColors.grayStroke),
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(32),
          ),
        ),
        systemOverlayStyle: const SystemUiOverlayStyle(
          systemNavigationBarColor: Colors.white,
          statusBarColor: Colors.white,
          statusBarBrightness: Brightness.light,
          statusBarIconBrightness: Brightness.light,
          systemNavigationBarIconBrightness: Brightness.light,
        ),
        iconTheme: const IconThemeData(
          color: AppColors.black,
        ),
      ),
      colorScheme: ThemeData().colorScheme.copyWith(primary: AppColors.white),
      textTheme: const TextTheme(
        bodyText1: TextStyle(
          fontStyle: FontStyle.normal,
        ),
        bodyText2: TextStyle(
          fontStyle: FontStyle.normal,
        ),
        headline1: TextStyle(
          fontStyle: FontStyle.normal,
        ),
        headline2: TextStyle(
          fontStyle: FontStyle.normal,
        ),
        headline3: TextStyle(
          fontStyle: FontStyle.normal,
        ),
        headline4: TextStyle(
          fontStyle: FontStyle.normal,
        ),
        headline5: TextStyle(
          fontStyle: FontStyle.normal,
        ),
        headline6: TextStyle(
          fontStyle: FontStyle.normal,
        ),
        caption: TextStyle(
          fontStyle: FontStyle.normal,
        ),
        subtitle1: TextStyle(
          fontStyle: FontStyle.normal,
        ),
        subtitle2: TextStyle(
          fontStyle: FontStyle.normal,
        ),
      ).apply(
        bodyColor: AppColors.black,
        displayColor: AppColors.black,
        decorationColor: AppColors.black,
      ),
      fontFamily: 'Gilroy',
    );
  }
}
