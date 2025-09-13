class CurrentWeather {
  final double tempC;
  final String condition;
  final int humidity;
  final double uvIndex;
  final int aqi;
  final double windKph;
  const CurrentWeather({
    required this.tempC, required this.condition,
    required this.humidity, required this.uvIndex,
    required this.aqi, required this.windKph,
  });
}