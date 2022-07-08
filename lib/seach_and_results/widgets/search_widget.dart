import 'package:filmes_api/providers/movies_api_provider.dart';
import 'package:filmes_api/seach_and_results/widgets/widgets_seach/input_text_field.dart';
import 'package:filmes_api/seach_and_results/widgets/widgets_seach/search_button.dart';
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
      Provider.of<MovieAPI>(context, listen: false).getMovieSearch(_movieName);
    }
  }

  String? _inputValidator(String? _enteredString) {
    String defaultEmptyError = 'Este campo não pode estar vazio';
    if (_enteredString == null) {
      return defaultEmptyError;
    } else if (_enteredString.isEmpty) {
      return defaultEmptyError;
    }
    return null;
  }

  void _onSave(String _enteredMovieName) {
    _movieName = _enteredMovieName;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _form,
      child: Row(
        children: [
          Expanded(
              flex: 8,
              child: InputTextField(
                  onSaved: _onSave,
                  inputValidator: _inputValidator,
                  initialValue: _movieName)),
          const Expanded(flex: 1, child: SizedBox()),
          Expanded(
              flex: 2,
              child: SearchButton(
                onPress: _submitData,
              )),
        ],
      ),
    );
  }
}
