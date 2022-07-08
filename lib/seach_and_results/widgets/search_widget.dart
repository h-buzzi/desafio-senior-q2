import 'package:filmes_api/providers/movies_api_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchWidget extends StatefulWidget {
  const SearchWidget({Key? key}) : super(key: key);

  @override
  State<SearchWidget> createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  final _form = GlobalKey<FormState>();
  String _movieName = "";

  void _submitData() {
    if (_form.currentState!.validate()) {
      _form.currentState!.save();
      print(_movieName);
      Provider.of<MovieAPI>(context, listen: false).getMovieSearch(_movieName);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _form,
      child: Row(
        children: [
          Expanded(
            flex: 8,
            child: TextFormField(
              textInputAction: TextInputAction.done,
              keyboardType: TextInputType.name,
              initialValue: _movieName,
              enabled: !(Provider.of<MovieAPI>(context).isLoading),
              onSaved: (enteredMovieName) {
                _movieName = enteredMovieName!;
              },
              validator: (enteredValue) {
                if (enteredValue == null) {
                  return 'Este campo não pode estar vazio';
                }
                if (enteredValue.isEmpty) {
                  return 'Este campo não pode estar vazio';
                }
                return null;
              },
            ),
          ),
          Expanded(flex: 1, child: SizedBox()),
          Expanded(
            flex: 2,
            child: CircleAvatar(
              backgroundColor: Theme.of(context).primaryColor,
              child: IconButton(
                icon: Icon(
                  Icons.search,
                  color: Theme.of(context).backgroundColor,
                ),
                onPressed: () {
                  _submitData();
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
