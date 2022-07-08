import 'package:flutter/material.dart';

class NotOkResultWidget extends StatelessWidget {
  const NotOkResultWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Ops! Parece que o servidor não conseguiu\n atender a esta requisição :c',
      textAlign: TextAlign.center,
    );
  }
}
