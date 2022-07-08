import 'package:flutter/material.dart';
import '../../../models/movies.dart';
import '../../../providers/movies_api_provider.dart';
import 'package:provider/provider.dart';

class ResultsList extends StatelessWidget {
  const ResultsList({Key? key}) : super(key: key);

  Text createListText(String text, BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.bodyText1,
    );
  }

  @override
  Widget build(BuildContext context) {
    MovieAPI _movieApi = Provider.of<MovieAPI>(context);
    List<MoviesByYear> _moviesByYear = _movieApi.movies.moviesByYear;
    return Container(
      padding: const EdgeInsets.all(7),
      decoration: BoxDecoration(
          color: Theme.of(context).backgroundColor,
          border: Border.all(color: Theme.of(context).shadowColor, width: 1)),
      child: Column(
        children: [
          Expanded(
            child: SizedBox(
              child: ListView.builder(
                itemCount: _moviesByYear.length,
                itemBuilder: ((context, index) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      createListText(
                          _moviesByYear[index].year.toString(), context),
                      createListText(
                          _moviesByYear[index].moviesCount.toString(), context),
                    ],
                  );
                }),
              ),
            ),
          ),
          Container(
            color: Theme.of(context).primaryColorLight,
            width: double.infinity,
            height: 2,
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              'Total encontrado: ${_movieApi.movies.total.toString()}',
              style:
                  Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}
