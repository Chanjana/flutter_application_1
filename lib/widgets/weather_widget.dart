import 'dart:async';
import 'package:cafe_americano_two/models/weather.dart';
import 'package:cafe_americano_two/services/weather_service.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class WeatherWidget extends StatefulWidget {
  const WeatherWidget({Key? key}) : super(key: key);

  @override
  State<WeatherWidget> createState() => _WeatherWidgetState();
}

class _WeatherWidgetState extends State<WeatherWidget> {
  final _weatherService = WeatherService(
      '8f2e85c9651743e65c28d45143e95460'); // Instance of WeatherService initialized with an API key
  Weather? _weather; // Nullable Weather object to hold fetched weather data

  // Fetch weather data
  _fetchWeather() async {
    String cityName = await _weatherService.getCurrentCity();
    try {
      final weather = await _weatherService.getWeather(cityName);
      setState(() {
        _weather = weather;
      });
    } catch (e) {
      print(e);
    }
  }

  // Determines which weather animation to display based on mainCondition
  String getWeatherAnimation(String? mainCondition) {
    if (mainCondition == null) return 'assets/sunny.json';

    switch (mainCondition.toLowerCase()) {
      case 'clouds':
      case 'mist':
      case 'smoke':
      case 'haze':
      case 'dust':
      case 'fog':
        return 'assets/cloud.json';
      case 'rain':
      case 'drizzle':
      case 'shower rain':
        return 'assets/rain.json';
      case 'thunderstorm':
        return 'assets/thunder.json';
      case 'clear':
        return 'assets/sunny.json';
      default:
        return 'assets/sunny.json';
    }
  }

  @override
  void initState() {
    super.initState();
    _fetchWeather(); // Fetch weather data when the widget is initialized
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 6.0,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          if (_weather != null) ...[
            Lottie.asset(
              getWeatherAnimation(_weather
                  ?.mainCondition), // Load animation based on weather condition
              width: 120,
              height: 120,
              fit: BoxFit.fill,
            ),
            SizedBox(width: 80),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _weather!.cityName,
                    style: TextStyle(
                      fontSize: 24,
                      color: Color.fromARGB(255, 58, 17, 0),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 0),
                  Text(
                    '${_weather!.temp.round()} °C',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFFF7C44),
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    _weather!.mainCondition,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 93, 92, 92),
                    ),
                  ),
                ],
              ),
            ),
          ] else ...[
            CircularProgressIndicator(),
            SizedBox(width: 20),
            Text(
              "Loading weather...",
              style: TextStyle(
                fontSize: 18,
                color: Color.fromARGB(255, 243, 94, 8),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
