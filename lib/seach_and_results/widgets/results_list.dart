import 'package:filmes_api/providers/movies_api_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ResultsListWidget extends StatelessWidget {
  const ResultsListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _deviceHeight = MediaQuery.of(context).size.height;
    return Provider.of<MovieAPI>(context).movieListOK
        ? SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  color: Colors.red,
                  height: _deviceHeight * 0.4,
                  child: Text(
                      Provider.of<MovieAPI>(context).movies.total.toString()),
                ),
                Container(
                  color: Colors.yellow,
                  height: _deviceHeight * 0.4,
                ),
              ],
            ),
          )
        : Provider.of<MovieAPI>(context).isNotLoading
            ? Text('Não OK')
            : Text("Carregando");
  }
}
