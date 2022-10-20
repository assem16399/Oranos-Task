import 'package:flutter/material.dart';

import 'colors.dart';

final kLightTheme = ThemeData(
  colorScheme: ColorScheme.fromSwatch().copyWith(
    primary: kPrimaryColor,
    secondary: kSecondaryColor,
  ),
  scaffoldBackgroundColor: kPrimaryColor,
  textTheme: const TextTheme(
    headline5: TextStyle(
      color: kSecondaryColor, fontSize: 19, fontWeight: FontWeight.normal,
      // TODO add SFProText as the font family
    ),
    headline6: TextStyle(
      color: kTitleColor, fontSize: 16, fontWeight: FontWeight.w500,
      // TODO add SFProText as the font family
    ),
    bodyText2: TextStyle(color: kSecondaryColor, fontWeight: FontWeight.normal
        // TODO add Poppins as the font family
        ),
    subtitle1: TextStyle(
      color: kSubtitle1Color, fontSize: 14, fontWeight: FontWeight.w500,
      // TODO add SFProText as the font family
    ),
    subtitle2: TextStyle(
      color: kSubtitle2Color, fontSize: 12, fontWeight: FontWeight.normal,
      // TODO add SFProText as the font family
    ),
    caption: TextStyle(
        color: kSecondaryColor, fontWeight: FontWeight.normal, fontSize: 12
        // TODO add Poppins as the font family
        ),
    overline: TextStyle(
        color: kSubtitle2Color, fontWeight: FontWeight.w500, fontSize: 10
        // TODO add SFProText as the font family
        ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all(kElevatedButtonBGColor),
      foregroundColor: MaterialStateProperty.all(kElevatedButtonFGColor),
      textStyle: MaterialStateProperty.all(
        const TextStyle(
          color: kElevatedButtonFGColor,
          fontSize: 18,
          fontWeight: FontWeight.w500,
          // TODO add Poppins as the font family
        ),
      ),
    ),
  ),
  appBarTheme: const AppBarTheme(
      elevation: 0.5,
      foregroundColor: kAppBarTitleColor,
      centerTitle: true,
      backgroundColor: kPrimaryColor),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: kPrimaryColor,
      elevation: 10,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      unselectedItemColor: kSecondaryColor,
      selectedItemColor: kSecondaryColor),
);
