import 'challenge.dart';

class Activity {

  String id;
  String challengeID;
  String nameRes;
  String descriptionRes;
  String instructionsRes;
  bool completed = false;

  Activity({
    required this.id,
    required this.nameRes,
    required this.challengeID,
    required this.descriptionRes,
    required this.instructionsRes
  });

  static Map<String, Activity> activities = {

    "c1a1": Activity(
      id: "c1a1",
      challengeID: Challenge.challenge1.id,
      nameRes: "challenge1_activity1_name",
      descriptionRes: "challenge1_activity1_description",
      instructionsRes: "challenge1_activity1_instructions",
    ),

    "c1a2": Activity(
      id: "c1a2",
      challengeID: Challenge.challenge1.id,
      nameRes: "challenge1_activity2_name",
      descriptionRes: "challenge1_activity2_description",
      instructionsRes: "challenge1_activity2_instructions",
    ),

  };

}