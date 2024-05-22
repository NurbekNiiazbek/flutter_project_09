import 'package:flutter_project_09/app/data/models/weather/weather_model.dart';
import 'package:flutter_project_09/app/data/repositories/weather_repository.dart';
import 'package:flutter_project_09/app/data/sources/api_source/api_sources.dart';

class BusinessLogic {
  final WeatherRepository _weatherRepository;

  BusinessLogic({
    required WeatherRepository weatherRepository,
  }) : _weatherRepository = weatherRepository;

  WeatherModel? weatherModel;
  String? chosenCity;
  Future<void> getWeatherByCity(String city) async {
    weatherModel = await _weatherRepository.getWeatherByCity(city);
  }

  Future<void> getWeatherByLocation() async {
    weatherModel = await _weatherRepository.getWeatherByLocation();
  }

  void typeCity(String city) {
    chosenCity = city;
  }
}

final BusinessLogic businessLogic = BusinessLogic(
  weatherRepository: WeatherRepository(
    apiSources: ApiSources(),
  ),
);
