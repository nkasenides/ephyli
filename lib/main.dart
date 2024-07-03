import 'package:ephyli/utils/language.dart';
import 'package:ephyli/utils/pref_utils.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app.dart';

main() async {

  WidgetsFlutterBinding.ensureInitialized();

  //Load Language preference:
  var sharedPreferences = await SharedPreferences.getInstance();
  String? languageStr = sharedPreferences.getString(PrefUtils.languagePref);
  if (languageStr != null) {
    Locale locale = Language.parseToLocale(languageStr);
    Language.changeLocale(locale);
  }

  runApp(const EPhyLiApp());
}