import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class TravelBuddyMap extends StatefulWidget {
  final double lat;
  final double lon;
  final String country;

  TravelBuddyMap(this.lat, this.lon, this.country);

  @override
  _TravelBuddyMapState createState() => _TravelBuddyMapState();
}

class _TravelBuddyMapState extends State<TravelBuddyMap> {
  late GoogleMapController mapController;

  // dependency injection - Design Pattern #1
  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    double lat1 = widget.lat;
    double lon1 = widget.lon;

    return Scaffold(
      appBar: AppBar(
        // The title text which will be shown on the action bar
        title: Text("Maps For ${widget.country}"),
      ),
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(
          target: LatLng(lat1, lon1),
          zoom: 11.0,
        ),
      ),
    );
  }
}
