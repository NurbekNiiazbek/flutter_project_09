import 'dart:convert';
import 'dart:developer';

import 'package:flutter_project_09/city_view.dart';
import 'package:flutter_project_09/constants.dart';
import 'package:flutter_project_09/weather_model.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  /// Null safety,
  /// non nullable
  /// String temperature = '';
  /// String description = '';
  /// nullable
  WeatherModel? weatherModel;

  @override
  void initState() {
    getWeatherByLocation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: const AssetImage('assets/location_background.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.white.withOpacity(0.9),
              BlendMode.dstATop,
            ),
          ),
        ),
        constraints: const BoxConstraints.expand(),
        child: SafeArea(
          child: weatherModel == null
              ? const Center(
                  child: CircularProgressIndicator(
                  color: Colors.white,
                ))
              : Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        TextButton(
                          onPressed: () {},
                          child: const Icon(
                            Icons.near_me,
                            size: 50.0,
                            color: Colors.white,
                          ),
                        ),
                        TextButton(
                          onPressed: () async {
                            String? cityName =
                                await Navigator.push(context, MaterialPageRoute(
                              builder: (context) {
                                return const CityView();
                              },
                            ));

                            if (cityName != null) {
                              await getWeatherByCity(cityName);
                            }
                          },
                          child: const Icon(
                            Icons.location_city,
                            size: 50.0,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0),
                      child: Row(
                        children: <Widget>[
                          Text(
                            '${weatherModel!.main.temp.toStringAsFixed(2)}°',
                            style: kTempTextStyle,
                          ),
                          const Text(
                            '☀️',
                            style: kConditionTextStyle,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 15.0),
                      child: Text(
                        weatherModel!.weather.first.description,
                        textAlign: TextAlign.right,
                        style: kMessageTextStyle,
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }

  Future<void> getWeatherByCity(String cityName) async {
    http.Client client = http.Client();

    /// https://api.openweathermap.org/data/2.5/weather?q={city name}&appid={API key}

    String url = '$apiUrl?q=$cityName&appid=$apiKey&units=metric';

    Uri uri = Uri.parse(url);

    http.Response response = await client.get(uri);

    if (response.statusCode == 200) {
      String responseBody = response.body;

      Map<String, dynamic> result = jsonDecode(responseBody);

      weatherModel = WeatherModel.fromMap(result);

      log('weatherModel..main.temp ${weatherModel?.main.temp}');

      setState(() {});

      // log('responseBody: $responseBody');
    }
  }

  Future<void> getWeatherByLocation() async {
    Position position = await _determinePosition();

    http.Client client = http.Client();

    /// https://api.openweathermap.org/data/2.5/weather?lat={lat}&lon={lon}&appid={API key}
    String url =
        '$apiUrl?lat=${position.latitude}&lon=${position.longitude}&appid=$apiKey&units=metric';

    Uri uri = Uri.parse(url);

    http.Response response = await client.get(uri);

    // log('response: ${response.body}');

    if (response.statusCode == 200) {
      Map<String, dynamic> result = jsonDecode(response.body);

      weatherModel = WeatherModel.fromMap(result);

      log('weatherModel..main.temp ${weatherModel?.main.temp}');

      setState(() {});
    }

    ///
  }

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
        'Location permissions are permanently denied, we cannot request permissions.',
      );
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    final result = await Geolocator.getCurrentPosition();

    log('result: ${result.latitude} and ${result.longitude}');

    return result;
  }

  // double kelvinToCelsius(double kelvin) {
  //   return (kelvin - 273.15);
  // }
  // kiska jolu
  double kelvinToCelsius(num kelvin) => kelvin - 273.15;
}
