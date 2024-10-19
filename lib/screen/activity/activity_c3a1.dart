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

import '../../model/activity.dart';
import '../../model/challenge.dart';
import '../../model/game_badge.dart';
import '../../utils/constants.dart';
import '../../utils/pref_utils.dart';
import '../../widgets/buddy_avatar_widget.dart';
import '../../widgets/chat_bubble.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ActivityC3A1 extends StatefulWidget {
  @override
  _ActivityC3A1State createState() => _ActivityC3A1State();
}

enum C3A1Stage {
  introduction,
  activity,
  finish
}

class _ActivityC3A1State extends State<ActivityC3A1> {


  C3A1Stage stage = C3A1Stage.introduction;
  final String activityID = "c3a1";
  late Activity activity;
  late SharedPreferences prefs;
  late Future<void> future;

  /**activity data**/
// Correct order of card descriptions
  List<String> correctOrder = [];

  // Cards list, which will be shuffled
  List<String> shuffledCards = [];

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
    super.dispose();
  }

  Widget activityIntroView() {
    return InstructionsWidget(
        prefs,
        AppLocalizations.of(context)!.c3a1_intro_message,
        AppLocalizations.of(context)!.lets_start,
        () {
          setState(() {
            stage = C3A1Stage.activity;
          });
        }
    );
  }

  Widget activityGameView() {

    if (correctOrder.isEmpty) {
      correctOrder = kDebugMode ? [
        "A",
        "B",
        "C",
        "D"
      ] : [
        AppLocalizations.of(context)!.c3a1_term1,
        AppLocalizations.of(context)!.c3a1_term2,
        AppLocalizations.of(context)!.c3a1_term3,
        AppLocalizations.of(context)!.c3a1_term4,
        AppLocalizations.of(context)!.c3a1_term5,
        AppLocalizations.of(context)!.c3a1_term6,
        AppLocalizations.of(context)!.c3a1_term7,
        AppLocalizations.of(context)!.c3a1_term8,
        AppLocalizations.of(context)!.c3a1_term9,
        AppLocalizations.of(context)!.c3a1_term10,
        AppLocalizations.of(context)!.c3a1_term11,
        AppLocalizations.of(context)!.c3a1_term12,
      ];
      _shuffleCards();
    }

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [

          Text(AppLocalizations.of(context)!.c3a1_activity_message),
          const SizedBox(height: 20),

          // Draggable and reorderable card list
          Expanded(
            child: ReorderableListView.builder(
              itemCount: shuffledCards.length,
              onReorder: (oldIndex, newIndex) {
                if (newIndex > oldIndex) {
                  newIndex -= 1;
                }
                _swapCards(oldIndex, newIndex);
              },
              itemBuilder: (context, index) {
                return Card(
                  key: ValueKey(shuffledCards[index]),
                  color: Themes.primaryColor,  // No background during drag
                  child: ListTile(
                    title: Text(
                      shuffledCards[index],
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white
                      ),
                    ),
                  ),
                );
              },
            ),
          ),

          ElevatedButton(
            child: Text(AppLocalizations.of(context)!.check_solution),
            onPressed: () {
              if (_isOrderCorrect()) {
                _showSuccessMessage();
              }
              else {
                _showFailMessage();
              }
            },
          ),

        ],
      ),
    );
  }

  Widget activityFinishView() {
    return InstructionsWidget(
      prefs,
      AppLocalizations.of(context)!.c3a1_finish_message,
      AppLocalizations.of(context)!.finish,
      () {
        ActivityManager.completeActivity(activityID).then((value) async {

          //Find all badges related to this activity and award them:
          for (var badgeID in Challenge.challenge3.badgeIDs) {
            var badge = GameBadge.findBadge(badgeID);
            badge!.isEarned().then((value) { //only award badge if it has not been earned yet.
              if (!value) {
                badge.earn(context);
              }
            },);
          }

          //Unlock next challenges:
          List<Future> unlockFutures = [];
          for (var challengeID in Challenge.challenge3.unlocksChallengesIDs) {
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
            Navigator.pop(context, "_");
            Navigator.pop(context, "_");
          },);

        },);
      }
    );
  }

  // Shuffle the cards and initialize current order
  void _shuffleCards() {
    shuffledCards = List.from(correctOrder)..shuffle();
  }

  // Check if the user sorted the cards correctly
  bool _isOrderCorrect() {
    for (int i = 0; i < correctOrder.length; i++) {
      if (shuffledCards[i] != correctOrder[i]) {
        return false;
      }
    }
    return true;
  }

  // Swap two cards in the list
  void _swapCards(int oldIndex, int newIndex) {
    setState(() {
      final temp = shuffledCards[oldIndex];
      shuffledCards.removeAt(oldIndex);
      shuffledCards.insert(newIndex, temp);
    });
  }

  // Display success message
  void _showSuccessMessage() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(AppLocalizations.of(context)!.well_done),
          content: Text(AppLocalizations.of(context)!.c3a1_success),
          actions: <Widget>[
            TextButton(
              child: Text(AppLocalizations.of(context)!.proceed),
              onPressed: () {
                Navigator.pop(context);
                setState(() {
                  stage = C3A1Stage.finish;
                });
              },
            ),
          ],
        );
      },
    );
  }

  // Display success message
  void _showFailMessage() {

    var failCount = 0;
    for (int i = 0; i < correctOrder.length; i++) {
      if (correctOrder[i] != shuffledCards[i]) {
        failCount++;
      }
    }

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(AppLocalizations.of(context)!.try_again),
          content: Text(AppLocalizations.of(context)!.c3a1_fail(failCount)),
          actions: <Widget>[
            TextButton(
              child: Text(AppLocalizations.of(context)!.try_again),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    UIUtils.enableFullScreen();
    return Scaffold(
      appBar: AppBar(title: Text(I10N.getI10nString("c3a1_name")!)),
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
      case C3A1Stage.introduction:
        return activityIntroView();
      case C3A1Stage.activity:
        return activityGameView();
      case C3A1Stage.finish:
        return activityFinishView();
    }
  }

}
