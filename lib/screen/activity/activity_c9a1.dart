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
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gap/gap.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:widget_zoom/widget_zoom.dart';

import '../../model/activity.dart';
import '../../model/challenge.dart';
import '../../model/game_badge.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ActivityC9A1 extends StatefulWidget {
  @override
  _ActivityC9A1State createState() => _ActivityC9A1State();
}

enum C9A1Stage {
  introduction,
  activity,
  finish
}

class _ActivityC9A1State extends State<ActivityC9A1> {


  C9A1Stage stage = C9A1Stage.introduction;
  final String activityID = "c9a1";
  late Activity activity;
  late SharedPreferences prefs;
  late Future<void> future;

  /**activity data**/
  // List of factors
  List<String> factors = [];

  List<String> shuffledFactors = [];

  // Variables to map the factors to
  List<String> variables = [];

  // Current index of the factor being displayed
  int currentFactorIndex = 0;

  // Correct mapping for each factor
  Map<String, String> correctMappings = {};


  Future<void> loadData() async {
    prefs = await SharedPreferences.getInstance();
    activity = Activity.activities[activityID]!;
  }

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
        AppLocalizations.of(context)!.c9a1_instructions,
        AppLocalizations.of(context)!.ready_letsgo,
        () {
          setState(() {
            stage = C9A1Stage.activity;
          });
        }
    );
  }

  Widget activityGameView() {

    if (shuffledFactors.isEmpty) {

      factors = !kDebugMode ? [
        AppLocalizations.of(context)!.c9a1_throwing,
        AppLocalizations.of(context)!.c9a1_catching,
        AppLocalizations.of(context)!.c9a1_striking,

        AppLocalizations.of(context)!.c9a1_rough_and_tumble,
        AppLocalizations.of(context)!.c9a1_climbing,
        AppLocalizations.of(context)!.c9a1_running,
        AppLocalizations.of(context)!.c9a1_chasing_games,
        AppLocalizations.of(context)!.c9a1_bikes_and_scooters,
        AppLocalizations.of(context)!.c9a1_pushing_and_pulling,

        AppLocalizations.of(context)!.c9a1_dance,
        AppLocalizations.of(context)!.c9a1_gymnastics,
        AppLocalizations.of(context)!.c9a1_action_rhymes,
        AppLocalizations.of(context)!.c9a1_songs_and_stories,

        AppLocalizations.of(context)!.c9a1_natural_surroundings,
        AppLocalizations.of(context)!.c9a1_rocks_and_tress,
        AppLocalizations.of(context)!.c9a1_challenges,
      ] : [
        "A1",
        "B1",
        "C2"
      ];

      variables = !kDebugMode ? [
        AppLocalizations.of(context)!.c9a1_object_play,
        AppLocalizations.of(context)!.c9a1_exercise_play,
        AppLocalizations.of(context)!.c9a1_expressive_movement,
        AppLocalizations.of(context)!.c9a1_outdoor_play,
      ] : [
        "1",
        "2",
        "3",
        "4",
        "5",
        "6",
      ];

      correctMappings = !kDebugMode ? {

        AppLocalizations.of(context)!.motivation: AppLocalizations.of(context)!.individual,
        AppLocalizations.of(context)!.beliefs: AppLocalizations.of(context)!.individual,
        AppLocalizations.of(context)!.sex: AppLocalizations.of(context)!.individual,
        AppLocalizations.of(context)!.self_efficacy: AppLocalizations.of(context)!.individual,

        AppLocalizations.of(context)!.family: AppLocalizations.of(context)!.social_environment,
        AppLocalizations.of(context)!.friends: AppLocalizations.of(context)!.social_environment,
        AppLocalizations.of(context)!.cultural_norms: AppLocalizations.of(context)!.social_environment,
        AppLocalizations.of(context)!.colleagues: AppLocalizations.of(context)!.social_environment
        ,
        AppLocalizations.of(context)!.schools: AppLocalizations.of(context)!.organizations_and_institutions,
        AppLocalizations.of(context)!.community_clubs: AppLocalizations.of(context)!.organizations_and_institutions,
        AppLocalizations.of(context)!.organizations: AppLocalizations.of(context)!.organizations_and_institutions,
        AppLocalizations.of(context)!.workplace: AppLocalizations.of(context)!.organizations_and_institutions,

        AppLocalizations.of(context)!.built_environment: AppLocalizations.of(context)!.physical_environment,
        AppLocalizations.of(context)!.active_opportunities: AppLocalizations.of(context)!.physical_environment,
        AppLocalizations.of(context)!.parks_recreation: AppLocalizations.of(context)!.physical_environment,
        AppLocalizations.of(context)!.natural_spaces: AppLocalizations.of(context)!.physical_environment,

        AppLocalizations.of(context)!.transport_systems: AppLocalizations.of(context)!.regional_or_national_policy,
        AppLocalizations.of(context)!.health_sector: AppLocalizations.of(context)!.regional_or_national_policy,
        AppLocalizations.of(context)!.education_school: AppLocalizations.of(context)!.regional_or_national_policy,
        AppLocalizations.of(context)!.organized_sport: AppLocalizations.of(context)!.regional_or_national_policy,

        AppLocalizations.of(context)!.national: AppLocalizations.of(context)!.culture,
        AppLocalizations.of(context)!.local: AppLocalizations.of(context)!.culture,
      } : {
        "A1": "1",
        "B1": "1",
        "C2": "2",
      };

      shuffledFactors = List.from(factors);
      shuffledFactors.shuffle();
    }

    debugPrint(shuffledFactors.toString());

    if (currentFactorIndex > shuffledFactors.length - 1) {
      return Container();
    }

    String currentFactor = shuffledFactors[currentFactorIndex];

    return OrientationBuilder(builder: (context, orientation) {
      if (orientation == Orientation.landscape) {
        final screenWidth = MediaQuery.of(context).size.width;
        final screenHeight = MediaQuery.of(context).size.height;
        return Center(
          child: Stack(
            alignment: Alignment.center,
            children: [
              // Star shape layout for variables
              Positioned(
                top: screenHeight * 0.2,
                left: screenWidth * 0.1,
                child: buildVariableTarget(context, variables[0]), // Top left
              ),
              Positioned(
                top: screenHeight * 0.1,
                child: buildVariableTarget(context, variables[1]), // Top
              ),
              Positioned(
                right: screenWidth * 0.1,
                top: screenHeight * 0.2,
                child: buildVariableTarget(context, variables[2]), // Top right
              ),
              Positioned(
                bottom: screenHeight * 0.2,
                left: screenWidth * 0.1,
                child: buildVariableTarget(context, variables[3]), // Bottom left
              ),
              Positioned(
                bottom: screenHeight * 0.05,
                child: buildVariableTarget(context, variables[5]), // Bottom
              ),
              Positioned(
                right: screenWidth * 0.1,
                bottom: screenHeight * 0.2,
                child: buildVariableTarget(context, variables[4]), // Bottom right
              ),

              // Draggable factor in the center
              Positioned(
                top: screenHeight * 0.35,
                child: Draggable<String>(
                  data: currentFactor,
                  feedback: Material(
                    color: Colors.transparent,
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Themes.primaryColor,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: Colors.black,
                        ),
                      ),
                      child: Text(
                        currentFactor,
                        style: const TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ),
                  ),
                  childWhenDragging: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      border: Border.all(
                        color: Colors.black,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      currentFactor,
                      style: const TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Themes.primaryColor,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: Colors.black,
                      )
                    ),
                    child: Text(
                      currentFactor,
                      style: const TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      }
      else {
        return Center(child: RotateDeviceWidget(Orientation.landscape));
      }
    },);

  }

  // Function to check if the factor is correctly dropped onto the variable
  void handleDrop(String factor, String variable) {
    debugPrint("-> ${correctMappings[factor]} - $variable");
    if (correctMappings[factor] == variable) {
      // Correct mapping, move to the next factor
      UIUtils.showFeedbackBar(context, true);
      setState(() {
        currentFactorIndex++;
        if (currentFactorIndex >= factors.length) {
          showDialog(context: context, builder: (context) {
            return AlertDialog(
              title: Text(AppLocalizations.of(context)!.well_done),
              actions: [
                TextButton(
                  child: Text(AppLocalizations.of(context)!.proceed),
                  onPressed: () {
                    Navigator.pop(context);
                    setState(() {
                      stage = C9A1Stage.finish;
                    });
                  },
                ),
              ],
            );
          }, barrierDismissible: false);
        }
      });
    } else {
      // Incorrect mapping, show feedback
      UIUtils.showFeedbackBar(context, false);
    }
  }

  // Helper function to build a variable as a drag target
  Widget buildVariableTarget(BuildContext context, String variable) {
    return DragTarget<String>(
      onAccept: (data) {
        handleDrop(data, variable); // Check if factor matches the variable
      },
      builder: (context, candidateData, rejectedData) {
        return Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Themes.primaryColorDark,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.black, width: 2),
          ),
          child: AutoSizeText(
            style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
            textAlign: TextAlign.center,
            variable,
          ),
        );
      },
    );
  }

  Widget activityFinishView() {
    return OrientationBuilder(builder: (context, orientation) {
      if (orientation == Orientation.portrait) {
        return InstructionsWidget(
            prefs,
            AppLocalizations.of(context)!.c9a1_finish_message,
            AppLocalizations.of(context)!.finish,
                () {
              ActivityManager.completeActivity(activityID).then((value) {
                Navigator.pop(context, "_");
              },);
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
      appBar: AppBar(title: Text(I10N.getI10nString("c9a1_name")!, style: TextStyle(color: Colors.white),),
        backgroundColor: Themes.primaryColorDark,
        iconTheme: const IconThemeData(color: Colors.white),),
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
      case C9A1Stage.activity:
        return activityGameView();
      case C9A1Stage.finish:
        return activityFinishView();
      case C9A1Stage.introduction:
        return activityIntroView();
    }
  }

}
