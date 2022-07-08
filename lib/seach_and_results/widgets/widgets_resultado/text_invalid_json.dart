import 'package:flutter/material.dart';

class InvalidJsonResultWidget extends StatelessWidget {
  const InvalidJsonResultWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text(
        "Parece que está entrada tem algo de errado no servidor\nPor favor reporte este erro para podermos corrigir!");
  }
}
