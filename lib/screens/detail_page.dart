import 'package:countries/models/country_info_model.dart';
import 'package:flutter/material.dart';

class CountryDetailPage extends StatelessWidget {
  final CountryInfo country;
  const CountryDetailPage({Key? key, required this.country}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(country.name),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Table(
            columnWidths: {
              0: FlexColumnWidth(
                  1), //0th index with column width 1    //for title
              1: FlexColumnWidth(
                  2), //1st index with column width 2    //for title value
            },
            children: [
              _buildTableRow("Common Name", country.name),
              _buildTableRow("Official Name", country.official),
              _buildImageRow("Flag", country.flag),
              _buildTableRow("Capital", country.capital),
              _buildTableRow("Population", country.population.toString()),
              _buildTableRow("Region", country.region),
              _buildTableRow("Sub-Region", country.subregion),
              _buildTableRow("Continent", country.continent)
            ],
          ),
        ),
      ),
    );
  }

//widget for both tablecell contains text
  TableRow _buildTableRow(String title, String value) {
    return TableRow(
      children: [
        TableCell(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 8),
            child: Text(
              title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.deepOrange,
              ),
            ),
          ),
        ),
        TableCell(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 8),
            child: Text(
              value,
              softWrap: true,
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
          ),
        ),
      ],
    );
  }

  //widget for one tablecell contains image
  TableRow _buildImageRow(String title, String imageUrl) {
    return TableRow(
      children: [
        TableCell(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 8),
            child: Text(
              title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.deepOrange,
              ),
            ),
          ),
        ),
        TableCell(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 8),
            child: Container(
              height: 100,
              width: 150,
              child: Image.network(imageUrl),
            ),
          ),
        ),
      ],
    );
  }
}
