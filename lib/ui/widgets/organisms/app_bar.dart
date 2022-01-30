import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:fq_mobile/domain/cubits/app_props_cubit.dart';
import 'package:fq_mobile/domain/states/app_props_state.dart';

class FqAppBar extends StatelessWidget implements PreferredSizeWidget {
  const FqAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppPropsCubit, AppPropsState>(
      builder: (context, state) {
        return AppBar(
          leading: Image.asset("assets/images/logo.png"),
          title: Text(AppLocalizations.of(context)!.title),
        );
      },
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(50.0);
}
