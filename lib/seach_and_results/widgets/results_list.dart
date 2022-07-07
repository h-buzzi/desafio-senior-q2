import 'package:flutter/material.dart';

class ResultsListWidget extends StatelessWidget {
  const ResultsListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _deviceHeight = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            color: Colors.red,
            height: _deviceHeight * 0.4,
          ),
          Container(
            color: Colors.yellow,
            height: _deviceHeight * 0.4,
          ),
        ],
      ),
    );
  }
}
