import 'package:flutter/material.dart';
import 'package:fq_mobile/ui/widgets/atoms/logout_button.dart';

class StackWithLogoutButtonAbove extends StatelessWidget {
  final Widget child;

  const StackWithLogoutButtonAbove({Key? key, required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: Stack(
        children: [
          child,
          Positioned(
            right: 10,
            bottom: 10,
            child: LogoutButton(
              onPressed: () => {},
            ),
          ),
        ],
      ),
    );
  }
}
