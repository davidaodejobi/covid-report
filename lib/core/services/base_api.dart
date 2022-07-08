import 'dart:developer';

import 'package:http/http.dart' as http;

String baseUrl = 'https://api.covid19api.com';

connect(String endpoint) async {
  var url = Uri.parse('$baseUrl/$endpoint');

  final response = await http.get(
    url,
  );

  log('response status code: ${response.statusCode}');
  return response;
}
