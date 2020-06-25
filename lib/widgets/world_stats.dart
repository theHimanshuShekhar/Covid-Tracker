import 'package:flutter/material.dart';

class WorldStats extends StatelessWidget {
  final globalStats;

  WorldStats(this.globalStats);

  @override
  Widget build(BuildContext context) {
    print(this.globalStats);
    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            'World Update',
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w900,
              color: Colors.blueGrey[700],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              StatCard(
                  count: this.globalStats['TotalConfirmed'],
                  text: 'Infections'),
              StatCard(count: this.globalStats['TotalDeaths'], text: 'Deaths'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              StatCard(
                  count: this.globalStats['TotalRecovered'],
                  text: 'Recoveries'),
              StatCard(
                  count: this.globalStats['TotalConfirmed'] -
                      this.globalStats['TotalRecovered'],
                  text: 'Critical'),
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

  StatCard({this.text, this.count, this.newCount});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.green,
        borderRadius: BorderRadius.circular(20),
      ),
      margin: EdgeInsets.symmetric(vertical: 8),
      width: MediaQuery.of(context).size.width * 0.43,
      height: 150,
      child: Column(
        children: <Widget>[
          Text('${this.text} ${this.count}'),
        ],
      ),
    );
  }
}
