import 'package:flutter/material.dart';
import 'package:flutter_newsapi/dio_service.dart';
import 'package:flutter_newsapi/home_screen.dart';

void main() {
  DioHelper.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
