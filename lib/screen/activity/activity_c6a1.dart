import 'dart:async';
import 'dart:math';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:ephyli/controller/activity_manager.dart';
import 'package:ephyli/fragments/fragments.dart';
import 'package:ephyli/theme/themes.dart';
import 'package:ephyli/utils/i10n.dart';
import 'package:ephyli/utils/ui_utils.dart';
import 'package:ephyli/widgets/text_bubble.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttermoji/fluttermojiCircleAvatar.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gap/gap.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:widget_zoom/widget_zoom.dart';
import '../../model/activity.dart';
import '../../model/challenge.dart';
import '../../model/game_badge.dart';
import '../../model/match_game/matching_pair.dart';
import '../../model/match_game/matching_pairs.dart';
import '../../model/match_game/term.dart';
import '../../utils/constants.dart';
import '../../utils/pref_utils.dart';
import '../../widgets/buddy_avatar_widget.dart';
import '../../widgets/chat_bubble.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../widgets/instructions_widget.dart';

class ActivityC6A1 extends StatefulWidget {
  const ActivityC6A1({super.key});

  @override
  State<ActivityC6A1> createState() => _ActivityC6A1State();
}

enum C6A1Stage {
  intro,
  activity,
  finish
}

class _ActivityC6A1State extends State<ActivityC6A1>
    with SingleTickerProviderStateMixin {
  final String activityID = "c6a1";

  C6A1Stage stage = C6A1Stage.intro;

  List<String> _termsNotShown = []; //List of IDs
  List<String> _termsCompleted = []; //List of IDs
  List<String> _termsShown = []; //List of IDs

  List<String> _termTexts = []; //UI Items
  List<String> _termDescriptions = []; //UI Items

  MatchingPairs matchingPairs = MatchingPairs();

  int score = 0;
  bool step1MessageShown = false;

  late Future future;
  late SharedPreferences prefs;
  List<Term> terms = [];

  int mistakeCounter = 0;

  late AnimationController _controller;
  late Animation<Offset> _animation;
  bool handVisible = true;

  @override
  void initState() {
    future = loadData();

    // Initialize the AnimationController
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    // Start the animation after 2 seconds
    Future.delayed(const Duration(seconds: 2)).then(
      (value) {
        //TODO - Controller causes error when directly moving back from activity.
        _controller.forward().then(
          (value) {
            setState(() {
              handVisible = false;
            });
          },
        );
      },
    );

    super.initState();
  }

  @override
  void dispose() {
    _controller.stop();
    _controller.dispose();
    super.dispose();
  }

  //Finds a term by its ID
  Term? getTermByID(String id) {
    for (Term t in terms) {
      if (t.id == id) {
        return t;
      }
    }
    return null;
  }

  //Finds the ID of a term.
  String? getIDByTerm(String term) {
    for (Term t in terms) {
      if (t.text == term) {
        return t.id;
      }
    }
    return null;
  }

  //Check if there is a match between the received word and the definition matched.
  bool isMatch(String receivedWord, String definition) {
    for (Term term in terms) {
      if (term.text == receivedWord && term.correctDescription == definition) {
        return true;
      }
    }
    return false;
  }

  void _findMatchingPairs() {
    //Initialize matching pairs object, if not initialized:
    matchingPairs = MatchingPairs();

    List<String> titles = [];
    List<String> descriptions = [];

    //Find correct pair:
    int randomIndex = Random().nextInt(_termsNotShown.length);
    String correctTermID = _termsNotShown[randomIndex];
    Term? correctTerm = getTermByID(correctTermID);
    MatchingPair correctPair = MatchingPair(
        correctTerm!.id, correctTerm.text, correctTerm.correctDescription);
    matchingPairs.correctPair = correctPair;

    _termsNotShown.remove(correctTerm.id);
    _termsShown.add(correctTerm.id);

    titles.add(correctTerm.text);
    descriptions.add(correctTerm.correctDescription);

    //Find two other terms (extras):
    List<String> otherTermIDs = [];
    for (Term t in terms) {
      if (t.id != correctTermID) {
        otherTermIDs.add(t.id);
      }
    }
    otherTermIDs.shuffle();

    String extraTermID1 = otherTermIDs[0];
    String extraTermID2 = otherTermIDs[1];

    Term extraTerm1 = getTermByID(extraTermID1)!;
    Term extraTerm2 = getTermByID(extraTermID2)!;

    titles.add(extraTerm1.text);
    titles.add(extraTerm2.text);

    //Add terms as shown:
    _termsNotShown.remove(extraTermID1);
    _termsNotShown.remove(extraTermID2);
    _termsShown.add(extraTermID1);
    _termsShown.add(extraTermID2);

    //Find wrong pairs:
    List<String> allWrongDescriptions = [];
    for (Term t in terms) {
      allWrongDescriptions.add(t.wrongDescription);
      if (t.id != correctTerm.id &&
          t.id != extraTermID1 &&
          t.id != extraTermID2) {
        allWrongDescriptions.add(t.correctDescription);
      }
    }

    //Find wrong pairs:
    int randomWrongIndex1 = Random().nextInt(allWrongDescriptions.length);
    int randomWrongIndex2 = Random().nextInt(allWrongDescriptions.length);

    //Make sure they are not the same:
    while (randomWrongIndex2 == randomWrongIndex1) {
      randomWrongIndex2 = Random().nextInt(allWrongDescriptions.length);
    }
    descriptions.add(allWrongDescriptions[randomWrongIndex1]);
    descriptions.add(allWrongDescriptions[randomWrongIndex2]);

    //Create the matched pairs:
    matchingPairs.wrongPair1 = MatchingPair(
        extraTermID1, extraTerm1.text, allWrongDescriptions[randomWrongIndex1]);
    matchingPairs.wrongPair2 = MatchingPair(
        extraTermID2, extraTerm2.text, allWrongDescriptions[randomWrongIndex2]);

    //Randomize the lists and set for UI:
    titles.shuffle();
    descriptions.shuffle();
    _termTexts = titles;
    _termDescriptions = descriptions;

    debugPrint(_termTexts.toString());

    debugPrint(_termDescriptions.toString());
  }

  Future<void> loadData() async {
    // final String filename = "assets/activity_data/activity1/c6a1_terms.json";
    const String filename = "assets/activity_data/activity1/test_terms.json";
    await Future.wait([
      Term.readTermsFromJSONFile(filename).then(
        (value) {
          terms = value;
          //Add all terms as not completed:
          for (Term t in terms) {
            _termsNotShown.add(t.id);
          }
          _findMatchingPairs();
        },
      ),
      SharedPreferences.getInstance().then(
        (value) => prefs = value,
      ),
    ]);
  }

  //Intro
  Widget instructionsView() {
    return InstructionsWidget(
      prefs,
      AppLocalizations.of(context)!.c6a1_welcome,
      AppLocalizations.of(context)!.lets_start,
      () {
        setState(() {
          stage = C6A1Stage.activity;
        });
      }
    );
  }

  //Step finished view
  Widget finishView() {
    return InstructionsWidget(
        prefs,
        AppLocalizations.of(context)!.c6a1_congrats,
        AppLocalizations.of(context)!.finish,
            () {
          setState(() {
            ActivityManager.completeActivity(activityID).then((value) {
              //Find all badges related to this activity and award them:
              for (var badgeID in Challenge.challenge6.badgeIDs) {
                var badge = GameBadge.findBadge(badgeID);
                badge!.isEarned().then((value) { //only award badge if it has not been earned yet.
                  if (!value) {
                    badge.earn(context);
                  }
                },);
              }

              //Unlock next challenges:
              List<Future> unlockFutures = [];
              for (var challengeID in Challenge.challenge6.unlocksChallengesIDs) {
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
          });
        }
    );
  }

  //Matching Activity
  Widget puzzleView() {
    // Define the Tween for the hand's movement between two positions
    _animation = Tween<Offset>(
      begin: Offset(25, MediaQuery.of(context).size.height / 2 - 100),
      end: Offset(MediaQuery.of(context).size.width * 2 / 3, MediaQuery.of(context).size.height / 2 - 100),
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));

    return Stack(
      children: [
        //Background view (game):
        Padding(
          padding: Themes.standardPadding,
          child: Column(
            children: [

              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Draggable words (Keys)
                    Expanded(
                      flex: 3,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: _termTexts.map((word) {
                          return Container(
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              color: Themes.primaryColor,
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: Themes.secondaryColor),
                            ),
                            margin: const EdgeInsets.symmetric(vertical: 8),
                            child: Draggable<String>(
                              data: word,
                              feedback: Material(
                                color: Colors.transparent,
                                child: Container(
                                  padding: const EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                    color: Themes.primaryColor,
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(color: Themes.secondaryColor),
                                  ),
                                  child: Text(
                                    word,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                              ),
                              childWhenDragging: Opacity(
                                opacity: 0.5,
                                child: Text(word),
                              ),
                              child: Text(
                                word,
                                textAlign: TextAlign.center,
                                style: const TextStyle(fontSize: 18, color: Colors.white),
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ),

                    const Gap(20),

                    // Drag Targets (Values)
                    Expanded(
                      flex: 7,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: _termDescriptions.map((definition) {
                          return DragTarget<String>(
                            onAccept: (receivedWord) {
                              if (isMatch(receivedWord, definition)) {
                                setState(() {
                                  score += 100;
                                  UIUtils.showFeedbackBar(context, true);

                                  //Move the term to completed from shown:
                                  _termsCompleted.add(getIDByTerm(receivedWord)!);
                                  _termsShown.remove(getIDByTerm(receivedWord));

                                  //Move the other terms from shown back to not shown:
                                  _termsShown
                                      .remove(matchingPairs.wrongPair1!.id);
                                  _termsShown
                                      .remove(matchingPairs.wrongPair2!.id);

                                  if (!_termsCompleted
                                      .contains(matchingPairs.wrongPair1!.id)) {
                                    _termsNotShown
                                        .add(matchingPairs.wrongPair1!.id);
                                  }

                                  if (!_termsCompleted
                                      .contains(matchingPairs.wrongPair2!.id)) {
                                    _termsNotShown
                                        .add(matchingPairs.wrongPair2!.id);
                                  }

                                  debugPrint("Not shown: $_termsNotShown");
                                  debugPrint("Shown: $_termsShown");
                                  debugPrint("Completed: $_termsCompleted");

                                  if (_termsNotShown.isEmpty) {
                                    setState(() {
                                      stage = C6A1Stage.finish;
                                    });
                                  } else {
                                    _findMatchingPairs();
                                  }
                                });
                              } else {
                                setState(() {
                                  score -= 100;
                                  UIUtils.showFeedbackBar(context, false);

                                  mistakeCounter++;
                                  if (mistakeCounter >= 5) {
                                    showDialog(
                                        context: context,
                                        builder: (context) {
                                          return AlertDialog(
                                            title: Text(
                                                AppLocalizations.of(context)!
                                                    .gameOver),
                                            content: Text(
                                                AppLocalizations.of(context)!
                                                    .c1a1_5mistakesReset),
                                            actions: [
                                              TextButton(
                                                onPressed: () {
                                                  resetGame();
                                                  Navigator.pop(context);
                                                },
                                                child: Text(
                                                    AppLocalizations.of(context)!
                                                        .ok),
                                              )
                                            ],
                                          );
                                        },
                                        barrierDismissible: false);
                                  }
                                });
                              }
                            },
                            builder: (context, candidateData, rejectedData) {
                              return Container(
                                padding: const EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  border:
                                      Border.all(color: Themes.primaryColor),
                                ),
                                margin: EdgeInsets.symmetric(vertical: 8),
                                child: SizedBox(
                                  width: 500,
                                  child: Text(
                                    definition,
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontStyle: FontStyle.italic,
                                      color: Colors.blueGrey,
                                    ),
                                  ),
                                ),
                              );
                            },
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                ),
              ),

            ],
          ),
        ),

        //Hand animations:
        Visibility(
          visible: handVisible,
          child: AnimatedBuilder(
            animation: _animation,
            builder: (context, child) {
              return Positioned(
                left: _animation.value.dx,
                top: _animation.value.dy,
                child: Icon(
                  Icons.back_hand,
                  size: 50,
                  color: Colors.red.shade900,
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            //If no terms completed, and score = 0, reset without confirm:
            if (score == 0 && _termsCompleted.isEmpty) {
              Navigator.pop(context);
            }
            //Otherwise game is in progress, so ask for confirm:
            else {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                        title: Text(AppLocalizations.of(context)!.areYouSure),
                        content: Text(AppLocalizations.of(context)!
                            .resetLoseProgressMessage),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                              Navigator.pop(context);
                            },
                            child:
                                Text(AppLocalizations.of(context)!.resetGame),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text(AppLocalizations.of(context)!.cancel),
                          ),
                        ]);
                  });
            }
          },
          icon: const Icon(Icons.arrow_back),
        ),
        backgroundColor: Themes.primaryColorDark,
        iconTheme: const IconThemeData(color: Colors.white),
        title: Text(
          I10N.getI10nString(Activity.activities[activityID]!.nameRes)!,
          style: const TextStyle(color: Colors.white),
        ),
        //TODO - Get name out of resource
        actions: stage == C6A1Stage.activity
            ? [
                OutlinedButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                              title: Text(
                                  AppLocalizations.of(context)!.areYouSure),
                              content: Text(AppLocalizations.of(context)!
                                  .resetLoseProgressMessage),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                    setState(() {
                                      resetGame();
                                    });
                                  },
                                  child: Text(
                                      AppLocalizations.of(context)!.resetGame),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text(
                                      AppLocalizations.of(context)!.cancel),
                                ),
                              ]);
                        });

                    setState(() {
                      score = 0; // Reset score
                      setState(() {
                        _findMatchingPairs();
                      });
                    });
                  },
                  child: Text(
                    AppLocalizations.of(context)!.resetGame,
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
                const Gap(20),
              ]
            : [],
      ),
      body: FutureBuilder(
          future: future,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              // debugPrint(terms.toString());

              return Padding(
                  padding: const EdgeInsets.all(2), child: getChildView());
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          }),
    );
  }

  resetGame() {
    score = 0;
    mistakeCounter = 0;
    _termsNotShown = [];
    _termsShown = [];
    _termsCompleted = [];
    _termTexts = [];
    future = loadData();
    setState(() {});
  }

  Widget getChildView() {
    switch (stage) {
      case C6A1Stage.intro:
        return instructionsView();
      case C6A1Stage.activity:
        return puzzleView();
      case C6A1Stage.finish:
        return finishView();
    }
  }

}
