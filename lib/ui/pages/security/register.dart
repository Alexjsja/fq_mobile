import 'package:flutter/material.dart';
import 'package:fq_mobile/ui/widgets/organisms/register_form.dart';
import 'package:fq_mobile/ui/widgets/organisms/unauthorized_layout.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return UnauthorizedLayout(
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 100,
          horizontal: 40,
        ),
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: theme.splashColor,
            ),
          ),
          child: const RegisterForm(),
        ),
      ),
    );
  }
}
