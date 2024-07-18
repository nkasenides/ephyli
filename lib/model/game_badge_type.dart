enum GameBadgeType {

  TUTORIAL_BADGE,

}

extension GameBadgeOptionExtension on GameBadgeType {

  String toJson() {
    return this.toString().split('.').last;
  }

  static GameBadgeType fromJson(String json) {
    return GameBadgeType.values.firstWhere((e) => e.toString().split('.').last == json);
  }

}