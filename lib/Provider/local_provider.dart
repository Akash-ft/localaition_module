import 'package:flutter/material.dart';
import 'package:localaition/l10n/l10n.dart';

class LocaleProvider extends ChangeNotifier {
  //Local provider is used to store the local variable of Locale
  //(for example) If the users selected the arabic lang the content is rendered in arabic lang so that will be the locale value

  Locale? _locale;
//Every the value changes the local varible will be get and set to the value.
  Locale? get locale => _locale;

  void setLocale(Locale locale) {
    //to check the value is value of L10n list of lang
    if (!L10n.all.contains(locale)) return;
    _locale = locale;
    //Call this method whenever the object changes, to notify any clients the object may have changed.
    // Listeners that are added during this iteration will not be visited.
    // Listeners that are removed during this iteration will not be visited after they are removed.
    notifyListeners();
  }

  //this function is used to clear the locale it been restarted
  void clearLocale() {
    _locale = null;
    notifyListeners();
  }
}
