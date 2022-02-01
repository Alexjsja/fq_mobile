import 'package:flutter/material.dart';
import 'package:fq_mobile/ui/widgets/atoms/left_row.dart';

class SettingsItem extends StatelessWidget {
  final String title;
  final Widget setting;

  const SettingsItem({Key? key, required this.title, required this.setting})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LeftRow(
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 20),
        ),
        const SizedBox(width: 10),
        setting,
      ],
    );
  }
}
