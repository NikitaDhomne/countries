import 'dart:convert';

import 'package:countries/models/countries_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<List<CountriesModel>> getCountriesApi(BuildContext context) async {
  var countries = <CountriesModel>[]; // List to hold country data
  var url = "https://restcountries.com/v3.1/all"; //Api endpoint

  var response = await http.get(Uri.parse(url)); //get request
  var data = jsonDecode(response.body.toString()); //json response decoding

  if (response.statusCode == 200) {
    // If response is successful (status code 200)
    for (var countryData in data) {
      countries.add(CountriesModel.fromJson(
          countryData)); // Parsing JSON data into CountriesModel objects
    }
  } else {
    // Handle other status codes if needed
    print("Error connecting to the server or invalid response.");
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Error connecting to the server or invalid response."),
      ),
    );
  }

  return countries; // Return the list of countries
}
