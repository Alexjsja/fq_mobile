import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:fq_mobile/data/constants.dart';
import 'package:intl_phone_field/country_picker_dialog.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class PhoneNumberInput extends StatelessWidget {
  const PhoneNumberInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var l10n = AppLocalizations.of(context)!;
    return SizedBox(
      width: 235,
      child: IntlPhoneField(
        invalidNumberMessage: l10n.invalidNumber,
        pickerDialogStyle: PickerDialogStyle(
          searchFieldInputDecoration: InputDecoration(
            hintText: l10n.searchCountry,
          ),
        ),
        decoration: InputDecoration(
          label: Text(
            l10n.phoneNumberHint,
          ),
        ),
        countries: const [...Constants.supportedCountriesNumbers],
        initialCountryCode: 'RU',
        onChanged: (num) => debugPrint(num.countryCode+num.number),
      ),
    );
  }
}
