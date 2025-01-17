import 'package:ephyli/utils/pref_utils.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../theme/app_images.dart';

class Language {

  static Locale _selectedLocale = englishLocale;

  static const Locale englishLocale = Locale("en", "US");
  static const Locale greekLocale = Locale("el", "GR");
  static const Locale franceLocale = Locale("fr", "FR");
  static const Locale italyLocale = Locale("it", "IT");
  static const Locale luxembourgLocale = Locale("lb", "LB");
  static const Locale polandLocale = Locale("pl", "PL");

  static const allLocales = [
    englishLocale,
    //TODO - Enable once these language translations are available.
    greekLocale,
    // italyLocale,
    // franceLocale,
    // polandLocale,
    // luxembourgLocale,
  ];

  static Future<void> changeLocale(Locale locale) async {
    //Verify the locale is supported first:
    if (allLocales.contains(locale)) {
      _selectedLocale = locale;
    }

    var prefs = await SharedPreferences.getInstance();
    prefs.setString(PrefUtils.languagePref, _selectedLocale.toString());
  }

  static Locale getCurrentLocale() {
    return _selectedLocale;
  }

  static String getFlagResourceFromCurrentLocale() {
    return getFlagResourceForLocale(_selectedLocale);
  }

  static String getFlagResourceForLocale(Locale locale) {
    if (locale == greekLocale) {
      return AppImages.greece;
    }
    else if (locale == englishLocale) {
      return AppImages.uk;
    }
    else if (locale == italyLocale) {
      return AppImages.italy;
    }
    else if (locale == franceLocale) {
      return AppImages.france;
    }
    else if (locale == polandLocale) {
      return AppImages.poland;
    }
    else if (locale == luxembourgLocale) {
      return AppImages.luxembourg;
    }
    else {
      return AppImages.logo;
    }
  }

  static String getLocaleName(Locale locale, BuildContext context) {
    if (locale == greekLocale) {
      return AppLocalizations.of(context)!.greek;
    }
    else if (locale == englishLocale) {
      return AppLocalizations.of(context)!.english;
    }
    else if (locale == italyLocale) {
      return AppLocalizations.of(context)!.italian;
    }
    else if (locale == franceLocale) {
      return AppLocalizations.of(context)!.french;
    }
    else if (locale == luxembourgLocale) {
      return AppLocalizations.of(context)!.luxenbourgese;
    }
    else if (locale == polandLocale) {
      return AppLocalizations.of(context)!.polish;
    }
    else {
      return "No such language";
    }
  }

  static Locale parseToLocale(String locale) {
    if (locale.startsWith("en")) return englishLocale;
    if (locale.startsWith("el")) return greekLocale;
    if (locale.startsWith("fr")) return franceLocale;
    if (locale.startsWith("it")) return italyLocale;
    if (locale.startsWith("lb")) return luxembourgLocale;
    if (locale.startsWith("pl")) return polandLocale;
    throw Exception("Invalid language: $locale");
  }

}