/*
import 'package:flutter/material.dart';
import 'homepage.dart'; // Import the HomepageWidget from homepage.dart

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Removes the debug banner
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomepageWidget(), // Use your custom HomepageWidget
    );
  }
}
main 1 */


import 'package:flutter/material.dart';
import 'homepage.dart'; // Adjust the path if needed
import 'menu_page.dart';
import 'app_usage_details.dart';
import 'set_usage_limit.dart';
import 'focus_bedtime.dart'; 

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Indago',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // Define your routes here
      initialRoute: '/', // Set your initial route
      routes: {
        '/': (context) => const HomepageWidget(),
        'MenuPage': (context) => const MenuPageWidget(),
        'AppUsageDetails': (context) => const AppUsageDetailsWidget(),
        'SetUsageLimit': (context) => const SetUsageLimitWidget(),
        'FocusBedtime': (context) => const FocusBedtimeWidget(),
        // Add more routes as needed
      },
    );
  }
}



