import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:fq_mobile/ui/widgets/atoms/password_input.dart';
import 'package:fq_mobile/ui/widgets/atoms/phone_number_input.dart';
import 'package:fq_mobile/ui/widgets/atoms/register_button.dart';

class RegisterForm extends StatelessWidget {
  const RegisterForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Column(
      children: [
        Text(
          l10n.register,
          style: const TextStyle(fontSize: 30),
        ),
        const SizedBox(height: 10),
        const PhoneNumberInput(),
        const SizedBox(height: 10),
        PasswordInput(labelText: l10n.passwordHint),
        const SizedBox(height: 15),
        PasswordInput(labelText: l10n.repeatPasswordHint),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 60),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const RegisterButton(),
              const SizedBox(width: 18),
              // TODO: 12.02.2022 navigation button
              ElevatedButton(
                onPressed: () => {},
                child: Text(l10n.toLogin),
              ),
            ],
          ),
        )
      ],
    );
  }
}
