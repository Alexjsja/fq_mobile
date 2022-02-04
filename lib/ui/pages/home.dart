import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:fq_mobile/ui/widgets/organisms/page_body_with_header.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return PageBodyWithHeader(
      pageName: AppLocalizations.of(context)!.homeBack,
      child: Container(),
    );
  }
}
