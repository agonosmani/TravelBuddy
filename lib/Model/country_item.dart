import 'package:travelbuddy/Model/aloha_agency.dart';

import 'agency.dart';

class CountryItem {
  final String id;
  final String country;
  final String image;
  final int peopleInterested;
  final double lat;
  final double lon;
  // decorator # Design Pattern #3
  final Agency agency;
  final double countryTax;

  CountryItem({
    required this.id,
    required this.country,
    required this.image,
    required this.peopleInterested,
    required this.lat,
    required this.lon,
    required this.agency,
    required this.countryTax,
  });

  // singleton # Design Pattern #2
  static CountryItem instance(
      id1, country1, image1, peopleInterested1, lat1, lon1, agency1) {
    return CountryItem(
      id: id1,
      country: country1,
      image: image1,
      peopleInterested: peopleInterested1,
      lat: lat1,
      lon: lon1,
      agency: agency1,
      countryTax: 10.0,
    );
  }

  double price() {
    return this.countryTax + this.agency.cost();
  }
}
