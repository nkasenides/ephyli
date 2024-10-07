import 'challenge.dart';

class Activity {

  String id;
  String challengeID;
  String nameRes;
  String descriptionRes;
  bool completed = false;
  bool unlocked;

  Activity({
    required this.id,
    required this.nameRes,
    required this.challengeID,
    required this.descriptionRes,
    this.unlocked = false,
  });

  static Map<String, Activity> activities = {

    "c1a1": Activity(
      id: "c1a1",
      challengeID: Challenge.challenge1.id,
      nameRes: "c1a1_name",
      descriptionRes: "c1a1_description",
      unlocked: true
    ),

    "c1a2": Activity(
      id: "c1a2",
      challengeID: Challenge.challenge1.id,
      nameRes: "c1a2_name",
      descriptionRes: "c1a2_description",
    ),

  };



}