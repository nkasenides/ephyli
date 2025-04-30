import 'package:ephyli/utils/language.dart';
import 'package:ephyli/utils/pref_utils.dart';
import 'package:ephyli/utils/ui_utils.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app.dart';

main() async {

  WidgetsFlutterBinding.ensureInitialized();
  print("App running");

  //Load Language preference:
  var sharedPreferences = await SharedPreferences.getInstance();
  String? languageStr = sharedPreferences.getString(PrefUtils.languagePref);
  if (languageStr != null) {
    Locale locale = Language.parseToLocale(languageStr);
    Language.changeLocale(locale);
  }

  // UIUtils.enableFullScreen();
  runApp(const EPhyLiApp());
}