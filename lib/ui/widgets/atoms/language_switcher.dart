import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fq_mobile/data/constants.dart';
import 'package:fq_mobile/domain/cubits/app_props_cubit.dart';
import 'package:fq_mobile/domain/states/app_props_state.dart';

class LanguageSwitcher extends StatelessWidget {
  const LanguageSwitcher({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppPropsCubit, AppPropsState>(
      builder: (context, state) {
        final props = (state as LoadedState).appProps;
        return DropdownButton<String>(
            underline: Container(),
            value: props.locale.languageCode,
            icon: const Icon(Icons.language),
            items: _languages(),
            onChanged: (code) => context.read<AppPropsCubit>().changeLanguage(code??'en'),
        );
      },
    );
  }

  List<DropdownMenuItem<String>> _languages() {
    return Constants.supportedLocales.map((locale) {
      return DropdownMenuItem(
        child: Text(locale.languageCode),
        value: locale.languageCode,
      );
    }).toList();
  }
}
