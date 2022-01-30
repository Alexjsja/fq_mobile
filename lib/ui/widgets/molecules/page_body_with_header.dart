import 'package:flutter/material.dart';
import 'package:fq_mobile/ui/widgets/atoms/container_border_bottom_background_color.dart';

class PageBodyWithHeader extends StatelessWidget {
  final List<Widget>? children;
  final String pageName;

  const PageBodyWithHeader({Key? key, this.children, required this.pageName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ThemedBorderContainer(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                pageName,
                style: const TextStyle(fontSize: 20, color: Colors.white),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              ...?children,
            ],
          ),
        )
      ],
    );
  }
}
