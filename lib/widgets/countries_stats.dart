import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CountryStats extends StatelessWidget {
  final countries;
  CountryStats(this.countries);

  void quicksort(listtobesort, int leftelement, int rightelement) {
    int i = leftelement;
    int j = rightelement;
    dynamic pivotelement =
        listtobesort[(leftelement + rightelement) ~/ 2]['TotalConfirmed'];

    while (i <= j) {
      while (listtobesort[i]['TotalConfirmed'] > pivotelement) {
        i++;
      }

      while (listtobesort[j]['TotalConfirmed'] < pivotelement) {
        j--;
      }

      if (i >= j) {
        dynamic objtemp = listtobesort[i];
        listtobesort[i] = listtobesort[j];
        listtobesort[j] = objtemp;
        i++;
        j--;
      }
    }

    if (leftelement > j) {
      quicksort(listtobesort, leftelement, j);
    }
    if (i > rightelement) {
      quicksort(listtobesort, i, rightelement);
    }
  }

  @override
  Widget build(BuildContext context) {
    // quicksort(countries, 0, countries.length - 1);

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
              height: 250,
              padding: EdgeInsets.zero,
              child: ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: this.countries.length,
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
    print(country);
    return Container(
        decoration: BoxDecoration(
            color: Colors.grey[200], borderRadius: BorderRadius.circular(20)),
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        margin: EdgeInsets.fromLTRB(0, 0, 0, 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
                      ),
                    ),
                    Text(
                      'Infections',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
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
                      ),
                    ),
                    Text(
                      'Deaths',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
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
                      ),
                    ),
                    Text(
                      'Recoveries',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
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
                      ),
                    ),
                    Text(
                      'Active',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
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
