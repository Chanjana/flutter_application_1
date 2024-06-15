import 'package:cafe_americano_two/views/home.dart';
import 'package:cafe_americano_two/views/home_screen.dart';
import 'package:cafe_americano_two/views/login.dart';
import 'package:cafe_americano_two/views/main_home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding
      .ensureInitialized(); // To ensure that binding is initialized before Firebase initialization
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xFF212325),
        colorScheme: ColorScheme.dark(),
      ),
      home: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            // If the user is authenticated, navigate to the main home screen
            return const MainHomeScreen();
          } else {
            // If the user is not authenticated, navigate to the login screen
            return const LoginScreen();
          }
        },
      ),
    );
  }
}
