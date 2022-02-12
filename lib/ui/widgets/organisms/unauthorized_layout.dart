import 'package:flutter/material.dart';
import 'package:fq_mobile/ui/widgets/atoms/language_switcher.dart';
import 'package:fq_mobile/ui/widgets/atoms/theme_switcher.dart';

import 'app_bar.dart';

class UnauthorizedLayout extends StatelessWidget {
  final Widget body;

  const UnauthorizedLayout({Key? key, required this.body})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const FqAppBar(
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: LanguageSwitcher(),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: ThemeSwitcher(),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: body,
      ),
    );
  }
}
