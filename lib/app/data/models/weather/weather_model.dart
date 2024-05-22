import 'package:flutter_project_09/app/data/models/weather/weather.dart';
import 'package:flutter_project_09/app/data/models/weather/weather_clouds.dart';
import 'package:flutter_project_09/app/data/models/weather/weather_cord.dart';
import 'package:flutter_project_09/app/data/models/weather/weather_main.dart';
import 'package:flutter_project_09/app/data/models/weather/weather_sys.dart';
import 'package:flutter_project_09/app/data/models/weather/weather_wind.dart';

class WeatherModel {
  final Coord coord;
  final List<Weather> weather;
  final String base;
  final WeatherMain main;
  final int visibility;
  final Wind wind;
  final Clouds clouds;
  final int dt;
  final WeatherSys sys;
  final int timezone;
  final int id;
  final String name;
  final int cod;

  WeatherModel({
    required this.coord,
    required this.weather,
    required this.base,
    required this.main,
    required this.visibility,
    required this.wind,
    required this.clouds,
    required this.dt,
    required this.sys,
    required this.timezone,
    required this.id,
    required this.name,
    required this.cod,
  });

  factory WeatherModel.fromMap(Map<String, dynamic> json) => WeatherModel(
        coord: Coord.fromMap(json["coord"]),
        weather:
            List<Weather>.from(json["weather"].map((x) => Weather.fromMap(x))),
        base: json["base"],
        main: WeatherMain.fromMap(json["main"]),
        visibility: json["visibility"],
        wind: Wind.fromMap(json["wind"]),
        clouds: Clouds.fromMap(json["clouds"]),
        dt: json["dt"],
        sys: WeatherSys.fromMap(json["sys"]),
        timezone: json["timezone"],
        id: json["id"],
        name: json["name"],
        cod: json["cod"],
      );

  Map<String, dynamic> toMap() => {
        "coord": coord.toMap(),
        "weather": List<dynamic>.from(weather.map((x) => x.toMap())),
        "base": base,
        "main": main.toMap(),
        "visibility": visibility,
        "wind": wind.toMap(),
        "clouds": clouds.toMap(),
        "dt": dt,
        "sys": sys.toMap(),
        "timezone": timezone,
        "id": id,
        "name": name,
        "cod": cod,
      };
}
