import 'package:flutter/material.dart';

import '../data/services/services_locator.dart';
import '../../movies/movie_list/presentation/screens/movies_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'Theme/app_themes.dart';

void main() {
  ServicesLocator().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Set a static title here or leave it empty
      title: '',
      theme: AppThemes.lightTheme, // Light theme
      darkTheme: AppThemes.darkTheme, // Dark theme
      themeMode: ThemeMode.system, // Automatically adapt to system theme
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: Builder(
        builder: (context) {
          return MoviesScreenWrapper();
        },
      ),
    );
  }
}

class MoviesScreenWrapper extends StatelessWidget {
  const MoviesScreenWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.appName),
      ),
      body: const MoviesScreen(),
    );
  }
}


