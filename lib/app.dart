import 'package:flutter/material.dart';
import 'package:jul6_api_learn/screens/home_screen.dart';

class ApiLearnApp extends StatelessWidget {
  const ApiLearnApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Learn Api',
      home: HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
