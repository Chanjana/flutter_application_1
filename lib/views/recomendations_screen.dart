// ignore_for_file: prefer_const_constructors

import 'dart:convert';
import 'package:cafe_americano_two/models/weather.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:cafe_americano_two/models/cardItem.dart';
import 'package:cafe_americano_two/widgets/weather_widget.dart';
import 'package:cafe_americano_two/services/weather_service.dart';

class RecomendationsScreen extends StatefulWidget {
  const RecomendationsScreen({Key? key}) : super(key: key);

  @override
  State<RecomendationsScreen> createState() => RecomendationsScreenState();
}

class RecomendationsScreenState extends State<RecomendationsScreen> {
  final _weatherService = WeatherService('8f2e85c9651743e65c28d45143e95460');
  Weather? _weather;
  List<CardItem> _items = [];

  @override
  void initState() {
    super.initState();
    _fetchWeather();
  }

  Future<void> _fetchWeather() async {
    String cityName = await _weatherService.getCurrentCity();
    try {
      final weather = await _weatherService.getWeather(cityName);
      setState(() {
        _weather = weather;
      });
      _fetchItems(weather.temp > 30);
    } catch (e) {
      print(e);
    }
  }

  Future<void> _fetchItems(bool isHot) async {
    final String fileName =
        isHot ? 'assets/cold_items.json' : 'assets/hot_items.json';
    final String response = await rootBundle.loadString(fileName);
    final List<dynamic> data = json.decode(response);
    final List<CardItem> items =
        data.map((item) => CardItem.fromJson(item)).toList();
    setState(() {
      _items = items;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('The perfect brew for you'),
        backgroundColor: Color.fromARGB(255, 255, 116, 2).withOpacity(0.9),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              if (_weather != null) ...[
                WeatherWidget(), //calling the widget
                SizedBox(height: 16),
              ] else ...[
                CircularProgressIndicator(),
                SizedBox(height: 20),
                Text(
                  "Loading weather...",
                  style: TextStyle(fontSize: 18, color: Color(0xFFF1E7E7)),
                ),
              ],
              Expanded(
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16.0,
                    mainAxisSpacing: 10.0,
                    childAspectRatio: 0.80,
                  ),
                  itemCount: _items.length,
                  itemBuilder: (BuildContext context, int index) {
                    final item = _items[index];
                    return GestureDetector(
                      onTap: () {
                        _showItemDetails(context,
                            item); //when clicked we call the method that shows master details in pop-up
                      },
                      child: Card(
                        margin: const EdgeInsets.all(8.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                          side: const BorderSide(color: Color(0xFFE0E0E0)),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 120,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(12.0)),
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage(item.imageUrl),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 10.0,
                                  right: 5.0,
                                  bottom: 0.0,
                                  top: 20.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        item.title,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                        ),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      const SizedBox(height: 4),
                                      Text(
                                        item.detail,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyLarge,
                                      ),
                                    ],
                                  ),
                                  IconButton(
                                    icon: Icon(
                                      Icons.add_box_rounded,
                                      size: 28,
                                      color: Color(0xFFE57734),
                                    ),
                                    onPressed: () {
                                      // onPressed
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showItemDetails(BuildContext context, CardItem item) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.white,
                blurRadius: 10.0,
                spreadRadius: 0.1,
                offset: Offset(0, 4), // Adjust the offset if needed
              ),
            ],
          ),
          child: AlertDialog(
            contentPadding: EdgeInsets.zero,
            content: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: 16),
                Center(
                  child: Text(
                    item.title,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 16),
                Center(
                  child: Image.asset(
                    item.imageUrl,
                    width: 200, // Adjust width as per your design
                    height: 200, // Adjust height as per your design
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(height: 16),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  child: Text(
                    item.detail,
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.grey,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 16),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  child: Text(
                    item.description,
                    style: TextStyle(
                      fontSize: 16,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 16),
              ],
            ),
            actions: [
              TextButton(
                child: Text('Close'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
