class Weather {
  final String cityName;
  final double temp;
  final String mainCondition;

  Weather(
      {required this.cityName,
      required this.temp,
      required this.mainCondition});

// Factory constructor to create a Weather object from JSON data
  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
        cityName: json['name'], // Extracts the city name from the JSON
        temp: json['main']['temp'].toDouble(),
        mainCondition: json['weather'][0]['main']);
  }
}
