import 'package:countries/models/country_info_model.dart';
import 'package:countries/screens/detail_page.dart';
import 'package:flutter/material.dart';

class SearchResultPage extends StatelessWidget {
  final List<CountryInfo> foundCountries;
  String query;

  SearchResultPage(
      {super.key, required this.foundCountries, required this.query});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(query), // Set the app bar title to the search query
      ),
      body: ListView.builder(
        itemCount: foundCountries.length,
        itemBuilder: (context, index) {
          final country = foundCountries[index];
          return Card(
            child: ListTile(
              leading: Image.network(
                country.flag, // Display country flag
                width: 50,
                height: 50,
              ),
              title: Text(country.name), //display country name
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Capital: ${country.capital}"), //display capital
                  Text(
                      "Population: ${country.population}"), //display population
                ],
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CountryDetailPage(
                        country: country), //Navigate to detail screen
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
