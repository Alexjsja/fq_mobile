import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:fq_mobile/data/constants.dart';
import 'package:fq_mobile/domain/cubits/app_props_cubit.dart';
import 'package:fq_mobile/domain/states/app_props_state.dart';
import 'package:fq_mobile/ui/widgets/atoms/switch_with_icon.dart';
import 'package:fq_mobile/ui/widgets/molecules/log_out_button.dart';
import 'package:fq_mobile/ui/widgets/molecules/page_body_with_header.dart';
import 'package:fq_mobile/ui/widgets/molecules/settings_item.dart';
import 'package:fq_mobile/ui/widgets/organisms/settings_list.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppPropsCubit, AppPropsState>(
      builder: (context, state) {
        var props = (state as LoadedState).appProps;
        return SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: Stack(
            children: [
              PageBodyWithHeader(
                pageName: AppLocalizations.of(context)!.settingsBack,
                child: Column(
                  children: [
                    SettingsList(
                      settings: [
                        SettingsItem(
                          title: AppLocalizations.of(context)!.darkTheme,
                          setting: SwitchWithIcon(
                            value: props.themeMode == ThemeMode.dark,
                            icon: const Icon(Icons.wb_twighlight),
                            onChanged: (val) {
                              _switchTheme(context, val);
                            },
                          ),
                        ),
                        SettingsItem(
                          title: AppLocalizations.of(context)!.language,
                          setting: DropdownButton<String>(
                            value: props.locale.languageCode,
                            icon: const Icon(Icons.language),
                            items: _languages(),
                            onChanged: (code) {
                              _onChanged(code, context);
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Positioned(
                right: 10,
                bottom: 10,
                child: LogOutButton(
                  onPressed: () => {},
                ),
              ),
            ],
          ),
        );
      },
    );
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
