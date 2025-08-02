import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:surf_school/repositories/places_repository.dart';
import 'package:surf_school/screens/home_screen.dart';

void main() {
  GetIt.I.registerSingleton(PlacesRepository(dio: Dio()));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
