import 'package:flutter/material.dart';

class StartupResultWidget extends StatelessWidget {
  const StartupResultWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text("Insira o nome do filme desejado acima\nE comece a pesquisar!",
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.headline1);
  }
}
