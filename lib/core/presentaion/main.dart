import 'package:flutter/material.dart';

import '../data/services/services_locator.dart';
import '../data/utils/app_string.dart';
import '../../movies/movie_list/presentation/screens/movies_screen.dart';


void main() {
  ServicesLocator().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppString.appName,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.grey.shade900,
      ),
      home: const MoviesScreen(),
    );
  }
}

