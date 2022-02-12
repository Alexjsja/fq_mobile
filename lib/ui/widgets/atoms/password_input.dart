import 'package:flutter/material.dart';

class PasswordInput extends StatefulWidget {
  final String labelText;

  const PasswordInput(
      {Key? key, required this.labelText})
      : super(key: key);

  @override
  _PasswordInputState createState() => _PasswordInputState();
}

class _PasswordInputState extends State<PasswordInput> {

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return SizedBox(
      width: 200,
      height: 50,
      child: TextField(
        maxLines: 1,
        obscureText: true,
        autocorrect: true,
        decoration: InputDecoration(
          border: _border(theme),
          errorBorder: _border(theme),
          focusedBorder: _border(theme),
          focusedErrorBorder: _border(theme),
          labelText: widget.labelText,
          labelStyle: theme.textTheme.bodyText2,
        ),
      ),
    );
  }

  OutlineInputBorder _border(ThemeData theme) {
    return OutlineInputBorder(
      borderSide: BorderSide(color: theme.splashColor),
    );
  }
}
