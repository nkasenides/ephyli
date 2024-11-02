import 'dart:ui';
import 'package:flutter_tts/flutter_tts.dart';

class TTS {

  static late FlutterTts flutterTts;
  static String? language;
  static double volume = 0.5;

  static init() {
    flutterTts = FlutterTts();
    flutterTts.awaitSpeakCompletion(true);
  }

  static setLanguage(Locale locale) {
    language = "${locale.languageCode}-${locale.countryCode}";
  }

  static Future speak(String text) async {
    return await flutterTts.speak(text);
  }

  static Future stop() async {
    return await flutterTts.stop();
  }

}