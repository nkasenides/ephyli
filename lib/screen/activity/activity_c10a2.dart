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
      teachingStyles = [
        AppLocalizations.of(context)!.command,
        AppLocalizations.of(context)!.guided_discovery,
        AppLocalizations.of(context)!.self_teaching
      ];
    }

    if (lessons.isEmpty) {
      lessons = kDebugMode ? [
        {
          "text": "Command1",
          "style": AppLocalizations.of(context)!.command
        },
        {
          "text": "Selfteaching1",
          "style": AppLocalizations.of(context)!.self_teaching
        },
      ] : [
        // Command Style Lessons
        {
          "text": AppLocalizations.of(context)!.command_lesson_1,
          "style": AppLocalizations.of(context)!.command
        },
        {
          "text": AppLocalizations.of(context)!.command_lesson_2,
          "style": AppLocalizations.of(context)!.command
        },
        {
          "text": AppLocalizations.of(context)!.command_lesson_3,
          "style": AppLocalizations.of(context)!.command
        },
        {
          "text": AppLocalizations.of(context)!.command_lesson_4,
          "style": AppLocalizations.of(context)!.command
        },

        // Guided Discovery Style Lessons
        {
          "text": AppLocalizations.of(context)!.discovery_lesson_1,
          "style": AppLocalizations.of(context)!.guided_discovery
        },
        {
          "text": AppLocalizations.of(context)!.discovery_lesson_2,
          "style": AppLocalizations.of(context)!.guided_discovery
        },
        {
          "text": AppLocalizations.of(context)!.discovery_lesson_3,
          "style": AppLocalizations.of(context)!.guided_discovery
        },
        {
          "text": AppLocalizations.of(context)!.discovery_lesson_4,
          "style": AppLocalizations.of(context)!.guided_discovery
        },

        // Self-Teaching Style Lessons
        {
          "text": AppLocalizations.of(context)!.self_teaching_lesson_1,
          "style": AppLocalizations.of(context)!.self_teaching
        },
        {
          "text": AppLocalizations.of(context)!.self_teaching_lesson_2,
          "style": AppLocalizations.of(context)!.self_teaching
        },
        {
          "text": AppLocalizations.of(context)!.self_teaching_lesson_3,
          "style": AppLocalizations.of(context)!.self_teaching
        },
        {
          "text": AppLocalizations.of(context)!.self_teaching_lesson_4,
          "style": AppLocalizations.of(context)!.self_teaching
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
    return OrientationBuilder(builder: (context, orientation) {
      if (orientation == Orientation.portrait) {
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
      else {
        return Center(child: RotateDeviceWidget(Orientation.portrait),);
      }
    },);
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
