import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:ephyli/controller/activity_manager.dart';
import 'package:ephyli/theme/themes.dart';
import 'package:ephyli/utils/i10n.dart';
import 'package:ephyli/utils/ui_utils.dart';
import 'package:ephyli/widgets/instructions_widget.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../model/activity.dart';
import '../../utils/constants.dart';
import '../../utils/pref_utils.dart';
import '../../widgets/buddy_avatar_widget.dart';
import '../../widgets/chat_bubble.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ActivityC2A1 extends StatefulWidget {
  @override
  _ActivityC2A1State createState() => _ActivityC2A1State();
}

enum C2A1Stage {
  activity1_introduction,
  activity1,
  activity1_finish,
  activity2_introduction,
  activity2,
}

class _ActivityC2A1State extends State<ActivityC2A1> {

  // Card Data: The cards and their correct timeline positions
  List<Map<String, String>> events = [];
  List<Map<String, String>> shuffledEvents = [];

  // Keep track of which cards are correctly matched
  final Map<int, bool> matched = {};
  final Map<int, String> draggedData = {};

  // Track which cards have been correctly placed
  final Map<int, bool> placed = {};

  C2A1Stage stage = C2A1Stage.activity1_introduction;
  final String activityID = "c2a1";
  late Activity activity;
  late SharedPreferences prefs;
  late Future<void> future;

  bool introMessageShown = false;

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

  // Function to shuffle the event cards
  void _shuffleEvents() {
    shuffledEvents = List.from(events);
    shuffledEvents.shuffle();
  }

  @override
  void dispose() {
    UIUtils.portraitOrientation();
    super.dispose();
  }

  Widget activity1IntroView() {
    return Container(
      padding: Themes.standardPadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PersonalizedAvatar(
            buddyAvatars[prefs.getInt(PrefUtils.buddy_selection)!],
            backgroundRadius: 25,
            avatarSize: 35,
          ),
          ChatBubble(
            margin: const EdgeInsets.only(left: 50),
            child: AnimatedTextKit(
              animatedTexts: [
                TypewriterAnimatedText(
                  AppLocalizations.of(context)!.c2a1_intro_message,
                  textStyle: const TextStyle(
                    color: Colors.white,
                  ),
                  speed: const Duration(milliseconds: 50),
                ),
              ],
              displayFullTextOnTap: true,
              isRepeatingAnimation: false,
              onFinished: () {
                setState(() {
                  introMessageShown = true;
                });
              },
              onTap: () {
                setState(() {
                  introMessageShown = true;
                });
              },
            ),
          ),

          const Gap(20),

          introMessageShown ? Text(
            AppLocalizations.of(context)!.screen_flip_notice,
            style: Themes.instructionsTextStyle,
          ) : Container(),

          const Gap(20),

          introMessageShown ? Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButton(
                child: Text(AppLocalizations.of(context)!.lets_start),
                onPressed: () {
                  setState(() {
                    stage = C2A1Stage.activity1;
                  });
                },
              ),
            ],
          ) : Container(),


        ],
      ),
    );
  }

  Widget activity1View() {
    UIUtils.landscapeOrientation();

    //Initialize the events:
    if (events.isEmpty) {
      events = [
        {"event": AppLocalizations.of(context)!.c2a1_term1, "date": "1884"},
        {"event": AppLocalizations.of(context)!.c2a1_term2, "date": "1920"},
        {"event": AppLocalizations.of(context)!.c2a1_term3, "date": "1933"},
        {"event": AppLocalizations.of(context)!.c2a1_term4, "date": "1937"},
        {"event": AppLocalizations.of(context)!.c2a1_term5, "date": "2001"},
        {"event": AppLocalizations.of(context)!.c2a1_term6, "date": "2017"},
      ];

      _shuffleEvents();

      // Initialize all card placements to false (not placed)
      for (int i = 0; i < events.length; i++) {
        matched[i] = false;
        draggedData[i] = '';
      }

    }


    return Column(
      children: [

        // Timeline Section (Dates/Years)
        Expanded(
          flex: 1,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(events.length, (index) {
              return Column(
                children: [
                  Expanded(
                    child: Container(
                      width: MediaQuery.of(context).size.width / events.length - 10,
                      height: 60,
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: matched[index]! ? Colors.green : Colors.blue,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: matched[index]!
                            ? Text(
                          "${events[index]["date"]}, ${events[index]["event"]}",
                          style: const TextStyle(color: Colors.green, fontSize: 14),
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 3,
                        )
                            : DragTarget<String>(
                          builder: (context, candidateData, rejectedData) {
                            return Center(
                              child: Text(
                                overflow: TextOverflow.ellipsis,
                                draggedData[index] == '' ? events[index]["date"]! : "✔️",
                                style: const TextStyle(color: Colors.black, fontSize: 14),
                                textAlign: TextAlign.center,
                              ),
                            );
                          },
                          onWillAccept: (data) {
                            // Accept the drag if the data matches the correct event
                            return data == events[index]["event"];
                          },
                          onAccept: (data) {
                            if (data != events[index]["event"]) {
                              UIUtils.showFeedbackBar(context, false);
                            }

                            setState(() {
                              matched[index] = true;
                              draggedData[index] = data;

                              int itemIndex = -1;
                              for (int i = 0; i < shuffledEvents.length; i++) {
                                var pair = shuffledEvents[i];
                                if (pair["event"] == data) {
                                  itemIndex = i;
                                  break;
                                }
                              }
                              if (itemIndex != -1) {
                                shuffledEvents.removeAt(itemIndex);
                              }

                              //Finish the game if no cards are left:
                              if (shuffledEvents.isEmpty) {
                                UIUtils.portraitOrientation();
                                UIUtils.showFeedbackBar(context, true);
                                ActivityManager.completeActivity(activityID).then((value) {
                                  setState(() {
                                    stage = C2A1Stage.activity1_finish;
                                  });
                                },);
                              }

                            });
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              );
            }),
          ),
        ),
        SizedBox(height: 5),

        // Draggable Cards Section (Event Cards)
        Expanded(
          flex: 3,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(shuffledEvents.length, (index) {
              return Container(
                width: MediaQuery.of(context).size.width / events.length - 10,
                height: MediaQuery.of(context).size.height / 2,
                margin: const EdgeInsets.symmetric(horizontal: 2),
                child: Draggable<String>(
                  data: shuffledEvents[index]["event"]!,
                  feedback: Card(
                    color: Colors.orangeAccent,
                    child: Container(
                      width: 120,
                      height: 60,
                      padding: EdgeInsets.all(10),
                      child: Center(
                        child: Text(
                          shuffledEvents[index]["event"]!,
                          style: TextStyle(color: Colors.white, fontSize: 14),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                  childWhenDragging: Container(
                    width: 120,
                    height: 60,
                    margin: EdgeInsets.symmetric(horizontal: 5),
                    child: Center(
                      child: Text(
                        'Dragging...',
                        style: TextStyle(color: Colors.grey, fontSize: 14),
                      ),
                    ),
                  ),
                  child: Card(
                    color: Colors.blueAccent,
                    child: Container(
                      width: MediaQuery.of(context).size.width / events.length - 10,
                      height: MediaQuery.of(context).size.height / 2,
                      padding: EdgeInsets.all(10),
                      child: Center(
                        child: AutoSizeText(
                          shuffledEvents[index]["event"]!,
                          style: TextStyle(color: Colors.white),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                ),
              );
            }),
          ),
        ),
      ],
    );
  }

  Widget activity1FinishView() {
    return InstructionsWidget(
        prefs,
        AppLocalizations.of(context)!.c2a1_finish_message,
        AppLocalizations.of(context)!.finish,
        () {
          //Move back to activities
          Navigator.pop(context);
        }
    );
  }

  Widget activity2IntroView() {
    return Container();
  }

  Widget activity2view() {
    return Container();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(I10N.getI10nString("c2a1_name")!)),
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
      case C2A1Stage.activity1_introduction:
        return activity1IntroView();
      case C2A1Stage.activity1:
        return activity1View();
      case C2A1Stage.activity1_finish:
        return activity1FinishView();
      case C2A1Stage.activity2_introduction:
      return activity2IntroView();
      case C2A1Stage.activity2:
        return activity2view();
    }
  }

}