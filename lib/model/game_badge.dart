import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/pref_utils.dart';
import 'game_badge_type.dart';

class GameBadge {

  final String name;
  final String description;
  final String imageCompletedResource;
  final String imageIncompleteResource;
  bool isOwned = false;

  GameBadge({
    required this.name,
    required this.description,
    required this.imageCompletedResource,
    required this.imageIncompleteResource,
  });

  GameBadge.fromJson(Map<String, dynamic> json) :
        name = json['name'] as String,
        description = json['description'] as String,
        imageCompletedResource = json["imageCompletedResource"] as String,
        imageIncompleteResource = json["imageIncompleteResource"] as String
  ;

  Map<String, dynamic> toJson() => {
    'name': name,
    'description': description,
    'imageCompletedResource': imageCompletedResource,
    'imageIncompleteResource': imageIncompleteResource,
  };

  static final Map<GameBadgeType, GameBadge> gameBadges = {};

  static void initializeGameBadges(BuildContext context) {

    gameBadges[GameBadgeType.TUTORIAL_BADGE] = GameBadge(
      name: AppLocalizations.of(context)!.tutorialBadgeTitle,
      description: AppLocalizations.of(context)!.tutorialBadgeDescription,
      imageCompletedResource: "assets/img/greece.png",
      imageIncompleteResource: "assets/img/france.png",
    );

  }

  static void completeBadge(GameBadgeType badge) {
    GameBadge? gameBadge = gameBadges[badge];
    if (gameBadge != null) {
      gameBadge.isOwned = true;
      gameBadges[badge] = gameBadge;
      saveBadgesToPrefs();
    }
  }

  static Future saveBadgesToPrefs() async {
    //Convert to String -> GameBadge first:
    Map<String, GameBadge> badgesMap = {};
    gameBadges.forEach((key, value) {
      badgesMap[key.toJson()] = value;
    },);

    //Serialize and save to prefs:
    String jsonData = jsonEncode(badgesMap);
    debugPrint("Saved badges to prefs");
    debugPrint(jsonData);
    var prefs = await SharedPreferences.getInstance();
    prefs.setString(PrefUtils.badge_data, jsonData);
  }

  static Future loadBadgesFromPrefs() async {
    var prefs = await SharedPreferences.getInstance();
    String? jsonData = prefs.getString(PrefUtils.badge_data);

    if (jsonData == null || jsonData.isEmpty) {
      throw Exception("No badge data found!");
    }

    Map<String, dynamic> data = jsonDecode(jsonData);
    gameBadges.clear();

    data.forEach((key, value) {
      final GameBadge badge = GameBadge.fromJson(value);
      final GameBadgeType badgeType = GameBadgeOptionExtension.fromJson(key);
      gameBadges[badgeType] = badge;
    });
  }

}