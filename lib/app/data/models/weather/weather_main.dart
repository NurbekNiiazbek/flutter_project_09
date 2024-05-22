class WeatherMain {
  final double temp;
  final double tempMin;
  final double tempMax;
  final int pressure;
  final int humidity;

  WeatherMain({
    required this.temp,
    required this.tempMin,
    required this.tempMax,
    required this.pressure,
    required this.humidity,
  });

  factory WeatherMain.fromMap(Map<String, dynamic> json) => WeatherMain(
        temp: json["temp"]?.toDouble(),
        tempMin: json["temp_min"]?.toDouble(),
        tempMax: json["temp_max"]?.toDouble(),
        pressure: json["pressure"],
        humidity: json["humidity"],
      );

  Map<String, dynamic> toMap() => {
        "temp": temp,
        "temp_min": tempMin,
        "temp_max": tempMax,
        "pressure": pressure,
        "humidity": humidity,
      };
}
