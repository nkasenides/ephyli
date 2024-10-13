import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:ephyli/theme/themes.dart';
import 'package:ephyli/utils/i10n.dart';
import 'package:ephyli/utils/ui_utils.dart';
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
  final List<String> events = [];
  final List<String> timelineDates = ["1884", "1920", "1933", "1937", "2001", "2017"];
  List<String> shownEvents = [];

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
      events.addAll([
        AppLocalizations.of(context)!.c2a1_term1,
        AppLocalizations.of(context)!.c2a1_term2,
        AppLocalizations.of(context)!.c2a1_term3,
        AppLocalizations.of(context)!.c2a1_term4,
        AppLocalizations.of(context)!.c2a1_term5,
        AppLocalizations.of(context)!.c2a1_term6,
      ]);

      shownEvents.addAll(events);
      shownEvents.shuffle();

      // Initialize all card placements to false (not placed)
      for (int i = 0; i < events.length; i++) {
        matched[i] = false;
        draggedData[i] = '';
      }

    }

    bool isCorrectPlacement(int index, String value) {
      return timelineDates[index] == value;
    }

    return Column(
      children: [

        // Timeline Section (Dates/Years)
        Expanded(
          flex: 1,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(timelineDates.length, (index) {
              return Column(
                children: [
                  Container(
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
                        "${timelineDates[index]}, ${events[index]}",
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
                              draggedData[index] == '' ? timelineDates[index] : "✔️",
                              style: const TextStyle(color: Colors.black, fontSize: 14),
                              textAlign: TextAlign.center,
                            ),
                          );
                        },
                        onWillAccept: (data) {
                          // Accept the drag if the data matches the correct event
                          return data == events[index];
                        },
                        onAccept: (data) {
                          setState(() {
                            matched[index] = true;
                            draggedData[index] = data;
                          });
                        },
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
            children: List.generate(events.length, (index) {
              return matched[index]!
                  ? Container(
                width: MediaQuery.of(context).size.width / events.length - 10,
                height: 60,
                margin: const EdgeInsets.symmetric(horizontal: 2),
                child: const Center(
                  child: Text(
                    'Placed',
                    style: TextStyle(color: Colors.green, fontSize: 16),
                  ),
                ),
              )
                  : Draggable<String>(
                data: events[index],
                feedback: Card(
                  color: Colors.orangeAccent,
                  child: Container(
                    width: MediaQuery.of(context).size.width / events.length - 10,
                    height: 60,
                    padding: const EdgeInsets.all(10),
                    child: Center(
                      child: Text(
                        events[index],
                        style: const TextStyle(color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
                childWhenDragging: Container(
                  width: 120,
                  height: 60,
                  margin: const EdgeInsets.symmetric(horizontal: 2),
                  child: const Center(
                    child: Text(
                      'Dragging...',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                ),
                child: Card(
                  color: Colors.blueAccent,
                  child: Container(
                    width: MediaQuery.of(context).size.width / events.length - 10,
                    height: MediaQuery.of(context).size.height / 2,
                    padding: const EdgeInsets.all(10),
                    child: Center(
                      child: AutoSizeText(
                        events[index],
                        style: const TextStyle(color: Colors.white),
                        textAlign: TextAlign.center,
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
    return Container();
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
