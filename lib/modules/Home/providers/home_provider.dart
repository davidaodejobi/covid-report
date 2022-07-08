import 'dart:convert';

import 'package:covid_report/core/models/countries.dart';
import 'package:covid_report/core/models/summary.dart';
import 'package:covid_report/core/services/base_api.dart';
import 'package:flutter/material.dart';

class HomeProvider with ChangeNotifier {
  String selectedCountry = "Nigeria";

  List<String?> listOfCountries = <String>[];

  getAllCountriesCovidReport() async {
    final response = await connect('summary');
    final jsonResponse = json.decode(response.body);
    final data = Summary.fromJson(jsonResponse);

    List<Countries> countries = <Countries>[];

    for (var country in data.countries!) {
      countries.add(country);
    }

    listOfCountries = countries.map((country) => country.country).toList();

    notifyListeners();
  }

  onCountrySelect(String country) {
    selectedCountry = country;
    notifyListeners();
  }

  // loadCountry() async {
  //   String data = await rootBundle.loadString('assets/json/countries.json');
  //   countries = List<String>.from(jsonDecode(data));
  //   notifyListeners();
  // }
}
