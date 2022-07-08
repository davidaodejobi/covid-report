import 'package:covid_report/constant/appcolor.dart';
import 'package:covid_report/core/utils/theme.dart';
import 'package:covid_report/locator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'modules/Home/providers/home_provider.dart';
import 'modules/home.dart';

HomeProvider hp = getIt<HomeProvider>();

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
  setUp();
  hp.getAllCountriesCovidReport();
}

const Color colorSeed = AppColor.primary;
const bool material3 = true;

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<HomeProvider>(
            create: (_) => getIt<HomeProvider>()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Covid Report',
        theme: AppTheme.light(colorSeed, material3),
        home: const Home(),
      ),
    );
  }
}
