class WeatherSys {
  final int type;
  final int id;
  final double? message;
  final String country;
  final int sunrise;
  final int sunset;

  WeatherSys({
    required this.type,
    required this.id,
    required this.message,
    required this.country,
    required this.sunrise,
    required this.sunset,
  });

  factory WeatherSys.fromMap(Map<String, dynamic> json) => WeatherSys(
        type: json["type"],
        id: json["id"],
        message: json["message"]?.toDouble(),
        country: json["country"],
        sunrise: json["sunrise"],
        sunset: json["sunset"],
      );

  Map<String, dynamic> toMap() => {
        "type": type,
        "id": id,
        "message": message,
        "country": country,
        "sunrise": sunrise,
        "sunset": sunset,
      };
}
