import 'dart:async';
import 'dart:ffi';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:ephyli/controller/activity_manager.dart';
import 'package:ephyli/theme/themes.dart';
import 'package:ephyli/utils/i10n.dart';
import 'package:ephyli/utils/ui_utils.dart';
import 'package:ephyli/widgets/instructions_widget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gap/gap.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:widget_zoom/widget_zoom.dart';

import '../../model/activity.dart';
import '../../model/challenge.dart';
import '../../model/game_badge.dart';
import '../../utils/constants.dart';
import '../../utils/pref_utils.dart';
import '../../widgets/buddy_avatar_widget.dart';
import '../../widgets/chat_bubble.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ActivityC4A3 extends StatefulWidget {
  @override
  _ActivityC4A3State createState() => _ActivityC4A3State();
}

enum C4A3Stage {
  introduction,
  info,
  activity,
  finish
}

class _ActivityC4A3State extends State<ActivityC4A3> {


  C4A3Stage stage = C4A3Stage.introduction;
  final String activityID = "c4a3";
  late Activity activity;
  late SharedPreferences prefs;
  late Future<void> future;

  /**activity data**/
  // List of factors
  final List<String> factors = [
    "Motivation",
    "Beliefs",
    "Sex",
    "Self-efficacy",
    "Family",
    "Friends",
    "Cultural norms",
    "Colleagues",
    "Schools",
    "Community Clubs",
    "Organisations",
    "Workplace",
    "Built environment",
    "Active travel opportunities",
    "Parks and recreation facilities",
    "Natural spaces",
    "Transport systems",
    "Health sector",
    "Education and school sector",
    "Organised sport sector",
    "National",
    "Local"
  ];

  // Variables to map the factors to
  final List<String> variables = [
    "Individual",
    "Global",
    "Interpersonal",
    "Regional and\nnational policy",
    "Environment"
  ];

  // Current index of the factor being displayed
  int currentFactorIndex = 0;

  // Correct mapping for each factor
  final Map<String, String> correctMappings = {
    "Motivation": "Individual",
    "Beliefs": "Individual",
    "Sex": "Individual",
    "Self-efficacy": "Individual",
    "Family": "Interpersonal",
    "Friends": "Interpersonal",
    "Cultural norms": "Interpersonal",
    "Colleagues": "Interpersonal",
    "Schools": "Interpersonal",
    "Community Clubs": "Interpersonal",
    "Organisations": "Interpersonal",
    "Workplace": "Environment",
    "Built environment": "Environment",
    "Active travel opportunities": "Environment",
    "Parks and recreation facilities": "Environment",
    "Natural spaces": "Environment",
    "Transport systems": "Environment",
    "Health sector": "Regional and national policy",
    "Education and school sector": "Regional and national policy",
    "Organised sport sector": "Regional and national policy",
    "National": "Global",
    "Local": "Global"
  };


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
    UIUtils.disableFullscreen();
    UIUtils.portraitOrientation();
    super.dispose();
  }

  Widget activityIntroView() {
    return InstructionsWidget(
        prefs,
        AppLocalizations.of(context)!.c4a3_intro_message,
        AppLocalizations.of(context)!.ready_letsgo,
        () {
          setState(() {
            stage = C4A3Stage.info;
          });
        }
    );
  }

  Widget infoView() {
    return Padding(
      padding: Themes.standardPadding,
      child: Column(
        children: [

          InstructionsWidget(
            prefs,
            AppLocalizations.of(context)!.c4a3_info_message,
            AppLocalizations.of(context)!.next,
            () {
              setState(() {
                stage = C4A3Stage.activity;
              });
            },
            middleWidget: Column(
              children: [
                WidgetZoom(
                  heroAnimationTag: "model-img",
                  zoomWidget: Image.asset(
                    "assets/img/bauman_onion.png",
                    width: MediaQuery.of(context).size.width,
                  ),
                ),

                const Gap(20),

                Text(AppLocalizations.of(context)!.screen_flip_notice)

              ],
            ),
          ),

        ],
      ),
    );
  }

  Widget activityGameView() {
    UIUtils.landscapeOrientation();

    String currentFactor = factors[currentFactorIndex];

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
                top: screenHeight * 0.05,
                child: buildVariableTarget(context, variables[0]), // Top
              ),
              Positioned(
                bottom: screenHeight * 0.05,
                left: screenWidth * 0.25,
                child: buildVariableTarget(context, variables[3]), // Bottom
              ),
              Positioned(
                left: screenWidth * 0.1,
                top: screenHeight * 0.35,
                child: buildVariableTarget(context, variables[1]), // Left
              ),
              Positioned(
                top: screenHeight * 0.35,
                right: screenWidth * 0.1,
                child: buildVariableTarget(context, variables[2]), // Right
              ),
              Positioned(
                bottom: screenHeight * 0.05,
                right: screenWidth * 0.25,
                child: buildVariableTarget(context, variables[4]), // Top-right
              ),

              // Draggable factor in the center
              Positioned(
                top: screenHeight * 0.35,
                child: Draggable<String>(
                  data: currentFactor,
                  feedback: Material(
                    color: Colors.transparent,
                    child: Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        currentFactor,
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ),
                  ),
                  childWhenDragging: Container(
                    padding: EdgeInsets.all(20),
                    color: Colors.grey,
                    child: Text(
                      currentFactor,
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                  child: Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      currentFactor,
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      }
      else {
        return Center(child: Text("Please turn your device."));
      }
    },);

  }

  // Function to check if the factor is correctly dropped onto the variable
  void handleDrop(String factor, String variable) {
    if (correctMappings[factor] == variable) {
      // Correct mapping, move to the next factor
      setState(() {
        currentFactorIndex++;
        if (currentFactorIndex >= factors.length) {
          currentFactorIndex = 0; // Restart after all factors are mapped
        }
      });
    } else {
      // Incorrect mapping, show feedback
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Incorrect! Try again.'),
          duration: Duration(seconds: 1),
        ),
      );
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
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.greenAccent,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.black, width: 2),
          ),
          child: AutoSizeText(
            textAlign: TextAlign.center,
            variable,
          ),
        );
      },
    );
  }

  Widget activityFinishView() {
    UIUtils.portraitOrientation();
    return InstructionsWidget(
      prefs,
      AppLocalizations.of(context)!.c4a1_finish_message, //todo
      AppLocalizations.of(context)!.finish,
      () {
        ActivityManager.completeActivity(activityID).then((value) {
            Navigator.pop(context, "_");
        },);
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    UIUtils.enableFullScreen();
    return Scaffold(
      appBar: AppBar(title: Text(I10N.getI10nString("c4a3_name")!)),
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
      case C4A3Stage.activity:
        return activityGameView();
      case C4A3Stage.finish:
        return activityFinishView();
      case C4A3Stage.introduction:
        return activityIntroView();
      case C4A3Stage.info:
        return infoView();
    }
  }

}
