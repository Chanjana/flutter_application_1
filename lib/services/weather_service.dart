import 'dart:convert';

import 'package:cafe_americano_two/models/weather.dart';
import 'package:http/http.dart' as http;
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

class WeatherService {
  static const BASE_URL = 'https://api.openweathermap.org/data/2.5/weather';
  final String apiKey;

  // Constructor to initialize the WeatherService with an API key
  WeatherService(this.apiKey);

  // Method to fetch weather data for a specified city
  Future<Weather> getWeather(String cityName) async {
    final response = await http
        .get(Uri.parse('$BASE_URL?q=$cityName&appid=$apiKey&units=metric'));

    if (response.statusCode == 200) {
      return Weather.fromJson(jsonDecode(response
          .body)); // Parse the JSON response body and convert it into a Weather object
    } else {
      throw Exception('Failed to load weather data');
    }
  }

  // Method to retrieve the current city based on device's location
  Future<String> getCurrentCity() async {
    LocationPermission permission = await Geolocator
        .checkPermission(); // Check the permission status for accessing device location
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }

    //get current location
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    //covert this location into list placemark objects
    List<Placemark> placemarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);

    //extract the city name from the first placemark
    String? city = placemarks[0].locality;

    return city ?? "";
  }
}
