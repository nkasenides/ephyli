import 'dart:convert';

import 'package:ephyli/utils/language.dart';
import 'package:flutter/material.dart';

import '../../utils/file_utils.dart';

class Term {

  final String id;

  final String text;

  final String correctDescription;
  final String wrongDescription;

  Term({
    required this.id,
    required this.text,
    required this.correctDescription,
    required this.wrongDescription
  });

  static Future<List<Term>> readTermsFromJSONFile(String fileName) async {
    String data = await FileUtils.readAssetFile(fileName);
    var json = jsonDecode(data);

    if (json["pairs"] == null) {
      throw Exception("The JSON file read is invalid.");
    }

    List<Term> terms = [];

    for (int i = 0; i < json["pairs"].length; i++) {
      var pair = json["pairs"][i];
      Term term = Term(
        id: pair["id"],
        text: readIntlText(pair["term"]),
        correctDescription: readIntlText(pair["correctDescription"]),
        wrongDescription: readIntlText(pair["wrongDescription"])
      );
      terms.add(term);
    }

    return terms;
  }

  static String readIntlText(Map<String, dynamic> jsonObject) {
    switch (Language.getCurrentLocale()) {
      case Language.englishLocale:
        return jsonObject["en"];
      case Language.greekLocale:
        return jsonObject["el"];
      case Language.franceLocale:
        return jsonObject["fr"];
      case Language.italyLocale:
        return jsonObject["it"];
      case Language.polandLocale:
        return jsonObject["pl"];
      default:
        throw Exception("Invalid language selected: ${Language.getCurrentLocale().countryCode!}");
    }
  }

}