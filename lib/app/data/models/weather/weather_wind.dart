class Wind {
  final double speed;
  final int deg;

  Wind({
    required this.speed,
    required this.deg,
  });

  factory Wind.fromMap(Map<String, dynamic> json) => Wind(
        speed: json["speed"]?.toDouble() ?? 0.0,
        deg: json["deg"] ?? 0,
      );

  Map<String, dynamic> toMap() => {
        "speed": speed,
        "deg": deg,
      };
}
