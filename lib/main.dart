import 'package:filmes_api/seach_and_results/search_and_result_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FilmesAPI',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SearchAndResultsPage(),
    );
  }
}
