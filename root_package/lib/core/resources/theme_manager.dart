import 'package:flutter/material.dart';

import 'color_manager.dart';
import 'font_manager.dart';
import 'styles_manager.dart';
import 'values_manager.dart';

ThemeData getApplicationTheme() {
  return ThemeData(
    // main colors
    primaryColor: ColorManager.primary,
    primaryColorLight: ColorManager.lightPrimary,
    primaryColorDark: ColorManager.darkPrimary,
    disabledColor: ColorManager.grey1,
    scaffoldBackgroundColor: ColorManager.white,
    floatingActionButtonTheme:
        FloatingActionButtonThemeData(backgroundColor: ColorManager.primary),
    progressIndicatorTheme:
        ProgressIndicatorThemeData(color: ColorManager.primary),
    // ripple effect color
    // cardview theme
    iconTheme: IconThemeData(color: ColorManager.primary),
    colorScheme:
        const ColorScheme.light().copyWith(primary: ColorManager.primary),
    textSelectionTheme: TextSelectionThemeData(
        cursorColor: ColorManager.primary,
        selectionHandleColor: ColorManager.primary),
    cardTheme: CardTheme(
        color: ColorManager.white,
        shadowColor: ColorManager.grey,
        elevation: AppSize.s4),
    // app bar theme

    appBarTheme: AppBarTheme(
      centerTitle: true,
      color: ColorManager.white,
      elevation: AppSize.s1,
      foregroundColor: ColorManager.darkGrey,
      titleTextStyle:
          getRegularStyle(fontSize: FontSize.s20, color: ColorManager.darkGrey),
    ),
    // button theme
    buttonTheme: ButtonThemeData(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      disabledColor: ColorManager.grey1,
      buttonColor: ColorManager.primary,
    ),

    // elevated button them
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        textStyle:
            getSemiBoldStyle(color: ColorManager.white, fontSize: FontSize.s16),
        padding: const EdgeInsets.all(12),
        backgroundColor: ColorManager.primary,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSize.s8),
        ),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(foregroundColor: Colors.black)),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        side: BorderSide(color: ColorManager.outlinedBorderColor),
      ),
    ),

    // input decoration theme (text form field)
    inputDecorationTheme: InputDecorationTheme(
      // content padding>
      contentPadding: const EdgeInsets.all(AppPadding.p8),
      // hint styles
      iconColor: ColorManager.primary,
      hintStyle: getRegularStyle(
          color: ColorManager.grey.withOpacity(0.8), fontSize: FontSize.s14),
      labelStyle:
          getMediumStyle(color: ColorManager.grey, fontSize: FontSize.s16),
      errorStyle: getRegularStyle(color: ColorManager.error),
      border: const OutlineInputBorder(
        borderSide: BorderSide(
          width: AppSize.s1_5,
        ),
      ),

      focusColor: ColorManager.primary,
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: ColorManager.primary,
          width: AppSize.s1_5,
        ),
      ),
      // enabled border style
    ),
    // label style
  );
}
