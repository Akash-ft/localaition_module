import 'package:flutter/material.dart';

// Class that return the localized list to the main file
class L10n {
  static final all = [
    const Locale("en"),
    const Locale("ar"),
    const Locale("de"),
  ];

  //Function to return the country name which speak the language.
  static String? getFlag(String code) {
    switch (code) {
      case "ar":
        return "πΈπΎσ ‘σ ₯σ €σ ΅σ Ώ";
      case "en":
        return "πΊπΈ";
      case "de":
        return "π§πͺ";
    }
  }
}
