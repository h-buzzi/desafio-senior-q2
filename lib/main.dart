import 'dart:io';

import 'package:filmes_api/providers/movies_api_provider.dart';
import 'package:filmes_api/seach_and_results/search_and_result_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  HttpOverrides.global = MyHttpOverrides();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => MovieAPI(),
      child: MaterialApp(
        title: 'FilmesAPI',
        theme: ThemeData(
          canvasColor: Colors.white,
          primarySwatch: Colors.teal,
        ),
        home: const SearchAndResultsPage(),
      ),
    );
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
