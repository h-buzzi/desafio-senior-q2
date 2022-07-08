import 'package:flutter/material.dart';

class NotOkResultWidget extends StatelessWidget {
  const NotOkResultWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      'Ops! Parece que o servidor não conseguiu\n atender a esta requisição :c',
      textAlign: TextAlign.center,
      style: Theme.of(context).textTheme.headline1,
    );
  }
}
