import 'package:flutter_project_09/app/presentation/flutter_way/business_logic/business_logic.dart';
import 'package:flutter_project_09/app/presentation/flutter_way/view/screens/city_screen.dart';
import 'package:flutter_project_09/common/contants/text_styles/app_text_styles.dart';

import 'package:flutter/material.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
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
          child: businessLogic.weatherModel == null
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
                            bool? returnedToScreen =
                                await Navigator.push(context, MaterialPageRoute(
                              builder: (context) {
                                return const CityScreen();
                              },
                            ));

                            if (returnedToScreen != null && returnedToScreen) {
                              await getWeatherByCity(businessLogic.chosenCity!);
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
                            '${businessLogic.weatherModel!.main.temp.toStringAsFixed(2)}°',
                            style: AppTextStyles.kTempTextStyle,
                          ),
                          const Text(
                            '☀️',
                            style: AppTextStyles.kConditionTextStyle,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 15.0),
                      child: Text(
                        businessLogic.weatherModel!.weather.first.description,
                        textAlign: TextAlign.right,
                        style: AppTextStyles.kMessageTextStyle,
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }

  Future<void> getWeatherByCity(String city) async {
    await businessLogic.getWeatherByCity(city);

    setState(() {});
  }

  Future<void> getWeatherByLocation() async {
    await businessLogic.getWeatherByLocation();

    setState(() {});
  }
}
