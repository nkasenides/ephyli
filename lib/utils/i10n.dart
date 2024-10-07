import 'package:ephyli/utils/language.dart';

class I10N {

  static Map<String, Map<String, String>> _translations = {

    //----- Challenges

    "c1_name": {
      "en": "Challenge 1",
      "el": "Πρόκληση 1",
      "fr": "#MISSING#",
      "it": "#MISSING#",
      "lb": "#MISSING#",
      "pl": "#MISSING#",
    },

    "c1_description": {
      "en": "Challenge 1 description",
      "el": "Πρόκληση 1 περιγραφή",
      "fr": "#MISSING#",
      "it": "#MISSING#",
      "lb": "#MISSING#",
      "pl": "#MISSING#",
    },

    "c2_name": {
      "en": "Challenge 2",
      "el": "Πρόκληση 2",
      "fr": "#MISSING#",
      "it": "#MISSING#",
      "lb": "#MISSING#",
      "pl": "#MISSING#",
    },

    "c2_description": {
      "en": "Challenge 2 description",
      "el": "Πρόκληση 2 περιγραφή",
      "fr": "#MISSING#",
      "it": "#MISSING#",
      "lb": "#MISSING#",
      "pl": "#MISSING#",
    },

    //----- Activities
    "c1a1_name": {
      "en": "Activity 1",
      "el": "Δραστηριότητα 1",
      "fr": "#MISSING#",
      "it": "#MISSING#",
      "lb": "#MISSING#",
      "pl": "#MISSING#",
    },

    "c1a1_description": {
      "en": "Activity 1 Description",
      "el": "Δραστηριότητα 1 Περιγραφή",
      "fr": "#MISSING#",
      "it": "#MISSING#",
      "lb": "#MISSING#",
      "pl": "#MISSING#",
    },

    //----- Activities
    "c1a2_name": {
      "en": "Activity 2",
      "el": "Δραστηριότητα 2",
      "fr": "#MISSING#",
      "it": "#MISSING#",
      "lb": "#MISSING#",
      "pl": "#MISSING#",
    },

    "c1a2_description": {
      "en": "Activity 2 Description",
      "el": "Δραστηριότητα 2 Περιγραφή",
      "fr": "#MISSING#",
      "it": "#MISSING#",
      "lb": "#MISSING#",
      "pl": "#MISSING#",
    },

  };

  static String? getI10nString(String id) {
    var locale = Language.getCurrentLocale();
    if (locale == Language.greekLocale) {
      return _translations[id]!["el"];
    }
    else if (locale == Language.englishLocale) {
      return _translations[id]!["en"];
    }
    else if (locale == Language.italyLocale) {
      return _translations[id]!["it"];
    }
    else if (locale == Language.franceLocale) {
      return _translations[id]!["fr"];
    }
    else if (locale == Language.luxembourgLocale) {
      return _translations[id]!["lb"];
    }
    else if (locale == Language.polandLocale) {
      return _translations[id]!["pl"];
    }
    else {
      return "No such language";
    }
  }

}