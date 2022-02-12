import 'package:flutter/material.dart';

class ThemedBorderContainer extends StatelessWidget {
  final Widget? child;

  const ThemedBorderContainer({Key? key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Container(
      decoration: BoxDecoration(
        color: theme.backgroundColor,
        border: Border(
          bottom: BorderSide(color: theme.highlightColor),
        ),
      ),
      child: child,
    );
  }
}
