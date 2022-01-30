import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:fq_mobile/ui/widgets/molecules/page_body_with_header.dart';

class ProfilingPage extends StatelessWidget {
  const ProfilingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageBodyWithHeader(
      pageName: AppLocalizations.of(context)!.profilingBack,
      children: const [],
    );
  }
}
