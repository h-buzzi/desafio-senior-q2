import 'package:filmes_api/models/movies.dart';
import 'package:filmes_api/providers/movies_api_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ResultsOptionsWidget extends StatelessWidget {
  const ResultsOptionsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MovieAPI _movieApi = Provider.of<MovieAPI>(context);
    if (_movieApi.movieListOK) {
      List<MoviesByYear> _moviesByYear = _movieApi.movies.moviesByYear;
      return ListView.builder(
          itemCount: _moviesByYear.length,
          itemBuilder: ((context, index) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(_moviesByYear[index].year.toString()),
                Text(_moviesByYear[index].moviesCount.toString()),
              ],
            );
          }));
    } else if (_movieApi.isNotLoading) {
      return Text('Não OK');
    }
    return Text("Carregando");
  }
}
