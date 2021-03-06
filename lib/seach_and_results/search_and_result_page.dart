import 'package:filmes_api/seach_and_results/widgets/results_options.dart';
import 'package:filmes_api/seach_and_results/widgets/search_widget.dart';
import 'package:flutter/material.dart';

class SearchAndResultsPage extends StatelessWidget {
  const SearchAndResultsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _deviceHeight = MediaQuery.of(context).size.height;
    double _deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: null,
      body: LayoutBuilder(
        builder: (context, constraints) => ConstrainedBox(
          constraints: BoxConstraints(minHeight: constraints.maxHeight),
          child: SingleChildScrollView(
            child: Container(
              color: Theme.of(context).canvasColor,
              padding: EdgeInsets.symmetric(horizontal: _deviceWidth * 0.1),
              child: Column(children: [
                Container(
                  decoration: BoxDecoration(
                      color: Theme.of(context).backgroundColor,
                      border: Border.all(
                          color: Theme.of(context).shadowColor, width: 1)),
                  height: _deviceHeight * 0.1,
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  margin: EdgeInsets.only(
                      top: _deviceHeight * 0.16, bottom: _deviceHeight * 0.05),
                  child: const SearchWidget(),
                ),
                Container(
                  height: _deviceHeight * 0.5,
                  padding: EdgeInsets.symmetric(
                      vertical: _deviceHeight * 0.01,
                      horizontal: _deviceWidth * 0.01),
                  margin: EdgeInsets.only(bottom: _deviceHeight * 0.19),
                  child: const ResultsOptionsWidget(),
                ),
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
