import 'package:flutter_project_09/app/data/models/weather/weather_model.dart';
import 'package:flutter_project_09/core/utils/geolocation/geolocation_services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter_project_09/app/data/sources/api_source/api_sources.dart';

class WeatherRepository {
  final ApiSources _apiSources;

  WeatherRepository({required ApiSources apiSources})
      : _apiSources = apiSources;

  Future<WeatherModel> getWeatherByCity(String cityName) async {
    return await _apiSources.getWeatherByCity(cityName);
  }

  Future<WeatherModel> getWeatherByLocation() async {
    Position position = await GeolocationServices.getCurrentPosition();
    return await _apiSources.getWeatherByLocation(position);
  }
}
