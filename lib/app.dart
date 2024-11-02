import 'dart:convert';

import 'package:ephyli/model/game_badge.dart';
import 'package:ephyli/screen/game_screen.dart';
import 'package:ephyli/screen/splash_screen.dart';
import 'package:ephyli/theme/themes.dart';
import 'package:ephyli/utils/feature_explorer.dart';
import 'package:ephyli/utils/language.dart';
import 'package:ephyli/utils/pref_utils.dart';
import 'package:ephyli/utils/tts_utils.dart';
import 'package:feature_discovery/feature_discovery.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'screen/welcome_screen.dart';

class EPhyLiApp extends StatefulWidget {
  const EPhyLiApp({super.key});

  @override
  State<EPhyLiApp> createState() => _EPhyLiAppState();

  static _EPhyLiAppState? of(BuildContext context) => context.findAncestorStateOfType<_EPhyLiAppState>();

}

class _EPhyLiAppState extends State<EPhyLiApp> {

  void update() {
    setState(() { });
  }

  late Future<SharedPreferences> dataFuture;

  Future<SharedPreferences> _getPrefs() async {
    return await SharedPreferences.getInstance();
  }

  @override
  void initState() {
    super.initState();
    dataFuture = _getPrefs();
  }

  @override
  Widget build(BuildContext context) {
    TTS.init();
    return FeatureDiscovery(
      child: MaterialApp(
        title: "ePhyLi",
        home: FutureBuilder(
          future: dataFuture,
          builder: (context, snapshot) {

            if (snapshot.hasData && !snapshot.hasError) {
              bool onboarded = snapshot.data!.getBool(PrefUtils.onboarding_completed) ?? false;
              if (onboarded) {
                return const GameScreen();
              }
              return const WelcomeScreen();
            }
            return const SplashScreen();
          },
        ),
        theme: Themes.mainTheme,
        locale: Language.getCurrentLocale(),
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: Language.allLocales,
      ),
    );
  }
}
