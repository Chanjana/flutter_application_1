import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/main_home.dart';
import 'package:flutter_application_1/screens/settings_screen.dart';
import 'package:flutter_application_1/screens/welcome_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xFF212325),
        colorScheme: ColorScheme.dark(),
      ),
      home: WelcomeScreen(),
      routes: {
        '/main_home': (context) => MainHomeScreen(),
        '/settings_screen': (context) => SettingsScreen(),
        '/welcome_screen': (context) => WelcomeScreen(),
      },
    );
  }
}
