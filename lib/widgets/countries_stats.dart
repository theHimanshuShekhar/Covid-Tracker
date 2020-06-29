import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CountryStats extends StatelessWidget {
  final countries;
  CountryStats(this.countries);

  List<dynamic> sortCountries(countryList) {
    for (var i = 0; i < countryList.length; i++)
      for (var j = i; j < countryList.length - i; j++) {
        if (countryList[i]['TotalConfirmed'] <
            countryList[j]['TotalConfirmed']) {
          var temp = countryList[i];
          countryList[i] = countryList[j];
          countryList[j] = temp;
        }
      }
    return countryList;
  }

  @override
  Widget build(BuildContext context) {
    sortCountries(countries);

    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0),
            child: Text(
              'Most Infected',
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w900,
                color: Colors.blueGrey[700],
              ),
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.3,
              padding: EdgeInsets.zero,
              child: ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: countries.length,
                itemBuilder: (BuildContext btx, int index) =>
                    CountryCard(country: countries[index]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CountryCard extends StatelessWidget {
  CountryCard({
    Key key,
    @required this.country,
  });

  final country;

  final numFormat = NumberFormat.compact(locale: 'en_US');

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: Colors.grey[200], borderRadius: BorderRadius.circular(20)),
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        margin: EdgeInsets.fromLTRB(0, 0, 0, 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              country['Country'],
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            SizedBox(height: 8),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Text(
                      numFormat.format(country['TotalConfirmed']),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.indigo,
                      ),
                    ),
                    Text(
                      'Infections',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.indigo,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      numFormat.format(country['TotalDeaths']),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.red,
                      ),
                    ),
                    Text(
                      'Deaths',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.red,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      numFormat.format(country['TotalRecovered']),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                    ),
                    Text(
                      'Recoveries',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      numFormat.format(
                          country['TotalConfirmed'] - country['TotalDeaths']),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.amber,
                      ),
                    ),
                    Text(
                      'Active',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.amber,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ));
  }
}
