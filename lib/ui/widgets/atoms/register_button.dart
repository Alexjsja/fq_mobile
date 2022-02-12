import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:fq_mobile/domain/cubits/app_props_cubit.dart';
import 'package:fq_mobile/domain/states/app_props_state.dart';

class RegisterButton extends StatelessWidget {
  const RegisterButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var l10n = AppLocalizations.of(context)!;
    return BlocBuilder<AppPropsCubit, AppPropsState>(
      builder: (context, state) {
        return ElevatedButton(
          onPressed: () => context.read<AppPropsCubit>().authorize(),
          child: Text(l10n.register),
        );
      },
    );
  }
}
