import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class LogOutButton extends StatelessWidget {
  final VoidCallback onPressed;

  const LogOutButton({Key? key, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        primary: theme.primaryColor,
        padding: const EdgeInsets.all(7),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.west),
          Text(
            AppLocalizations.of(context)!.logOut,
            style: const TextStyle(fontSize: 20),
          ),
        ],
      ),
    );
  }
}
