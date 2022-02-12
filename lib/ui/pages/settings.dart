import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:fq_mobile/domain/cubits/app_props_cubit.dart';
import 'package:fq_mobile/domain/states/app_props_state.dart';
import 'package:fq_mobile/ui/widgets/atoms/language_switcher.dart';
import 'package:fq_mobile/ui/widgets/atoms/theme_switcher.dart';
import 'package:fq_mobile/ui/widgets/molecules/settings_item.dart';
import 'package:fq_mobile/ui/widgets/molecules/stack_with_logout_button_above.dart';
import 'package:fq_mobile/ui/widgets/organisms/page_body_with_header.dart';
import 'package:fq_mobile/ui/widgets/organisms/settings_list.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppPropsCubit, AppPropsState>(
      builder: (context, state) {
        var l10n = AppLocalizations.of(context)!;
        return StackWithLogoutButtonAbove(
          child: PageBodyWithHeader(
            pageName: l10n.settingsBack,
            child: Column(
              children: [
                SettingsList(
                  settings: [
                    SettingsItem(
                      title: l10n.darkTheme,
                      setting: const ThemeSwitcher(),
                    ),
                    SettingsItem(
                      title: l10n.language,
                      setting: const LanguageSwitcher(),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
