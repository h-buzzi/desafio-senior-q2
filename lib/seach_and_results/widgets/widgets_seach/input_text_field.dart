import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../providers/movies_api_provider.dart';

class InputTextField extends StatelessWidget {
  String? _initialValue;
  Function _onSaved;
  Function _inputValidator;

  InputTextField(
      {required onSaved,
      required inputValidator,
      required initialValue,
      Key? key})
      : _onSaved = onSaved,
        _inputValidator = inputValidator,
        _initialValue = initialValue,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textInputAction: TextInputAction.done,
      keyboardType: TextInputType.name,
      initialValue: _initialValue,
      enabled: !(Provider.of<MovieAPI>(context).isLoading),
      onSaved: (enteredMovieName) {
        _onSaved(enteredMovieName!);
      },
      validator: (enteredValue) {
        _inputValidator(enteredValue);
      },
    );
  }
}
