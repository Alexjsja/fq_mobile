import 'package:flutter/material.dart';
import 'package:fq_mobile/ui/widgets/molecules/settings_item.dart';

class SettingsList extends StatelessWidget {
  final List<SettingsItem> settings;

  const SettingsList({Key? key, required this.settings}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: settings.length,
      itemBuilder: (context, idx) {
        return Container(
          child: settings[idx],
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return const SizedBox(height: 10);
      },
    );
  }
}
