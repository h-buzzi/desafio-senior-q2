import 'package:flutter/material.dart';

class SearchButton extends StatelessWidget {
  VoidCallback onPress;

  SearchButton({required this.onPress, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Theme.of(context).primaryColor,
      child: IconButton(
        icon: Icon(
          Icons.search,
          color: Theme.of(context).backgroundColor,
        ),
        onPressed: onPress,
      ),
    );
  }
}
