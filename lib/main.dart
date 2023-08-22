import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_compass/flutter_compass.dart';
import 'package:travelbuddy/Model/ala_travel_agency.dart';
import 'package:travelbuddy/Model/country_item.dart';
import 'package:travelbuddy/Screens/compass.dart';
import 'package:travelbuddy/Screens/country_maps.dart';
import 'package:travelbuddy/UIElement/country_text.dart';

import 'Model/aloha_agency.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Application name
      title: 'Flutter Hello World',
      // Application theme data, you can set the colors for the application as
      // you want
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // A widget which will be started on application startup
      home: TravelBuddy(),
    );
  }
}

class TravelBuddy extends StatefulWidget {
  @override
  _TravelBuddyState createState() => _TravelBuddyState();
}

class _TravelBuddyState extends State<TravelBuddy> {
  List<CountryItem> countries = [
    CountryItem.instance(
      "C1",
      "Macedonia",
      'https://www.mywanderlust.pl/wp-content/uploads/2023/01/places-to-visit-in-macedonia-41.jpg',
      20,
      42.0078963,
      21.4439222,
      AlohaAgency(),
    ),
    CountryItem.instance(
      "C2",
      "Greece",
      'https://media.timeout.com/images/105738421/image.jpg',
      25,
      37.9846505,
      23.7196776,
      AlaTravelAgency(),
    ),
    CountryItem.instance(
      "C3",
      "Turkey",
      'https://media.worldnomads.com/Explore/middle-east/hagia-sophia-church-istanbul-turkey-gettyimages-skaman306.jpg',
      30,
      41.0183364,
      28.9408752,
      AlaTravelAgency(),
    ),
    CountryItem.instance(
      "C4",
      "Italy",
      'https://d2rdhxfof4qmbb.cloudfront.net/wp-content/uploads/20180301194244/Rome-Tile.jpg',
      60,
      41.8965156,
      12.4725507,
      AlohaAgency(),
    ),
    CountryItem.instance(
      "C5",
      "Spain",
      'https://lp-cms-production.imgix.net/2019-06/8ae1c56041e64517e29372a889f1beb7-la-sagrada-familia.jpg?auto=format&fit=crop&ar=1:1&q=75&w=1200',
      55,
      41.3827023,
      2.1588913,
      AlaTravelAgency(),
    ),
    CountryItem.instance(
      "C6",
      "France",
      'https://lp-cms-production.imgix.net/2023-02/3cb45f6e59190e8213ce0a35394d0e11-nice.jpg?w=600&h=400',
      15,
      43.7105393,
      7.2558957,
      AlohaAgency(),
    ),
  ];

  Widget _createBody() {
    return Center(
      child: ListView.builder(
        itemCount: countries.length,
        itemBuilder: (ctx, index) {
          return Card(
            elevation: 3,
            margin: EdgeInsets.symmetric(
              vertical: 25,
              horizontal: 30,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.network(countries[index].image),
                CountryText(
                  countryName: countries[index].country,
                  peopleInterested: countries[index].peopleInterested,
                  priceForTravel: countries[index].price(),
                ),
                TextButton(
                  onPressed: () {
                    _displayGoogleMaps(
                      countries[index].lat,
                      countries[index].lon,
                      countries[index].country,
                    );
                  },
                  child: Text("Open In Maps:"),
                ),
                TextButton(
                  onPressed: () {
                    _displayGoogleMaps(
                      countries[index].lat,
                      countries[index].lon,
                      countries[index].country,
                    );
                  },
                  child: Icon(Icons.map),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  void _displayCompass() {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => MyCompass()),
    );
  }

  void _displayGoogleMaps(lat, lon, country) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => TravelBuddyMap(lat, lon, country)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.compass_calibration_outlined),
        onPressed: _displayCompass,
      ),
      appBar: AppBar(
        // The title text which will be shown on the action bar
        title: Text("Travel Buddy"),
      ),
      body: _createBody(),
    );
  }
}
