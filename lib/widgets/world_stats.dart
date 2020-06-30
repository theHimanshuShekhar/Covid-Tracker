import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class WorldStats extends StatelessWidget {
  final globalStats;
  final header;

  WorldStats(this.globalStats, this.header);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0),
            child: Text(
              header,
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w900,
                color: Colors.blueGrey[700],
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              StatCard(
                count: this.globalStats['TotalConfirmed'],
                text: 'Infections',
                newCount: this.globalStats['NewConfirmed'],
                color: Colors.indigo,
              ),
              StatCard(
                count: this.globalStats['TotalDeaths'],
                text: 'Deaths',
                newCount: this.globalStats['NewDeaths'],
                color: Colors.red,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              StatCard(
                  count: this.globalStats['TotalRecovered'],
                  newCount: this.globalStats['NewRecovered'],
                  color: Colors.green,
                  text: 'Recoveries'),
              StatCard(
                  newCount: this.globalStats['NewConfirmed'] -
                      this.globalStats['NewRecovered'],
                  count: this.globalStats['TotalConfirmed'] -
                      this.globalStats['TotalRecovered'] -
                      this.globalStats['TotalDeaths'],
                  color: Colors.amber,
                  text: 'Active'),
            ],
          )
        ],
      ),
    );
  }
}

class StatCard extends StatelessWidget {
  final text;
  final count;
  final newCount;
  final Color color;
  final nFormat = NumberFormat();

  StatCard({this.text, this.count, this.newCount, this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color.withAlpha(50),
        borderRadius: BorderRadius.circular(20),
      ),
      margin: EdgeInsets.symmetric(vertical: 8),
      width: MediaQuery.of(context).size.width * 0.43,
      height: 150,
      padding: EdgeInsets.all(15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: color.withAlpha(50),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              '+' + nFormat.format(newCount),
              style: TextStyle(
                color: Colors.blueGrey[900],
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            nFormat.format(count),
            style: TextStyle(
              color: color,
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
          Text(
            '${this.text}'.toUpperCase(),
            style: TextStyle(
              color: Colors.blueGrey[700],
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
