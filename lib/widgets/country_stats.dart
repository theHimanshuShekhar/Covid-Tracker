import 'package:covid_tracker/widgets/world_stats.dart';
import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert' as convert;

class CountryStats extends StatefulWidget {
  final country;
  final index;
  CountryStats(this.country, this.index);

  @override
  _CountryStatsState createState() => _CountryStatsState(country, index);
}

class _CountryStatsState extends State<CountryStats> {
  var country;
  var index;
  var color;

  _CountryStatsState(this.country, this.index);

  @override
  void initState() {
    switchColor(index);
    super.initState();
  }

  void switchColor(index) {
    var color;
    if (index > 10) color = Colors.amber;
    if (index > 50) color = Colors.blue;
    if (index > 150) color = Colors.green;
    if (index <= 10) color = Colors.red;

    print(index);
    print(index > 10);
    print(index > 50);
    print(index > 150);
    print(color);

    setState(() {
      this.color = color;
    });
  }

  @override
  Widget build(BuildContext context) {
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
            padding: EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: color.withAlpha(80),
                  ),
                  child: Text(
                    '#${index + 1} Infected',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      color: color,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
                WorldStats(country, country['Country']),
              ],
            ),
          ),
        ));
  }
}
