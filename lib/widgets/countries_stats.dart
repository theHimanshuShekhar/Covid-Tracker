import 'package:flutter/material.dart';

class CountryStats extends StatelessWidget {
  final countries;
  CountryStats(this.countries);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
        ],
      ),
    );
  }
}
