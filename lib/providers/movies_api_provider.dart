import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../models/movies.dart';

enum Status { ok, notOk, okButInvalidJson, initiation, loading }

class MovieAPI with ChangeNotifier {
  Status _statusOfGetRequest = Status.initiation;
  late Movies _moviesFromApiSearch;

  void getMovieSearch(String movieName) async {
    _statusOfGetRequest = Status.loading;
    notifyListeners();
    final apiResponse = await http.get(
      Uri.parse("https://10.0.2.2:7131/filmes/$movieName"),
    );
    if (apiResponse.statusCode == 200) {
      try {
        json.decode(apiResponse.body) as Map<String, dynamic>;
      } catch (_) {
        _statusOfGetRequest = Status.okButInvalidJson;
        notifyListeners();
      }
      if (_statusOfGetRequest != Status.okButInvalidJson) {
        _moviesFromApiSearch =
            Movies(json.decode(apiResponse.body) as Map<String, dynamic>);
        _statusOfGetRequest = Status.ok;
        notifyListeners();
      }
    } else {
      _statusOfGetRequest = Status.notOk;
      notifyListeners();
    }
  }

  Movies get movies => _moviesFromApiSearch;
  bool get isLoading => _statusOfGetRequest == Status.loading ? true : false;
  bool get isMovieListOK => _statusOfGetRequest == Status.ok ? true : false;
  bool get isInitialization =>
      _statusOfGetRequest == Status.initiation ? true : false;
  bool get isNotOK => _statusOfGetRequest == Status.notOk ? true : false;
  bool get isInvalidJson =>
      _statusOfGetRequest == Status.okButInvalidJson ? true : false;
}
