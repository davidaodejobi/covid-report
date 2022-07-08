import 'package:covid_report/constant/appcolor.dart';
import 'package:flutter/material.dart';

@immutable
class MyColors extends ThemeExtension<MyColors> {
  const MyColors({
    required this.colour,
  });

  final Color? colour;

  @override
  MyColors copyWith({
    Color? colour,
  }) {
    return MyColors(
      colour: colour ?? this.colour,
    );
  }

  @override
  MyColors lerp(ThemeExtension<MyColors>? other, double t) {
    if (other is! MyColors) {
      return this;
    }
    return MyColors(
      colour: Color.lerp(colour, other.colour, t),
    );
  }

  // Optional
  @override
  String toString() => 'MyColors(brandColor: $colour)';
}

class AppTheme with ChangeNotifier {
  static ThemeData light(Color color, bool material3) {
    return ThemeData.light().copyWith(
      primaryColor: material3 ? color : null,
      useMaterial3: material3,
      iconTheme: const IconThemeData(
        color: AppColor.secondary,
      ),
      scaffoldBackgroundColor: Colors.white,
      cardTheme: const CardTheme(
        color: Colors.white,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          primary: AppColor.primary, // background (button) color
          onPrimary: Colors.white, // foreground (text) color
          elevation: 5, // shadow elevation
          shadowColor: AppColor.primary.withOpacity(0.5), // shadow color
        ),
      ),
      textTheme: const TextTheme(
        headline1: TextStyle(
          fontSize: 80.0,
          color: AppColor.secondary,
          fontWeight: FontWeight.normal,
        ),
        headline2: TextStyle(
          fontSize: 50.0,
          color: AppColor.secondary,
          fontWeight: FontWeight.normal,
        ),
        headline3: TextStyle(
          fontSize: 38.0,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
        headline4: TextStyle(
          fontSize: 22.0,
          color: AppColor.secondary,
          fontWeight: FontWeight.normal,
        ),
        headline5: TextStyle(
          fontSize: 16.0,
          color: Colors.white,
          fontWeight: FontWeight.w100,
        ),
        headline6: TextStyle(
          fontSize: 12.0,
          color: AppColor.secondary,
          fontWeight: FontWeight.bold,
        ),
        bodyText1: TextStyle(
          fontSize: 15.0,
          color: AppColor.tertiary,
          fontWeight: FontWeight.w400,
        ),
        bodyText2: TextStyle(
          fontSize: 12.0,
          color: AppColor.secondary,
          fontWeight: FontWeight.w400,
        ),
        subtitle1: TextStyle(
          fontSize: 14.0,
          color: AppColor.secondary,
          fontWeight: FontWeight.w300,
        ),
        caption: TextStyle(
          fontSize: 12.0,
          color: AppColor.secondary,
          fontWeight: FontWeight.w400,
        ),
        overline: TextStyle(
          fontSize: 12.0,
          color: AppColor.secondary,
          fontWeight: FontWeight.w400,
        ),
      ),
      colorScheme: material3 ? ColorScheme.fromSeed(seedColor: color) : null,
      extensions: <ThemeExtension<dynamic>>[
        const MyColors(
          colour: AppColor.primary,
        ),
      ],
    );
  }
}
