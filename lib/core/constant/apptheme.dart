import 'package:ecommerce_application/core/constant/color.dart';
import 'package:flutter/material.dart';

ThemeData englishTheme = ThemeData(
  fontFamily: "PlayfairDisplay",
  textTheme: const TextTheme(
    headlineLarge: TextStyle(
      color: ColorApp.black,
      fontWeight: FontWeight.bold,
      fontSize: 20,
    ),
    bodyLarge: TextStyle(
        color: ColorApp.grey, fontSize: 15, fontWeight: FontWeight.bold),
  ),
  colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
  useMaterial3: true,
);
ThemeData arabicTheme = ThemeData(
  fontFamily: "Cairo",
  textTheme: const TextTheme(
    headlineLarge: TextStyle(
      color: ColorApp.black,
      fontWeight: FontWeight.bold,
      fontSize: 20,
    ),
    bodyLarge: TextStyle(
        color: ColorApp.grey, fontSize: 15, fontWeight: FontWeight.bold),
  ),
  colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
  useMaterial3: true,
);
