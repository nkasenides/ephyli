import 'dart:async';

import 'package:ephyli/controller/activity_manager.dart';
import 'package:ephyli/theme/themes.dart';
import 'package:ephyli/utils/i10n.dart';
import 'package:ephyli/utils/ui_utils.dart';
import 'package:ephyli/widgets/instructions_widget.dart';
import 'package:ephyli/widgets/rotate_device_widget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../model/activity.dart';
import '../../model/challenge.dart';
import '../../model/game_badge.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../widgets/lesson_box.dart';

class ActivityC10A2 extends StatefulWidget {
  @override
  _ActivityC10A2State createState() => _ActivityC10A2State();
}

enum C19A2Stage {
  introduction,
  activity,
  finish
}

class _ActivityC10A2State extends State<ActivityC10A2> {


  C19A2Stage stage = C19A2Stage.introduction;
  final String activityID = "c10a2";
  late Activity activity;
  late SharedPreferences prefs;
  late Future<void> future;

  /**activity data**/

  // Teaching styles at the top
  List<String> teachingStyles = [];

  // List of lessons with the correct teaching style
  List<Map<String, String>> lessons = [];

  int currentLessonIndex = 0; // Track the current lesson

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
        AppLocalizations.of(context)!.c10a2_instructions,
        AppLocalizations.of(context)!.ready_letsgo,
        () {
          setState(() {
            stage = C19A2Stage.activity;
          });
        }
    );
  }

  Widget activityGameView() {

    if (teachingStyles.isEmpty) {
      teachingStyles = ["Command", "Guided Discovery", "Self-Teaching"];
    }

    if (lessons.isEmpty) {
      lessons = kDebugMode ? [
        {
          "text": "Command1",
          "style": "Command"
        },
        {
          "text": "Selfteaching1",
          "style": "Self-Teaching"
        },
      ] : [
        // Command Style Lessons
        {
          "text": "The lesson aims to improve basic motor skills. Students must overcome an obstacle course using their basic motor skills (rolling, jumping, running, crawling). The teacher demonstrates how to overcome each obstacle. The students start the course at the teacher's command, imitating the teacher's movement.",
          "style": "Command"
        },
        {
          "text": "The lesson aims to improve balance skills. The teacher demonstrates three yoga poses at a time (Balancing Table, Dancer, and Half Moon). Students must maintain a position for 15 seconds. The students change position at the teacher's command.",
          "style": "Command"
        },
        {
          "text": "The lesson aims to improve knowledge of one's own body. The teacher tells a story about bears who walk around in the forest and perform certain actions (eating, washing, rolling around). Students must impersonate the bears. The teacher chooses when the bears are itchy and where they have to scratch.",
          "style": "Command"
        },
        {
          "text": "The lesson aims to improve volleyball serving. The teacher demonstrates the volleyball services (basic underhand service, basic overhand serve, and jump serve). The teacher plans two exercises for each service, explaining that students have to start with the basic underhand service, then the basic overhand serve, and at the end jump serve.",
          "style": "Command"
        },

        // Guided Discovery Style Lessons
        {
          "text": "The lesson aims to improve basic motor skills. Students have to overcome an obstacle course using their basic motor skills. The teacher engages students in talk to help them reflect on which basic motor skills they can use to overcome the obstacles, asking questions to stimulate different strategies.",
          "style": "Guided Discovery"
        },
        {
          "text": "The lesson aims to improve balance skills. The teacher engages students in talk to help them reflect on the effects of yoga practice on balance, supporting pose development by asking questions. Correct thinking and strategies are rewarded.",
          "style": "Guided Discovery"
        },
        {
          "text": "The lesson aims to improve knowledge of one's own body. Students develop a story about bears in the forest performing certain actions. The teacher asks questions to guide students in creating a personalized story, inviting activities to improve body knowledge.",
          "style": "Guided Discovery"
        },
        {
          "text": "The lesson aims to improve volleyball serving. The teacher engages students in talk to help them focus on sensations during service execution. Students identify the most comfortable service and adapt others to make them more comfortable. Correct thinking and strategies are rewarded.",
          "style": "Guided Discovery"
        },

        // Self-Teaching Style Lessons
        {
          "text": "The lesson aims to improve basic motor skills. The teacher provides information on basic motor skills, and students develop games to improve these skills.",
          "style": "Self-Teaching"
        },
        {
          "text": "The lesson aims to improve balance skills. The teacher provides information on the effects of yoga practice on balance, and students choose some yoga exercises to practice together in class.",
          "style": "Self-Teaching"
        },
        {
          "text": "The lesson aims to improve knowledge of one's own body. Students develop a story about bears in the forest performing actions, creating strategies to focus movements on specific body parts. The teacher provides guidance when needed.",
          "style": "Self-Teaching"
        },
        {
          "text": "The lesson aims to improve volleyball serving. The teacher provides information on volleyball services, and students work individually or in groups to create exercises to train each service.",
          "style": "Self-Teaching"
        },
      ];
      lessons.shuffle();
    }

    return OrientationBuilder(
      builder: (context, orientation) {
        if (orientation == Orientation.portrait) {
          return Center(child: RotateDeviceWidget(Orientation.landscape));
        }
        return Padding(
          padding: Themes.standardPadding,
          child: Column(
            children: [
              // Teaching Styles as drop targets
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: teachingStyles.map((style) {
                  return buildTeachingStyleBox(style);
                }).toList(),
              ),

              const SizedBox(height: 40),

              // Current Lesson to Drag
              Expanded(
                child: Center(
                  child: Draggable<String>(
                    data: lessons[currentLessonIndex]["style"],
                    feedback: LessonBox(
                      lessonText: lessons[currentLessonIndex]["text"]!,
                      isDragging: true,
                    ),
                    childWhenDragging: Opacity(
                      opacity: 0.3,
                      child: LessonBox(
                        lessonText: lessons[currentLessonIndex]["text"]!,
                      ),
                    ),
                    child: LessonBox(
                      lessonText: lessons[currentLessonIndex]["text"]!,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  // Build a box for each teaching style
  Widget buildTeachingStyleBox(String style) {
    return DragTarget<String>(
      onWillAccept: (data) => true,
      onAccept: (data) {
        if (data == style) {
          if (currentLessonIndex == lessons.length - 1) {
            setState(() {
              stage = C19A2Stage.finish;
            });
          }
          else {
            setState(() {
              currentLessonIndex++;
            });
            UIUtils.showFeedbackBar(context, true);
          }
        } else {
          UIUtils.showFeedbackBar(context, false);
        }
      },
      builder: (context, candidateData, rejectedData) {
        return Container(
          width: MediaQuery.of(context).size.width * 0.25,
          height: 100,
          decoration: BoxDecoration(
            color: Colors.blue[100],
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.blue, width: 2),
          ),
          alignment: Alignment.center,
          child: Text(
            style,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        );
      },
    );
  }

  Widget activityFinishView() {
    return InstructionsWidget(
      prefs,
      AppLocalizations.of(context)!.c10a2_finish_message,
      AppLocalizations.of(context)!.finish,
      () {
        ActivityManager.completeActivity(activityID).then((value) {
          //Find all badges related to this activity and award them:
          for (var badgeID in Challenge.challenge10.badgeIDs) {
            var badge = GameBadge.findBadge(badgeID);
            badge!.isEarned().then((value) { //only award badge if it has not been earned yet.
              if (!value) {
                badge.earn(context);
              }
            },);
          }

          //Unlock next challenges:
          List<Future> unlockFutures = [];
          for (var challengeID in Challenge.challenge10.unlocksChallengesIDs) {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(I10N.getI10nString("c10a2_name")!, style: const TextStyle(color: Colors.white),),
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
      case C19A2Stage.activity:
        return activityGameView();
      case C19A2Stage.finish:
        return activityFinishView();
      case C19A2Stage.introduction:
        return activityIntroView();
    }
  }

}
