import 'dart:convert';

import 'package:animations/animations.dart';
import 'package:covid_report/core/models/countries.dart';
import 'package:covid_report/core/models/summary.dart';
import 'package:covid_report/core/services/base_api.dart';
import 'package:flutter/material.dart';

import '../../../core/models/global.dart';

class HomeProvider with ChangeNotifier {
  String selectedCountry = "Nigeria";

  List<String?> listOfCountries = <String>[];
  late Global globalData;
  List<Countries> countriesData = <Countries>[];
  late Countries selectedCountryData;

  Future<Summary> getAllCountriesCovidReport() async {
    final response = await connect('summary');
    final jsonResponse = json.decode(response.body);
    final data = Summary.fromJson(jsonResponse);

    globalData = data.global!;
    List<Countries> countries = <Countries>[];

    for (var country in data.countries!) {
      countries.add(country);
    }

    selectedCountryData =
        countries.firstWhere((element) => element.country == selectedCountry);

    print('selectedCountryData: ${selectedCountryData.country}');

    countriesData = countries;
    listOfCountries = countries.map((country) => country.country).toList();

    notifyListeners();
    return data;
  }

  onCountrySelect(String country) {
    selectedCountry = country;
    selectedCountryData =
        countriesData.firstWhere((element) => element.country == country);
    notifyListeners();
  }

  String withSuffix(int count) {
    if (count < 1000) return "$count";
    if (count < 1000000) return "${(count / 1000).toStringAsFixed(1)}k";
    if (count < 1000000000) return "${(count / 1000000).toStringAsFixed(1)}M";
    if (count < 1000000000000) {
      return "${(count / 1000000000).toStringAsFixed(1)}B";
    }
    return "${(count / 1000000000000).toStringAsFixed(1)}T";
  }

  //add coma to number
  String addComma(int count) {
    return count.toString().replaceAllMapped(
        RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},');
  }

  modal(BuildContext ctx) {
    String bullet = "\u2022 ";

    List symptoms = [
      ' Fever or chills',
      'Cough',
      'Shortness of breath or difficulty breathing',
      'Fatigue',
      'Muscle or body aches',
      'Headache',
    ];
    showModal(
      context: ctx,
      configuration: const FadeScaleTransitionConfiguration(),
      builder: (BuildContext context) {
        return AlertDialog(
          title: Center(
            child: Text(
              "Watch for Symptoms",
              style: Theme.of(context).textTheme.headline4,
            ),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Phasellus ullamcorper ipsum rutrum nunc. Morbi vestibulum volutpat enim. Quisque libero metus, condimentum nec, tempor a, commodo mollis, magna. Phasellus blandit leo ut odio. Donec vitae orci sed dolor rutrum auctor. Aliquam lobortis. Cras dapibus. Quisque rutrum.",
                style: Theme.of(context).textTheme.bodyText1,
              ),
              ...symptoms
                  .map((e) => Text(
                        "$bullet $e",
                        style: Theme.of(context).textTheme.bodyText1,
                      ))
                  .toList(),
            ],
          ),
        );
      },
    );
  }
  // loadCountry() async {
  //   String data = await rootBundle.loadString('assets/json/countries.json');
  //   countries = List<String>.from(jsonDecode(data));
  //   notifyListeners();
  // }
}
