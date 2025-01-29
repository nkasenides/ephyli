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
        unlocksActivitiesIDs: [
          "c4a2",
        ]
    ),

    "c4a2": Activity(
        id: "c4a2",
        challengeID: Challenge.challenge4.id,
        nameRes: "c4a2_name",
        descriptionRes: "c4a2_description",
        unlocksActivitiesIDs: [
          "c4a3"
        ]
    ),

    "c4a3": Activity(
        id: "c4a3",
        challengeID: Challenge.challenge4.id,
        nameRes: "c4a3_name",
        descriptionRes: "c4a3_description",
        unlocksActivitiesIDs: []
    ),

    "c5a1": Activity(
        id: "c5a1",
        challengeID: Challenge.challenge5.id,
        nameRes: "c5a1_name",
        descriptionRes: "c5a1_description",
        unlocksActivitiesIDs: []
    ),

    "c6a1": Activity(
        id: "c6a1",
        challengeID: Challenge.challenge6.id,
        nameRes: "c6a1_name",
        descriptionRes: "c6a1_description",
        unlocksActivitiesIDs: []
    ),

    "c7a1": Activity(
        id: "c7a1",
        challengeID: Challenge.challenge7.id,
        nameRes: "c7a1_name",
        descriptionRes: "c7a1_description",
        unlocksActivitiesIDs: []
    ),

    "c8a1": Activity(
        id: "c8a1",
        challengeID: Challenge.challenge7.id,
        nameRes: "c8a1_name",
        descriptionRes: "c8a1_description",
        unlocksActivitiesIDs: []
    ),

    "c9a1": Activity(
        id: "c9a1",
        challengeID: Challenge.challenge9.id,
        nameRes: "c9a1_name",
        descriptionRes: "c9a1_description",
        unlocksActivitiesIDs: [
          "c9a2"
        ]
    ),

    "c9a2": Activity(
        id: "c9a2",
        challengeID: Challenge.challenge9.id,
        nameRes: "c9a2_name",
        descriptionRes: "c9a2_description",
        unlocksActivitiesIDs: []
    ),

    "c10a1": Activity(
        id: "c10a1",
        challengeID: Challenge.challenge10.id,
        nameRes: "c10a1_name",
        descriptionRes: "c10a1_description",
        unlocksActivitiesIDs: [
          "c10a2"
        ]
    ),

    "c10a2": Activity(
        id: "c10a2",
        challengeID: Challenge.challenge10.id,
        nameRes: "c10a2_name",
        descriptionRes: "c10a2_description",
        unlocksActivitiesIDs: []
    ),

    "c11a1": Activity(
        id: "c11a1",
        challengeID: Challenge.challenge11.id,
        nameRes: "c11a1_name",
        descriptionRes: "c11a1_description",
        unlocksActivitiesIDs: []
    ),

    "c12a1": Activity(
        id: "c12a1",
        challengeID: Challenge.challenge12.id,
        nameRes: "c12a1_name",
        descriptionRes: "c12a1_description",
        unlocksActivitiesIDs: []
    ),
    "c12a2": Activity(
        id: "c12a2",
        challengeID: Challenge.challenge12.id,
        nameRes: "c12a2_name",
        descriptionRes: "c12a2_description",
        unlocksActivitiesIDs: []
    ),

    "c13a1": Activity(
        id: "c13a1",
        challengeID: Challenge.challenge13.id,
        nameRes: "c13a1_name",
        descriptionRes: "c13a1_description",
        unlocksActivitiesIDs: []
    ),

    "c13a2": Activity(
        id: "c13a2",
        challengeID: Challenge.challenge13.id,
        nameRes: "c13a2_name",
        descriptionRes: "c13a2_description",
        unlocksActivitiesIDs: []
    ),

  };



}