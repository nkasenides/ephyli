import 'challenge.dart';

class Activity {

  String id;
  String challengeID;
  String nameRes;
  String descriptionRes;
  bool completed = false;
  bool unlocked;
  List<String> unlocksActivitiesIDs;

  Activity({
    required this.id,
    required this.nameRes,
    required this.challengeID,
    required this.descriptionRes,
    this.unlocked = false,
    required this.unlocksActivitiesIDs,
  });

  static Map<String, Activity> activities = {

    "c1a1": Activity(
      id: "c1a1",
      challengeID: Challenge.challenge1.id,
      nameRes: "c1a1_name",
      descriptionRes: "c1a1_description",
      unlocked: true,
      unlocksActivitiesIDs: [
        "c1a2",
      ]
    ),

    "c1a2": Activity(
      id: "c1a2",
      challengeID: Challenge.challenge1.id,
      nameRes: "c1a2_name",
      descriptionRes: "c1a2_description",
      unlocksActivitiesIDs: []
    ),

    "c2a1": Activity(
        id: "c2a1",
        challengeID: Challenge.challenge2.id,
        nameRes: "c2a1_name",
        descriptionRes: "c2a1_description",
        unlocksActivitiesIDs: [
          "c2a2"
        ]
    ),

    "c2a2": Activity(
        id: "c2a2",
        challengeID: Challenge.challenge2.id,
        nameRes: "c2a2_name",
        descriptionRes: "c2a2_description",
        unlocksActivitiesIDs: []
    ),

    "c3a1": Activity(
        id: "c3a1",
        challengeID: Challenge.challenge3.id,
        nameRes: "c3a1_name",
        descriptionRes: "c3a1_description",
        unlocksActivitiesIDs: []
    ),

    "c4a1": Activity(
        id: "c4a1",
        challengeID: Challenge.challenge4.id,
        nameRes: "c4a1_name",
        descriptionRes: "c4a1_description",
        unlocksActivitiesIDs: []
    ),

  };



}