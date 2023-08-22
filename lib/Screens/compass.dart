import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_compass/flutter_compass.dart';

class MyCompass extends StatefulWidget {
  @override
  _MyCompassState createState() => _MyCompassState();
}

class _MyCompassState extends State<MyCompass> {
  double? heading = 53;

  @override
  void initState() {
    super.initState();
    FlutterCompass.events!.listen((event) {
      setState(() {
        heading = event.heading;
      });
    });
  }

  Widget _createBody() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "${heading!.ceil()}°",
          style: TextStyle(
            color: Colors.white,
            fontSize: 26.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: 50.0,
        ),
        Padding(
          padding: EdgeInsets.all(18.0),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Image.asset("assets/cadrant.png"),
              Transform.rotate(
                angle: ((heading ?? 0) * (pi / 180) * (-1)),
                child: Image.asset(
                  "assets/compass.png",
                  scale: 1.1,
                ),
              )
            ],
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        // The title text which will be shown on the action bar
        title: Text("Travel Buddy - Compass"),
        backgroundColor: Colors.grey.shade700,
      ),
      body: _createBody(),
    );
  }
}
