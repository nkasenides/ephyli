import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:ephyli/controller/activity_manager.dart';
import 'package:ephyli/theme/themes.dart';
import 'package:ephyli/utils/i10n.dart';
import 'package:ephyli/utils/ui_utils.dart';
import 'package:ephyli/widgets/instructions_widget.dart';
import 'package:ephyli/widgets/rotate_device_widget.dart';
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
  activity1_finish
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
    super.dispose();
  }

  Widget activity1IntroView() {
    return InstructionsWidget(
        prefs,
        AppLocalizations.of(context)!.c2a1_intro_message,
        AppLocalizations.of(context)!.lets_start,
        () {
          setState(() {
            stage = C2A1Stage.activity1;
          });
        },
      middleWidget: Text(
        AppLocalizations.of(context)!.screen_flip_notice,
        style: Themes.instructionsTextStyle,
      ),
    );
  }

  Widget activity1View() {

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

    return OrientationBuilder(builder: (context, orientation) {
      if (orientation == Orientation.landscape) {
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
                          width: MediaQuery.of(context).size.width / events.length - 10,
                          height: MediaQuery.of(context).size.height / 2,
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
                        width: MediaQuery.of(context).size.width / events.length - 10,
                        height: MediaQuery.of(context).size.height / 2,
                        margin: EdgeInsets.symmetric(horizontal: 5),
                        child: Center(
                          child: Text(
                            AppLocalizations.of(context)!.dragging,
                            style: TextStyle(color: Colors.grey, fontSize: 14),
                          ),
                        ),
                      ),
                      child: Stack(
                        children: [
                          Card(
                            color: Colors.blueAccent,
                            child: Container(
                              width: MediaQuery.of(context).size.width / events.length - 10,
                              height: MediaQuery.of(context).size.height / 2,
                              padding: const EdgeInsets.all(10),
                              child: Center(
                                child: AutoSizeText(
                                  shuffledEvents[index]["event"]!,
                                  style: const TextStyle(color: Colors.white),
                                  textAlign: TextAlign.center,
                                  overflow: TextOverflow.fade,
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            top: -8,
                            right: -9,
                            child: IconButton(
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      // title: Text(AppLocalizations.of(context)!.event_info),
                                      content: Text(shuffledEvents[index]["event"]!),
                                      actions: [
                                        TextButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            child: Text(AppLocalizations.of(context)!.ok)
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                              icon: const Icon(Icons.open_in_new, color: Colors.white, size: 15,),
                            ),
                          ),
                        ]
                      ),
                    ),
                  );
                }),
              ),
            ),
          ],
        );
      }
      else {
        return Center(child: RotateDeviceWidget(Orientation.landscape));
      }
    },);
  }

  Widget activity1FinishView() {
    return OrientationBuilder(builder: (context, orientation) {
      if (orientation == Orientation.portrait) {
        return InstructionsWidget(
            prefs,
            AppLocalizations.of(context)!.c2a1_finish_message,
            AppLocalizations.of(context)!.finish,
                () {
              //Move back to activities
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
      appBar: AppBar(
        title: Text(I10N.getI10nString("c2a1_name")!, style: const TextStyle(color: Colors.white)),
        backgroundColor: Themes.primaryColorDark,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
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
    }
  }

}
