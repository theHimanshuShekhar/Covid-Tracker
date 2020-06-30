import 'package:covid_tracker/widgets/world_stats.dart';
import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert' as convert;

class CountryStats extends StatefulWidget {
  final country;
  CountryStats(this.country);

  @override
  _CountryStatsState createState() => _CountryStatsState(country);
}

class _CountryStatsState extends State<CountryStats> {
  var country;
  _CountryStatsState(this.country);

  @override
  Widget build(BuildContext context) {
    print(country);
    return Scaffold(
        bottomNavigationBar: BottomAppBar(
          elevation: 0,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              icon: Icon(
                Icons.arrow_back,
                size: 30,
                color: Colors.black,
              ),
              onPressed: () => Navigator.pop(context),
            ),
          ),
        ),
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Container(
            padding: EdgeInsets.all(20.0),
            child: Column(
              children: [
                WorldStats(country, country['Country']),
              ],
            ),
          ),
        ));
  }
}
