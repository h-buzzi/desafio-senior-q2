import 'package:filmes_api/providers/movies_api_provider.dart';
import 'package:filmes_api/seach_and_results/widgets/widgets_resultado/loading.dart';
import 'package:filmes_api/seach_and_results/widgets/widgets_resultado/results_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ResultsOptionsWidget extends StatelessWidget {
  const ResultsOptionsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MovieAPI _movieApi = Provider.of<MovieAPI>(context);
    if (_movieApi.isInitialization) {
      return const Text(
          "Insira o nome do filme desejado acima\nE comece a pesquisar!");
    } else if (_movieApi.isLoading) {
      return LoadingIndicator();
    } else if (_movieApi.isMovieListOK) {
      return ResultsList();
    } else if (_movieApi.isNotOK) {
      return const Text(
        'Ops! Parece que o servidor não conseguiu\n atender a esta requisição :c',
        textAlign: TextAlign.center,
      );
    } else if (_movieApi.isInvalidJson) {
      return Text(
          "Parece que está entrada tem algo de errado no servidor\nPor favor reporte este erro para podermos corrigir!");
    }
    return Text("Um erro inesperado ocorreu\nTente novamente mais tarde.");
  }
}
