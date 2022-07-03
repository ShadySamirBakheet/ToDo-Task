import 'package:flutter/material.dart';
import 'package:todo/core/resources/color_manager.dart';
import 'package:todo/core/resources/font_manager.dart';
import 'package:todo/core/resources/styles_manager.dart';
import 'package:todo/core/resources/values_manager.dart';

ThemeData getApplicationTheme() {
  return ThemeData(
    // main colors of the app
    primaryColor: ColorManager.primary,
    primaryColorLight: ColorManager.primaryOpacity70,
    primaryColorDark: ColorManager.darkPrimary,
    disabledColor: ColorManager.grey1,
    backgroundColor: ColorManager.white,
    canvasColor: ColorManager.white,
    // ripple color
    splashColor: ColorManager.primaryOpacity70,
    // card view theme
    cardTheme: CardTheme(
      color: ColorManager.white,
      shadowColor: ColorManager.grey,
      elevation: AppSize.s4,
    ),
    // App bar theme
    appBarTheme: AppBarTheme(
      centerTitle: true,
      color: ColorManager.white,
      elevation: AppSize.s4,
      shadowColor: ColorManager.primaryOpacity70,
      titleTextStyle:
          getRegularStyle(color: ColorManager.black, fontSize: FontSize.s18),
    ),
    // Button theme
    buttonTheme: ButtonThemeData(
      shape: const StadiumBorder(),
      disabledColor: ColorManager.grey1,
      buttonColor: ColorManager.primary,
      splashColor: ColorManager.primaryOpacity70,
    ),

    // elevated button theme
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        textStyle: getRegularStyle(color: ColorManager.white),
        primary: ColorManager.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSize.s8),
        ),
        minimumSize: const Size.fromHeight(50),
      ),
    ),

    // Text theme
    textTheme: TextTheme(
      headline1: getBoldStyle(
        color: ColorManager.primary,
        fontSize: FontSize.s36,
      ),
      headline2: getBoldStyle(
        color: ColorManager.black,
        fontSize: FontSize.s30,
      ),
      headline3: getRegularStyle(
        color: ColorManager.black,
        fontSize: FontSize.s22,
      ),
      headline4: getRegularStyle(
        color: ColorManager.black,
        fontSize: FontSize.s18,
      ),
      headline5: getBoldStyle(
        color: ColorManager.black,
        fontSize: FontSize.s17,
      ),
      headline6: getRegularStyle(
        color: ColorManager.black,
        fontSize: FontSize.s16,
      ),
      subtitle1: getMediumStyle(
        color: ColorManager.grey,
        fontSize: FontSize.s15,
      ),
      subtitle2: getMediumStyle(
        color: ColorManager.grey,
        fontSize: FontSize.s14,
      ),
      bodyText2: getMediumStyle(
        color: ColorManager.lightGrey,
        fontSize: FontSize.s14,
      ),
      caption: getRegularStyle(
        color: ColorManager.grey1,
        fontSize: FontSize.s13,
      ),
      bodyText1: getRegularStyle(
        color: ColorManager.black,
        fontSize: FontSize.s14,
      ),
      button: getBoldStyle(
        color: ColorManager.white,
        fontSize: FontSize.s18,
      ),
    ),
    // input decoration theme (text form field)

    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: ColorManager.inputBackground,

      contentPadding: const EdgeInsets.all(AppPadding.p8),
      // hint style
      hintStyle: getRegularStyle(
        color: ColorManager.black,
        fontSize: FontSize.s16,
      ),

      // label style
      labelStyle: getMediumStyle(
        color: ColorManager.black,
        fontSize: FontSize.s16,
      ),
      // error style
      errorStyle: getRegularStyle(
        color: ColorManager.error,
        fontSize: FontSize.s16,
      ),

      helperStyle: getMediumStyle(
        color: ColorManager.black,
        fontSize: FontSize.s16,
      ),

      // enabled border
      enabledBorder: border,
      // focused border
      focusedBorder: border,
      // error border
      errorBorder: border,
      // focused error border
      focusedErrorBorder: border,

      border: border,
    ),

    colorScheme:
        ColorScheme.fromSwatch().copyWith(secondary: ColorManager.grey),
  );
}

OutlineInputBorder get border => OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide.none,
    );
