import 'dart:async';
import 'dart:math';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:ephyli/controller/activity_manager.dart';
import 'package:ephyli/fragments/fragments.dart';
import 'package:ephyli/theme/themes.dart';
import 'package:ephyli/utils/i10n.dart';
import 'package:ephyli/utils/ui_utils.dart';
import 'package:ephyli/widgets/instructions_widget.dart';
import 'package:ephyli/widgets/rotate_device_widget.dart';
import 'package:ephyli/widgets/text_bubble.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttermoji/fluttermojiCircleAvatar.dart';
import 'package:gap/gap.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:widget_zoom/widget_zoom.dart';
import '../../model/activity.dart';
import '../../model/game_badge.dart';
import '../../model/match_game/matching_pair.dart';
import '../../model/match_game/matching_pairs.dart';
import '../../model/match_game/term.dart';
import '../../utils/constants.dart';
import '../../utils/pref_utils.dart';
import '../../widgets/buddy_avatar_widget.dart';
import '../../widgets/chat_bubble.dart';
import '../../l10n/app_localizations.dart';

class ActivityC1a1 extends StatefulWidget {
  const ActivityC1a1({super.key});

  @override
  State<ActivityC1a1> createState() => _ActivityC1a1State();
}

enum C1A1Stage {
  intro,
  activity,
  congrats,
  reading,
}

class _ActivityC1a1State extends State<ActivityC1a1>
    with SingleTickerProviderStateMixin {
  final String activityID = "c1a1";

  C1A1Stage stage = C1A1Stage.intro;

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
    matchingPairs = MatchingPairs();

    // Pick a random term not yet shown
    int randomIndex = Random().nextInt(_termsNotShown.length);
    String currentTermID = _termsNotShown[randomIndex];
    Term currentTerm = getTermByID(currentTermID)!;

    // Prepare the correct pair
    matchingPairs.correctPair = MatchingPair(
      currentTerm.id,
      currentTerm.text,
      currentTerm.correctDescription,
    );

    // Mark this term as shown
    _termsNotShown.remove(currentTermID);
    _termsShown.add(currentTermID);

    // Build the list of potential distractors
    List<String> otherTermIDs = terms.where((t) => t.id != currentTermID).map((t) => t.id).toList();
    otherTermIDs.shuffle();

    // Get one incorrect definition for the current term
    String wrongForCurrent = currentTerm.wrongDescription;

    // Get one correct definition from another term
    String randomOtherCorrect = getTermByID(otherTermIDs.first)!.correctDescription;

    // Prepare the definitions (1 correct, 1 wrong for this term, 1 correct from another term)
    _termTexts = [currentTerm.text]; // Only one term shown now
    _termDescriptions = [
      currentTerm.correctDescription,
      wrongForCurrent,
      randomOtherCorrect,
    ]..shuffle(); // Shuffle answers

    // Save wrong pairs for state tracking
    matchingPairs.wrongPair1 = MatchingPair(currentTerm.id, currentTerm.text, wrongForCurrent);
    matchingPairs.wrongPair2 = MatchingPair(otherTermIDs.first, getTermByID(otherTermIDs.first)!.text, randomOtherCorrect);

    debugPrint("Current term: ${currentTerm.text}");
    debugPrint("Descriptions: $_termDescriptions");

    // Check if that was the last term
    if (_termsNotShown.isEmpty) {
      setState(() {
        stage = C1A1Stage.congrats;
      });
    }
  }


  Future<void> loadData() async {
    // const String filename = kDebugMode ? "assets/activity_data/activity1/test_terms.json" : "assets/activity_data/activity1/c1a1_terms.json";
    const String filename = "assets/activity_data/activity1/c1a1_terms.json";
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
      AppLocalizations.of(context)!.c1a1_welcome,
      AppLocalizations.of(context)!.lets_start,
      () {
        setState(() {
          stage = C1A1Stage.activity;
        });
      }
    );
  }

  //Step finished view
  Widget stepFinishedView() {
    return InstructionsWidget(
        prefs,
        AppLocalizations.of(context)!
            .c1a1_congrats
            .replaceAll("%1", score.toString()),
        AppLocalizations.of(context)!.next,
        () {
          setState(() {
            stage = C1A1Stage.reading;
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

    return OrientationBuilder(builder: (context, orientation) {
      if (orientation == Orientation.landscape) {
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
                          child: Scrollbar(
                            child: SingleChildScrollView(
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
                          ),
                        ),

                        const Gap(20),

                        // Drag Targets (Values)
                        Expanded(
                          flex: 7,
                          child: Scrollbar(
                            child: SingleChildScrollView(
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

                                          debugPrint("Not shown: $_termsNotShown");
                                          debugPrint("Shown: $_termsShown");
                                          debugPrint("Completed: $_termsCompleted");

                                          if (_termsNotShown.isEmpty) {
                                            setState(() {
                                              stage = C1A1Stage.congrats;
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
      else {
        return Center(child: RotateDeviceWidget(Orientation.landscape),);
      }
    },);
  }

  Widget getReadingView() {

    return OrientationBuilder(builder: (context, orientation) {
      if (orientation == Orientation.portrait) {
        return InstructionsWidget(
          prefs,
          AppLocalizations.of(context)!.c1a1_reading_instruction,
          AppLocalizations.of(context)!.next,
              () {
            setState(() {
              ActivityManager.completeActivity(activityID).then(
                    (value) {
                  Navigator.pop(context, "_");
                },
              );
            });
          },
          middleWidget: Column(
            children: [
              const Gap(20),
              SizedBox(
                height: 300,
                child: WidgetZoom(
                  heroAnimationTag: "extract-img",
                  zoomWidget: Image.asset(
                    "assets/img/a1c1-extract.png",
                    width: MediaQuery.of(context).size.width,
                  ),
                ),
              ),
              const Gap(5),
              Text(AppLocalizations.of(context)!.clickOnImageToZoom),
              const Gap(20),
            ],
          ),
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
        actions: stage == C1A1Stage.activity
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
      case C1A1Stage.intro:
        return instructionsView();
      case C1A1Stage.activity:
        return puzzleView();
      case C1A1Stage.congrats:
        return stepFinishedView();
      case C1A1Stage.reading:
        return getReadingView();
    }
  }

}
