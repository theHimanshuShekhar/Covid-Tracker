import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoTextField(
      placeholder: 'Search Country',
      textAlign: TextAlign.center,
      decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.all(Radius.circular(10))),
      style: TextStyle(
        fontWeight: FontWeight.bold,
        color: Colors.blueGrey,
      ),
      placeholderStyle: TextStyle(
        fontWeight: FontWeight.bold,
        color: Colors.grey,
      ),
      prefix: Padding(
        padding: const EdgeInsets.only(left: 10, top: 10, bottom: 10),
        child: Icon(
          Icons.search,
          color: Colors.blueGrey,
        ),
      ),
    );
  }
}
