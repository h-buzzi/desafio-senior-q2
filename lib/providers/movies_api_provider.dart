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
    final apiURL = "https://10.0.2.2:7131/filmes/$movieName";
    final apiResponse = await http.get(
      Uri.parse(apiURL),
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
  bool get isNotLoading => _statusOfGetRequest != Status.loading ? true : false;
  bool get movieListOK => _statusOfGetRequest == Status.ok ? true : false;
}
