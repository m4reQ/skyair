import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:skyair/components/data_display.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class StationInfo {
  final String code;
  final int id;
  final double latitude;
  final double longitude;

  const StationInfo({
    required this.code,
    required this.id,
    required this.latitude,
    required this.longitude,
  });

  factory StationInfo.fromJson(Map<String, dynamic> json) => StationInfo(
    code: json['Kod stacji'],
    id: json['Nr'],
    latitude: json['WGS84 φ N'],
    longitude: json['WGS84 λ E'],
  );
}

class LiveDataView extends StatelessWidget {
  static const defaultCityName = "Warszawa";

  const LiveDataView({super.key});

  Future<String> _getCurrentCityName() async {
    var locationPermission = await Geolocator.checkPermission();
    if (locationPermission == .denied) {
      locationPermission = await Geolocator.requestPermission();
    }

    if (locationPermission == .denied || locationPermission == .deniedForever) {
      return defaultCityName;
    }

    final position = await Geolocator.getCurrentPosition();

    await setLocaleIdentifier('pl_PL');
    final placemarks = await placemarkFromCoordinates(
      position.latitude,
      position.longitude,
    );
    return placemarks.isNotEmpty
        ? placemarks.first.locality ?? defaultCityName
        : defaultCityName;
  }

  Future<List<StationInfo>> _getCityStationsList(String cityName) async {
    // TODO Load rest of response pages
    // TODO Extract base URL to constant
    // TODO Extract whole logic to separate service

    final response = await http.get(
      Uri.https('api.gios.gov.pl', '/pjp-api/v1/rest/metadata/stations', {
        'filter[miejscowosc]': cityName,
      }),
    );
    if (response.statusCode != 200) {
      return [];
    }

    final data = convert.jsonDecode(response.body) as List<dynamic>;
    return data.map((x) => StationInfo.fromJson(x)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset('assets/logo.svg'),
            Text(
              'Your daily air',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            Text('quality', style: Theme.of(context).textTheme.titleLarge),
          ],
        ),
        Expanded(
          child: Container(
            width: double.infinity,
            margin: EdgeInsets.only(top: 40.0),
            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 50.0),
            decoration: BoxDecoration(
              color: Color(0xA6FFFFFF),
              borderRadius: BorderRadius.circular(25.0),
            ),
            child: Center(
              child: FutureBuilder(
                future: _getCurrentCityName(),
                builder: (context, asyncSnapshot) {
                  return DataDisplay(
                    data: AirQualityData(
                      pm10Concentration: 30.0,
                      pm25Concentration: 12.0,
                      so2Concentration: 23.0,
                      noXConcentration: 11.0,
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}
