import 'dart:io';

import 'package:countries/apis/country_api.dart';
import 'package:countries/models/countries_model.dart';
import 'package:countries/models/country_info_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CountryProvider with ChangeNotifier {
  List<CountriesModel> _countries =
      []; //initialize list which contains all the country

  List<CountriesModel> get countries =>
      _countries; //initialize list which contains all the country

  List<CountryInfo> europeCountryInfo =
      []; //initialize list which contains europe country
  List<CountryInfo> northAmericaCountryInfo =
      []; //initialize list which contains North American country
  List<CountryInfo> africaCountryInfo =
      []; ////initialize list which contains African country
  List<CountryInfo> oceaniaCountryInfo =
      []; //initialize list which contains oceania country
  List<CountryInfo> southAmericaCountryInfo =
      []; //initialize list which contains south american country
  List<CountryInfo> asiaCountryInfo =
      []; //initialize list which contains asian country

  Future<void> fetchCountries(BuildContext context) async {
    try {
      _countries = await getCountriesApi(context);

      // Clear existing data before populating
      europeCountryInfo.clear();
      northAmericaCountryInfo.clear();
      africaCountryInfo.clear();
      oceaniaCountryInfo.clear();
      southAmericaCountryInfo.clear();
      asiaCountryInfo.clear();

      // Populate the continent-specific lists
      for (var country in _countries) {
        CountryInfo countryInfo = CountryInfo(
          name: country.name!.common ?? "",
          capital: country.capital?.first ?? "",
          population: country.population ?? 0,
          region: country.region ?? "",
          subregion: country.subregion ?? "",
          flag: country.flags!.png ?? "",
          official: country.name!.official ?? "",
          continent: country.continents!.first,
        );

        //add countryInfo in list according to their region
        switch (country.region?.toLowerCase()) {
          case "europe":
            europeCountryInfo.add(countryInfo);
            break;
          case "americas":
            if (country.subregion?.toLowerCase() == "north america") {
              northAmericaCountryInfo.add(countryInfo);
            } else if (country.subregion?.toLowerCase() == "south america") {
              southAmericaCountryInfo.add(countryInfo);
            }
            break;
          case "africa":
            africaCountryInfo.add(countryInfo);
            break;
          case "oceania":
            oceaniaCountryInfo.add(countryInfo);
            break;
          case "asia":
            asiaCountryInfo.add(countryInfo);
            break;
          default:
            break;
        }
      }

      notifyListeners();
    } catch (error) {
      // Handle different types of errors
      if (error is SocketException) {
        // No internet connection
        print("No internet connection.");
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('No internet connection'),
          ),
        );
      } else {
        // Other types of errors
        print("Error fetching countries: $error");
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Error fetching countries"),
          ),
        );
      }
    }
  }
}
