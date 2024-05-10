import 'package:countries/models/country_info_model.dart';
import 'package:countries/provider/country_provider.dart';
import 'package:countries/screens/detail_page.dart';
import 'package:countries/widgets/searchbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool loader = false; // Variable to control whether to show the loader or not

  @override
  void initState() {
    super.initState();
    loader = true; // Show loader when initializing
    Provider.of<CountryProvider>(context, listen: false)
        .fetchCountries(context)
        .then((_) {
      setState(() {
        loader = false; // Hide loader after data is fetched
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return loader
        ?
        //if loader == true
        Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          )
        :
        //loader == false
        Scaffold(
            appBar: AppBar(
              title: Text("Countries"),
            ),
            body: Consumer<CountryProvider>(
              builder: (context, countryProvider, _) {
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      _buildSizedBox(),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: SearchBarWidget(),
                      ),
                      SizedBox(height: 20),
                      Text(
                        'Continents',
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                          color: Colors.deepOrange,
                          decoration: TextDecoration.underline,
                          decorationColor: Colors.deepOrange,
                        ),
                      ),
                      SizedBox(height: 20),
                      _buildExpansionTile(
                          "Europe", countryProvider.europeCountryInfo),
                      _buildSizedBox(),
                      _buildExpansionTile(
                          "Africa", countryProvider.africaCountryInfo),
                      _buildSizedBox(),
                      _buildExpansionTile(
                          "Oceania", countryProvider.oceaniaCountryInfo),
                      _buildSizedBox(),
                      _buildAmericaExpansionTile(countryProvider),
                      _buildSizedBox(),
                      _buildExpansionTile(
                          "Asia", countryProvider.asiaCountryInfo),
                    ],
                  ),
                );
              },
            ),
          );
  }

  // Widget to build the ExpansionTile for America i.e. inherited ExpansionTile
  Widget _buildAmericaExpansionTile(CountryProvider countryProvider) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10), // border radius
        color: Colors.black12, // Add background color
        border: Border.all(color: Color.fromARGB(95, 147, 147, 147)),
      ),
      child: ExpansionTile(
        title: Text(
          'America',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.indigoAccent,
            decoration: TextDecoration.underline,
            decorationColor: Colors.indigoAccent,
          ),
        ),
        children: [
          Padding(
            padding: EdgeInsets.only(left: 10),
            child:
                //child widget of america
                _buildExpansionTile(
                    "North America", countryProvider.northAmericaCountryInfo),
          ),
          _buildSizedBox(),
          Padding(
            padding: EdgeInsets.only(left: 10),
            child:
                //child widget of america
                _buildExpansionTile(
                    "South America", countryProvider.southAmericaCountryInfo),
          ),
        ],
      ),
    );
  }

  // Widget to build the ExpansionTile
  Widget _buildExpansionTile(String title, List<CountryInfo> countryList) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10), // border radius
        color: Colors.black12, // Add background color
        border: Border.all(color: Color.fromARGB(95, 147, 147, 147)),
      ),
      child: ExpansionTile(
        title: Text(
          title,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.indigoAccent,
            decoration: TextDecoration.underline,
            decorationColor: Colors.indigoAccent,
          ),
        ),
        children: countryList
            .map(
              (country) => Card(
                color: Colors.white,
                child: ListTile(
                  onTap: () {
                    //Navigate to DetailPage
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            CountryDetailPage(country: country),
                      ),
                    );
                  },
                  leading: Container(
                    height: 40,
                    width: 50,
                    child: Image.network(country.flag), //display flag image
                  ),
                  title: Text(
                    country.name, // display name of country
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.red,
                    ),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                          "Capital: ${country.capital}"), //display capital of country
                      Text(
                          "Population: ${country.population}"), // display population of country
                    ],
                  ),
                ),
              ),
            )
            .toList(),
      ),
    );
  }

  Widget _buildSizedBox() {
    return SizedBox(height: 10);
  }
}
