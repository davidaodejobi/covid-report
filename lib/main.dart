import 'package:covid_report/constant/appcolor.dart';
import 'package:covid_report/core/utils/theme.dart';
import 'package:covid_report/locator.dart';
import 'package:flutter/material.dart';

import 'modules/home.dart';

void main() {
  runApp(const MyApp());
  setUp();
}

const Color colorSeed = AppColor.primary;
const bool material3 = true;

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Covid Report',
      theme: AppTheme.light(colorSeed, material3),
      home: const Home(),
    );
  }
}
