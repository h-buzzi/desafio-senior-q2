import 'package:filmes_api/providers/movies_api_provider.dart';
import 'package:filmes_api/seach_and_results/widgets/widgets_resultado/loading.dart';
import 'package:filmes_api/seach_and_results/widgets/widgets_resultado/results_list.dart';
import 'package:filmes_api/seach_and_results/widgets/widgets_resultado/start_text.dart';
import 'package:filmes_api/seach_and_results/widgets/widgets_resultado/text_invalid_json.dart';
import 'package:filmes_api/seach_and_results/widgets/widgets_resultado/text_notok.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ResultsOptionsWidget extends StatelessWidget {
  const ResultsOptionsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MovieAPI _movieApi = Provider.of<MovieAPI>(context);
    if (_movieApi.isInitialization) {
      return const StartupResultWidget();
    } else if (_movieApi.isLoading) {
      return const LoadingIndicator();
    } else if (_movieApi.isMovieListOK) {
      return const ResultsList();
    } else if (_movieApi.isNotOK) {
      return const NotOkResultWidget();
    } else {
      return const InvalidJsonResultWidget();
    }
  }
}
