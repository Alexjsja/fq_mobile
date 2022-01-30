import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:fq_mobile/data/constants.dart';
import 'package:fq_mobile/domain/cubits/app_props_cubit.dart';
import 'package:fq_mobile/domain/states/app_props_state.dart';
import 'package:fq_mobile/ui/widgets/atoms/left_row.dart';
import 'package:fq_mobile/ui/widgets/atoms/switch_with_icon.dart';
import 'package:fq_mobile/ui/widgets/molecules/page_body_with_header.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppPropsCubit, AppPropsState>(builder: (context, state) {
      var props = (state as LoadedState).appProps;
      return PageBodyWithHeader(
        pageName: AppLocalizations.of(context)!.settingsBack,
        children: [
          LeftRow(
            children: [
              Text(
                AppLocalizations.of(context)!.darkTheme,
                style: const TextStyle(fontSize: 20),
              ),
              const SizedBox(width: 10),
              SwitchWithIcon(
                  value: props.themeMode == ThemeMode.dark,
                  icon: const Icon(Icons.wb_sunny_outlined),
                  onChanged: (val) {
                    _switchTheme(context, val);
                  }),
            ],
          ),
          const SizedBox(height: 10),
          LeftRow(
            children: [
              Text(
                AppLocalizations.of(context)!.language,
                style: const TextStyle(fontSize: 20),
              ),
              const SizedBox(width: 10),
              DropdownButton<String>(
                value: props.locale.languageCode,
                icon: const Icon(Icons.language),
                items: _languages(),
                onChanged: (code) {
                  _onChanged(code, context);
                },
              ),
            ],
          )
        ],
      );
    });
  }

  void _switchTheme(BuildContext context, bool themeIsDark) async {
    var mode = themeIsDark ? ThemeMode.dark : ThemeMode.light;
    context.read<AppPropsCubit>().updateTheme(mode);
  }

  List<DropdownMenuItem<String>> _languages() {
    return Constants.supportedLocales.map((locale) {
      return DropdownMenuItem(
        child: Text(locale.languageCode),
        value: locale.languageCode,
      );
    }).toList();
  }

  void _onChanged(String? languageCode, BuildContext context) {
    if (languageCode != null) {
      context.read<AppPropsCubit>().changeLanguage(Locale(languageCode, ''));
    }
  }
}
