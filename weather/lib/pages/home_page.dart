import 'dart:developer';

import 'dart:convert' as convert;

// import 'dart:math';
// import 'dart:math';
// import 'dart:developer';
// import 'dart:math';
// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:weather/constants.dart';
import 'package:weather/pages/citi_page.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import '../constants.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, String title}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _celcius = '12';
  String _citiName = '';
  String _description = "Kuba jyluu kiyin, jamgyr jaait";

  _showWeatherByLocation() async {
    final position = await _getCurrentLocation();
    await getWeatherBylocation(position: position);

    // log('position latitude ===>> ${position.latitude}');
    // log('position longitude ===>> ${position.longitude}');
  }

  Future<Position> _getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    return await Geolocator.getCurrentPosition();
  }

  getWeatherBylocation({@required Position position}) async {
    var client = http.Client();
    try {
      Uri _uri = Uri.parse(
          'https://api.openweathermap.org/data/2.5/weather?lat=${position.latitude}&lon=${position.longitude}&appid=$openWeatherMapApiKey');
      final response = await client.get(_uri);
      if (response.statusCode == 200 || response.statusCode == 201) {
        final body = response.body;

        final _data = convert.jsonDecode(body) as Map<String, dynamic>;
        // log('_data ==>> $_data');
        // _celcius = _data['main']['temp'];
        final cityName = _data['name'];
        _citiName = cityName;
        log('Shardyn aty ===> $cityName');
        final temp = _data['main']['temp'];
        log('Temp ==>>> $temp');
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size.height * 0.1;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.navigation),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: IconButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => CityPage(), // ekinchi betti chakyruu
                  ),
                );
              },
              icon: const Icon(
                Icons.location_city,
                size: 30.0,
              ),
            ),
          ),
        ],
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/Bacground.jpeg'), // surot coshuu
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 35.0),
              child: Text(
                '$_celcius\u00b0 💧 ',
                style: TextStyle(
                    fontSize: 100.0,
                    color: Colors.red,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: _size), // buildka kettii
            Padding(
              padding: const EdgeInsets.only(right: 30.0),
              child: Text(
                'Bishkek ',
                style: TextStyle(
                    fontSize: 100.0,
                    color: Colors.red,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: _size), // buildka kettii

            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
              child: Text(
                '🔊$_description',
                style: TextStyle(
                    fontSize: 40.0,
                    color: Color.fromARGB(255, 7, 7, 215),
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
