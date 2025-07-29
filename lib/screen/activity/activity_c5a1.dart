import 'dart:async';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:ephyli/controller/activity_manager.dart';
import 'package:ephyli/theme/themes.dart';
import 'package:ephyli/utils/i10n.dart';
import 'package:ephyli/utils/ui_utils.dart';
import 'package:ephyli/widgets/instructions_widget.dart';
import 'package:ephyli/widgets/rotate_device_widget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_map/flutter_image_map.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gap/gap.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:widget_zoom/widget_zoom.dart';

import '../../model/activity.dart';
import '../../model/challenge.dart';
import '../../model/game_badge.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ActivityC5A1 extends StatefulWidget {
  @override
  _ActivityC5A1State createState() => _ActivityC5A1State();
}

enum C5A1Stage {
  introduction,
  activity,
  finish
}

enum Correctness {
  none,
  correct,
  wrong
}

class _ActivityC5A1State extends State<ActivityC5A1> {


  C5A1Stage stage = C5A1Stage.introduction;
  final String activityID = "c5a1";
  late Activity activity;
  late SharedPreferences prefs;
  late Future<void> future;

  /**activity data**/
  Map<String, String> correctElementsToAreas = {};
  Map<String, String> areaToElementPlacements = {};
  List<String> availableElements = [];

  Future<void> loadData() async {
    prefs = await SharedPreferences.getInstance();
    activity = Activity.activities[activityID]!;
  }

  List<String> elementTexts = List.filled(10, "?");

  @override
  void initState() {
    //Initialize prefs & activity data:
    future = loadData();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Widget activityIntroView() {
    return InstructionsWidget(
        prefs,
        AppLocalizations.of(context)!.c5a1_intro_message,
        AppLocalizations.of(context)!.ready_letsgo,
        () {
          setState(() {
            stage = C5A1Stage.activity;
          });
        }
    );
  }

  Widget activityGameView() {

    if (correctElementsToAreas.isEmpty) {
      correctElementsToAreas = {
        "Competence": "Element 1",
        "Confidence": "Element 2",
        "Valuation": "Element 3",
        "Motivation": "Element 4",
        "Self-Competence": "Element 5",
        "Agency": "Element 6",
        "Relatedness": "Element 7",
        "Connectedness": "Element 8",
        "Enjoyment": "Element 9",
        "Active Participation": "Element 10",
      };

      availableElements = correctElementsToAreas.keys.toList();
      availableElements.shuffle();
      areaToElementPlacements = {};
    }

    return OrientationBuilder(
      builder: (context, orientation) {
        if (orientation == Orientation.landscape) {
          return Stack(
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_back),
                color: Colors.black,
                onPressed: () => Navigator.pop(context),
              ),
              Positioned(
                bottom: 10,
                right: 10,
                child: IconButton(
                  icon: const Icon(Icons.help, color: Colors.blue),
                  color: Colors.black,
                  onPressed: () {
                    showDialog(context: context, builder: (context) {
                      return AlertDialog(
                        title: Text(AppLocalizations.of(context)!.help),
                        content: Text(AppLocalizations.of(context)!.c5a1_help),
                        actions: [
                          OutlinedButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text(AppLocalizations.of(context)!.ok),
                          )
                        ],
                      );
                    },);
                  },
                ),
              ),
              Center(
                child: ImageMap(
                  image: Image.asset('assets/img/diagram_noanswers.jpg'),
                  regions: [
                    //Element 1:
                    ImageMapRegion.fromRect(
                        rect: const Rect.fromLTRB(360, 360, 225, 328),
                        color: getColorFromCurrentPlacement("Element 1"),
                        title: "Element 1"
                    ),

                    //Element 2:
                    ImageMapRegion.fromRect(
                        rect: const Rect.fromLTRB(569, 192, 454, 158),
                        color: getColorFromCurrentPlacement("Element 2"),
                        title: "Element 2"
                    ),

                    //Element 3:
                    ImageMapRegion.fromRect(
                        rect: const Rect.fromLTRB(745, 171, 625, 138),
                        color: getColorFromCurrentPlacement("Element 3"),
                        title: "Element 3"
                    ),

                    //Element 4:
                    ImageMapRegion.fromRect(
                      rect: const Rect.fromLTRB(622, 323, 749, 349),
                      color: getColorFromCurrentPlacement("Element 4"),
                      title: "Element 4",
                    ),

                    //Element 5:
                    ImageMapRegion.fromRect(
                        rect: const Rect.fromLTRB(863,126,988,183),
                        color: getColorFromCurrentPlacement("Element 5"),
                        title: "Element 5"
                    ),

                    //Element 6:
                    ImageMapRegion.fromRect(
                        rect: const Rect.fromLTRB(844,232,931,278),
                        color: getColorFromCurrentPlacement("Element 6"),
                        title: "Element 6"
                    ),

                    //Element 7:
                    ImageMapRegion.fromRect(
                        rect: const Rect.fromLTRB(849,323,970,368),
                        color: getColorFromCurrentPlacement("Element 7"),
                        title: "Element 7"
                    ),

                    //Element 8:
                    ImageMapRegion.fromRect(
                        rect: const Rect.fromLTRB(857,410,973,505),
                        color: getColorFromCurrentPlacement("Element 8"),
                        title: "Element 8"
                    ),

                    //Element 9:
                    ImageMapRegion.fromRect(
                        rect: const Rect.fromLTRB(665,387,784,406),
                        color: getColorFromCurrentPlacement("Element 9"),
                        title: "Element 9"
                    ),

                    //Element 10:
                    ImageMapRegion.fromRect(
                        rect: const Rect.fromLTRB(278,497,414,540),
                        color: getColorFromCurrentPlacement("Element 10"),
                        title: "Element 10"
                    ),
                  ],
                  onTap: (ImageMapRegion region) {
                    _showDialog(context, region.title!);
                  },
                ),
              ),

              // //Labels:
              // Positioned( //LABEL 1
              //   left: 303,
              //   top: 224,
              //   child: Text(elementTexts[0], textAlign: TextAlign.center,)
              // ),
              //
              // Positioned( //LABEL 2
              //     left: 452,
              //     top: 108,
              //     child: Text(elementTexts[1], textAlign: TextAlign.center,)
              // ),
              //
              // Positioned( //LABEL 3
              //     left: 452,
              //     top: 108,
              //     child: Text(elementTexts[1], textAlign: TextAlign.center,)
              // ),

            ],
          );
        }
        else {
          return Center(child: RotateDeviceWidget(Orientation.portrait));
        }
      },
    );

  }

  Color getColorFromCurrentPlacement(String areaID) {
    String? element = areaToElementPlacements[areaID];
    if (element != null) {
      if (correctElementsToAreas[element] == areaID) {
        return Colors.green;
      }
      return Colors.red;
    }
    return Colors.yellow;
  }

  // Function to display a dialog for the clicked region
  void _showDialog(BuildContext context, String regionID) {

    String? existingElement = areaToElementPlacements[regionID];

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(AppLocalizations.of(context)!.c5a1_instruction_title),
          content: SingleChildScrollView(
            child: Column(
              children: [

                existingElement != null ? Row(
                  children: [
                    Text(
                      AppLocalizations.of(context)!.currentElement,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const Gap(10),
                    Text(existingElement),
                    const Gap(10),
                    Icon(
                      getColorFromCurrentPlacement(regionID) == Colors.green ? Icons.check : Icons.close,
                      color: getColorFromCurrentPlacement(regionID),
                    ),
                  ],
                ) : Container(),

                existingElement != null ? const Gap(10) : Container(),

                Text(AppLocalizations.of(context)!.c5a1_instruction_place),

                const Gap(10),

                ...availableElements.map((e) {
                  return OutlinedButton(
                    child: Text(e),
                    onPressed: () {
                      setState(() {
                        if (existingElement != null) { //Replace existing element
                          availableElements.add(existingElement);
                          areaToElementPlacements[regionID] = e;
                          availableElements.remove(e);
                        }
                        else { //set new element
                          areaToElementPlacements[regionID] = e;
                          availableElements.remove(e);
                        }
                      });
                      Navigator.pop(context);

                      //Check if everything is correct:
                      bool correct = true;
                      for (String areaID in correctElementsToAreas.values) {
                        if (getColorFromCurrentPlacement(areaID) != Colors.green) {
                          correct = false;
                          break;
                        }
                      }
                      if (correct) {
                        setState(() {
                          stage = C5A1Stage.finish;
                        });
                      }

                    },
                  );
                },),

              ],
            ),
          ),
          actions: [
            TextButton(
              child: Text(AppLocalizations.of(context)!.back),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),

            areaToElementPlacements[regionID] != null ? TextButton(
              child: Text(AppLocalizations.of(context)!.clear),
              onPressed: () {
                setState(() {
                  areaToElementPlacements.remove(regionID);
                });
                Navigator.pop(context);
              },
            ) : Container(),
          ],
          actionsAlignment: MainAxisAlignment.start,
        );
      },
    );
  }

  Widget activityFinishView() {
    return OrientationBuilder(builder: (context, orientation) {
      if (orientation == Orientation.portrait) {
        return InstructionsWidget(
            prefs,
            AppLocalizations.of(context)!.c5a1_finish_message,
            AppLocalizations.of(context)!.finish,
                () {
              ActivityManager.completeActivity(activityID).then((value) {
                //Find all badges related to this activity and award them:
                for (var badgeID in Challenge.challenge5.badgeIDs) {
                  var badge = GameBadge.findBadge(badgeID);
                  badge!.isEarned().then((value) { //only award badge if it has not been earned yet.
                    if (!value) {
                      badge.earn(context);
                    }
                  },);
                }

                //Unlock next challenges:
                List<Future> unlockFutures = [];
                for (var challengeID in Challenge.challenge5.unlocksChallengesIDs) {
                  Challenge challenge = Challenge.findChallenge(challengeID)!;
                  challenge.isUnlocked().then((value) {
                    if (!value) {
                      unlockFutures.add(challenge.unlock());
                    }
                  },);
                }

                //Show toast and move back:
                Future.wait(unlockFutures).then((value) {
                  if (unlockFutures.isNotEmpty) {
                    Fluttertoast.showToast(
                        msg: AppLocalizations.of(context)!
                            .challenges_unlocked.replaceAll(
                            "%1", unlockFutures.length.toString()));
                  }
                },);
              },);
              Navigator.pop(context, "_");
              Navigator.pop(context, "_");
            }
        );
      }
      else {
        return Center(child: RotateDeviceWidget(Orientation.portrait),);
      }
    },);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: stage != C5A1Stage.activity ? AppBar(title: Text(I10N.getI10nString("c5a1_name")!, style: TextStyle(color: Colors.white),),
        backgroundColor: Themes.primaryColorDark,
        iconTheme: const IconThemeData(color: Colors.white),) : null,
      body: FutureBuilder(
        future: future,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return chooseView();
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  Widget chooseView() {
    switch (stage) {
      case C5A1Stage.activity:
        return activityGameView();
      case C5A1Stage.finish:
        return activityFinishView();
      case C5A1Stage.introduction:
        return activityIntroView();
    }
  }

}
