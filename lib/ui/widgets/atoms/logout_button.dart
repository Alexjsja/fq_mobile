import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:fq_mobile/domain/cubits/app_props_cubit.dart';
import 'package:fq_mobile/domain/states/app_props_state.dart';

class LogoutButton extends StatelessWidget {
  const LogoutButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BlocBuilder<AppPropsCubit, AppPropsState>(
      builder: (context, state) {
        return ElevatedButton(
          onPressed: () => context.read<AppPropsCubit>().logout(),
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
      },
    );
  }
}
