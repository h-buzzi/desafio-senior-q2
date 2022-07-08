import 'package:flutter/material.dart';
import '../../../models/movies.dart';
import '../../../providers/movies_api_provider.dart';
import 'package:provider/provider.dart';

class ResultsList extends StatelessWidget {
  const ResultsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<MoviesByYear> _moviesByYear =
        Provider.of<MovieAPI>(context).movies.moviesByYear;
    return Container(
      decoration: BoxDecoration(
          color: Theme.of(context).backgroundColor,
          border: Border.all(color: Theme.of(context).shadowColor, width: 1)),
      child: ListView.builder(
          itemCount: _moviesByYear.length,
          itemBuilder: ((context, index) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(_moviesByYear[index].year.toString()),
                Text(_moviesByYear[index].moviesCount.toString()),
              ],
            );
          })),
    );
  }
}
