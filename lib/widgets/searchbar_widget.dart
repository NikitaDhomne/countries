import 'package:countries/models/country_info_model.dart';
import 'package:countries/provider/country_provider.dart';
import 'package:countries/screens/search_screen.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchBarWidget extends StatefulWidget {
  SearchBarWidget({super.key});

  @override
  State<SearchBarWidget> createState() => _SearchBarWidgetState();
}

class _SearchBarWidgetState extends State<SearchBarWidget> {
  TextEditingController _searchController = TextEditingController();
  late List<CountryInfo> foundCountries = [];

  @override
  Widget build(BuildContext context) {
    CountryProvider countryProvider = Provider.of<CountryProvider>(context);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
          color: Colors.black12,
          border: Border.all(color: Color.fromARGB(95, 147, 147, 147)),
          borderRadius: BorderRadius.circular(25)),
      child: Row(
        children: [
          Container(
            height: 20,
            width: 20,
            child: Image.asset(
              "images/earth.gif",
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: "Search Gif",
                errorBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                focusedErrorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                border: InputBorder.none,
              ),
              onSubmitted: (value) {
                print(_searchController.text);
                var found = countryProvider.countries
                    .where(
                      (country) => country.name!.common!
                          .toLowerCase()
                          .contains(_searchController.text.toLowerCase()),
                    )
                    .map((country) => CountryInfo(
                          name: country.name!.common!,
                          capital: country.capital!.first,
                          population: country.population ?? 0,
                          region: country.region ?? "",
                          subregion: country.subregion ?? "",
                          flag: country.flags!.png ?? "",
                          continent: country.continents!.first,
                          official: country.name!.official ?? "",
                        ))
                    .toList(); // Convert the iterable to a list
                setState(() {
                  foundCountries = found;
                });
                if (found.isNotEmpty) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SearchResultPage(
                        foundCountries: foundCountries,
                        query: _searchController.text,
                      ),
                    ),
                  );
                } else {
                  print('Country not found!');
                }
              },
            ),
          ),
          InkWell(
              onTap: () {
                print(_searchController.text);
                var found = countryProvider.countries
                    .where(
                      (country) => country.name!.common!
                          .toLowerCase()
                          .contains(_searchController.text.toLowerCase()),
                    )
                    .map((country) => CountryInfo(
                          name: country.name!.common!,
                          capital: country.capital!.first,
                          population: country.population ?? 0,
                          region: country.region ?? "",
                          subregion: country.subregion ?? "",
                          flag: country.flags!.png ?? "",
                          continent: country.continents!.first,
                          official: country.name!.official ?? "",
                        ))
                    .toList(); // Convert the iterable to a list
                setState(() {
                  foundCountries = found;
                });
                if (found.isNotEmpty) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SearchResultPage(
                        foundCountries: foundCountries,
                        query: _searchController.text,
                      ),
                    ),
                  );
                } else {
                  print('Country not found!');
                }
              },
              child: Icon(Icons.search))
        ],
      ),
    );
  }
}
