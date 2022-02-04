import 'package:flutter/material.dart';
import 'package:fq_mobile/ui/widgets/atoms/container_border_bottom_background_color.dart';

class PageBodyWithHeader extends StatelessWidget {
  final Widget child;
  final String pageName;

  const PageBodyWithHeader(
      {Key? key, required this.child, required this.pageName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
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
            padding: const EdgeInsets.all(10.0),
            child: child,
          ),
        ],
      ),
    );
  }
}
