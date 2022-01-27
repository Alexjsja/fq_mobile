import 'package:flutter/material.dart';
import 'package:fq_mobile/domain/entities/app_props.dart';

class FqAppBar extends StatelessWidget implements PreferredSizeWidget {
  FqAppBar(
      {Key? key,
      required AppProps props,
      required ValueChanged<bool> switchTheme})
      : super(key: key) {
    _appBar = _init(props, switchTheme);
  }

  late final AppBar _appBar;

  @override
  Widget build(BuildContext context) {
    return _appBar;
  }

  @override
  Size get preferredSize => _appBar.preferredSize;

  AppBar _init(AppProps props, ValueChanged<bool> switchTheme) {
    return AppBar(
      leading: Image.asset("assets/images/logo.png"),
      title: const Text("Sber FQ"),
      actions: [
        Column(children: [
          Text('Authorized:' + props.authorized.toString(),
              style: const TextStyle(fontSize: 20)),
          Text('Session:' + props.session,
              style: const TextStyle(fontSize: 20)),
        ]),
        Row(
          children: [
            const Icon(Icons.wb_sunny_outlined),
            Switch(
                value: props.themeMode == ThemeMode.dark,
                onChanged: switchTheme)
          ],
        )
      ],
    );
  }
}
