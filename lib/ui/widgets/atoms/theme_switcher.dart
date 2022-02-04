import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fq_mobile/domain/cubits/app_props_cubit.dart';
import 'package:fq_mobile/domain/states/app_props_state.dart';
import 'package:fq_mobile/ui/widgets/atoms/switch_with_icon.dart';

class ThemeSwitcher extends StatelessWidget {
  const ThemeSwitcher({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppPropsCubit, AppPropsState>(
      builder: (context, state) {
        var props = (state as LoadedState).appProps;
        return SwitchWithIcon(
          value: props.themeMode == ThemeMode.dark,
          icon: const Icon(Icons.wb_twighlight),
          onChanged: (theme) =>
              context.read<AppPropsCubit>().switchTheme(theme),
        );
      },
    );
  }
}
