import 'package:flutter/material.dart';

class CountryText extends StatefulWidget {
  final String countryName;
  final int peopleInterested;
  final double priceForTravel;

  CountryText({
    required this.countryName,
    required this.peopleInterested,
    required this.priceForTravel,
  });

  @override
  _CountryTextState createState() => _CountryTextState();
}

class _CountryTextState extends State<CountryText> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(5.0),
      child: Column(
        children: [
          Text(
            widget.countryName,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "People also interested: ${widget.peopleInterested}",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w300,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "Price for travel: ${widget.priceForTravel}€",
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w300,
            ),
          ),
        ],
      ),
    );
  }
}
