import 'package:flutter/material.dart';
import 'package:localaition/l10n/l10n.dart';
import 'package:provider/provider.dart';
import '../Provider/local_provider.dart';

class LanguagePickerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Variable provider is been to the Provider object of local_provider
    final provider = Provider.of<LocaleProvider>(context);
    // the value locale is been set in local_provider
    final locale = provider.locale;

    return DropdownButtonHideUnderline(
      child: DropdownButton(
          value: locale,
          icon: Container(width: 12),
          items: L10n.all.map(
            (locale) {
              final flag = L10n.getFlag(locale.languageCode).toString();
              return DropdownMenuItem(
                child: Text(
                  flag,
                  style: TextStyle(fontSize: 25),
                ),
                value: locale,
                onTap: () {
                  //On tapping the list of item is been switch the language code
                  final provider =
                      Provider.of<LocaleProvider>(context, listen: false);
                  provider.setLocale(locale);
                },
              );
            },
          ).toList(),
          onChanged: (_) {}),
    );
  }
}

class LanguageWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //this variable will store the language from the lang provided in locale variable.
    final locale = Localizations.localeOf(context);
    //this variable will store the country name corresponding to the language code.
    final flag = L10n.getFlag(locale.languageCode).toString();
    return Text(
      flag,
      style: TextStyle(fontSize: 40, color: Colors.amberAccent),
    );
  }
}
