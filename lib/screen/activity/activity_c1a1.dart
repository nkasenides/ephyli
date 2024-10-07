import 'dart:math';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:ephyli/fragments/fragments.dart';
import 'package:ephyli/theme/themes.dart';
import 'package:ephyli/utils/ui_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../model/activity.dart';
import '../../model/match_game/matching_pair.dart';
import '../../model/match_game/matching_pairs.dart';
import '../../model/match_game/term.dart';
import '../../utils/constants.dart';
import '../../utils/pref_utils.dart';
import '../../widgets/buddy_avatar_widget.dart';
import '../../widgets/chat_bubble.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ActivityC1a1 extends StatefulWidget {
  const ActivityC1a1({super.key});

  @override
  State<ActivityC1a1> createState() => _ActivityC1a1State();
}

enum C1A1Stage {
  intro,
  activity,
  congrats,
  reading
}

class _ActivityC1a1State extends State<ActivityC1a1> {

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


  @override
  void initState() {
    future = loadData();
    super.initState();
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
    MatchingPair correctPair = MatchingPair(correctTerm!.id, correctTerm.text, correctTerm.correctDescription);
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
      if (t.id != correctTerm.id && t.id != extraTermID1 && t.id != extraTermID2) {
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
    matchingPairs.wrongPair1 = MatchingPair(extraTermID1, extraTerm1.text, allWrongDescriptions[randomWrongIndex1]);
    matchingPairs.wrongPair2 = MatchingPair(extraTermID2, extraTerm2.text, allWrongDescriptions[randomWrongIndex2]);

    //Randomize the lists and set for UI:
    titles.shuffle();
    descriptions.shuffle();
    _termTexts = titles;
    _termDescriptions = descriptions;

    debugPrint(_termTexts.toString());

    debugPrint(_termDescriptions.toString());

  }

  Future<void> loadData() async {
    await Future.wait([
      Term.readTermsFromJSONFile("assets/activity_data/activity1/test_terms.json")
          .then((value) {
            terms = value;
            //Add all terms as not completed:
            for (Term t in terms) {
              _termsNotShown.add(t.id);
            }
            _findMatchingPairs();
          },),
      SharedPreferences.getInstance().then((value) => prefs = value,),
    ]);
  }

  //Intro
  Widget instructionsView() {
    return Padding(
      padding: Themes.standardPadding,
      child: Column(
        children: [
          Column(
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
                      AppLocalizations.of(context)!.c1a1_welcome,
                      textStyle: const TextStyle(color: Colors.white,),
                      speed: const Duration(milliseconds: 50),
                    ),
                  ],
                  displayFullTextOnTap: true,
                  isRepeatingAnimation: false,
                  onFinished: () {
                    setState(() {
                      step1MessageShown = true;
                    });
                  },
                  onTap: () {
                    setState(() {
                      step1MessageShown = true;
                    });
                  },
                ),
              )

            ],
          ),

          step1MessageShown ? Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButton(
                child: Text(AppLocalizations.of(context)!.lets_start),
                onPressed: () {
                  setState(() {
                    stage = C1A1Stage.activity;
                  });
                },
              ),
            ],
          ) : Container(),
        ],
      ),
    );
  }

  //Step finished view
  Widget stepFinishedView() {
    return Column(
      children: [
        Column(
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
                    AppLocalizations.of(context)!.c1a1_congrats.replaceAll("%1", score.toString()),
                    textStyle: const TextStyle(color: Colors.white,),
                    speed: const Duration(milliseconds: 0),
                  ),
                ],
                displayFullTextOnTap: true,
                isRepeatingAnimation: false,
                onFinished: () {
                  setState(() {
                    step1MessageShown = true;
                  });
                },
                onTap: () {
                  setState(() {
                    step1MessageShown = true;
                  });
                },
              ),
            )

          ],
        ),

        step1MessageShown ? Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ElevatedButton(
              child: Text(AppLocalizations.of(context)!.next),
              onPressed: () {
                setState(() {
                  stage = C1A1Stage.reading;
                });
              },
            ),
          ],
        ) : Container(),
      ],
    );
  }

  //Matching Activity
  Widget puzzleView() {
    return Expanded(
      child: Column(
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: Colors.blueAccent),
                        ),
                        margin: const EdgeInsets.symmetric(vertical: 8),
                        child: Draggable<String>(
                          data: word,
                          feedback: Material(
                            color: Colors.transparent,
                            child: Text(
                              word,
                              style: const TextStyle(
                                color: Themes.primaryColorDark,
                                fontSize: 18,
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
                            style: const TextStyle(fontSize: 18),
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

                              //Move the term to completed from shown:
                              _termsCompleted.add(getIDByTerm(receivedWord)!);
                              _termsShown.remove(getIDByTerm(receivedWord));

                              //Move the other terms from shown back to not shown:
                              _termsShown.remove(matchingPairs.wrongPair1!.id);
                              _termsShown.remove(matchingPairs.wrongPair2!.id);

                              if (!_termsCompleted.contains(matchingPairs.wrongPair1!.id)) {
                                _termsNotShown.add(
                                    matchingPairs.wrongPair1!.id);
                              }

                              if (!_termsCompleted.contains(matchingPairs.wrongPair2!.id)) {
                                _termsNotShown.add(
                                    matchingPairs.wrongPair2!.id);
                              }

                              debugPrint("Not shown: ${_termsNotShown}");
                              debugPrint("Shown: ${_termsShown}");
                              debugPrint("Completed: ${_termsCompleted}");

                              if (_termsNotShown.isEmpty) {
                                setState(() {
                                  stage = C1A1Stage.congrats;
                                });
                              }
                              else {
                                _findMatchingPairs();
                              }

                            });
                          } else {
                            setState(() {
                              score -= 100;
                              mistakeCounter++;
                              if (mistakeCounter >= 5) {
                                showDialog(context: context, builder: (context) {
                                  return AlertDialog(
                                    title: Text(AppLocalizations.of(context)!.gameOver),
                                    content: Text(AppLocalizations.of(context)!.c1a1_5mistakesReset),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          resetGame();
                                          Navigator.pop(context);
                                        },
                                        child: Text(AppLocalizations.of(context)!.ok),
                                      )
                                    ],
                                  );
                                }, barrierDismissible: false);
                              }
                            });
                          }
                        },
                        builder: (context, candidateData, rejectedData) {
                          return Container(
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: Themes.secondaryColor),
                            ),
                            margin: EdgeInsets.symmetric(vertical: 8),
                            child: SizedBox(
                              width: 500,
                              child: Text(
                                definition,
                                style: TextStyle(
                                    fontSize: 16,
                                    fontStyle: FontStyle.italic,
                                    color: Colors.blue,
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
    );
  }

  Widget getReadingView() {
    UIUtils.portraitOrientation();
    return Column(
      children: [
        Column(
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
                    AppLocalizations.of(context)!.c1a1_reading_instruction,
                    textStyle: const TextStyle(color: Colors.white,),
                    speed: const Duration(milliseconds: 0),
                  ),
                ],
                displayFullTextOnTap: true,
                isRepeatingAnimation: false,
                onFinished: () {
                  setState(() {
                    step1MessageShown = true;
                  });
                },
                onTap: () {
                  setState(() {
                    step1MessageShown = true;
                  });
                },
              ),
            )

          ],
        ),

        const Gap(20),

        Image.asset("assets/img/a1c1-extract.png", width: MediaQuery.of(context).size.width,),

        const Gap(20),

        step1MessageShown ? Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ElevatedButton(
              child: Text(AppLocalizations.of(context)!.finish),
              onPressed: () {
                setState(() {

                  PrefUtils.finishActivity("c1a1").then((value) {
                    Navigator.pop(context);
                    //TODO - Refresh the activities page so that the activity appears to be completed.
                  },);

                });
              },
            ),
          ],
        ) : Container(),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    UIUtils.landscapeOrientation();
    UIUtils.enableFullScreen();

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
                        content: Text(AppLocalizations.of(context)!.resetLoseProgressMessage),
                        actions: [

                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                              Navigator.pop(context);
                            },
                            child: Text(AppLocalizations.of(context)!.resetGame),
                          ),

                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text(AppLocalizations.of(context)!.cancel),
                          ),

                        ]
                    );
                  }
              );
            }
          },
          icon: const Icon(Icons.arrow_back),
        ),
        backgroundColor: Themes.primaryColorDark,
        iconTheme: const IconThemeData(color: Colors.white),
        title: Text(Activity.activities["c1a1"]!.nameRes, style: const TextStyle(color: Colors.white),), //TODO - Get name out of resource
        actions: stage == C1A1Stage.activity ? [

          Text(
            'Score: $score',
            style: const TextStyle(fontSize: 20, color: Colors.white),
          ),

          const Gap(20),

          OutlinedButton(
            onPressed: () {

              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text(AppLocalizations.of(context)!.areYouSure),
                    content: Text(AppLocalizations.of(context)!.resetLoseProgressMessage),
                    actions: [

                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                          setState(() {
                            resetGame();
                          });
                        },
                        child: Text(AppLocalizations.of(context)!.resetGame),
                      ),

                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text(AppLocalizations.of(context)!.cancel),
                      ),

                    ]
                  );
                }
              );

              setState(() {
                score = 0; // Reset score
                setState(() {
                  _findMatchingPairs();
                });
              });
            },
            child: Text(AppLocalizations.of(context)!.resetGame, style: const TextStyle(color: Colors.white),),
          ),

          const Gap(20),
        ] : [],
      ),
      body: FutureBuilder(
        future: future,
        builder: (context, snapshot) {

          if (snapshot.connectionState == ConnectionState.done) {

            // debugPrint(terms.toString());

            return Padding(
              padding: const EdgeInsets.all(2),
              child: getChildView()
            );

          }
          return const Center(child: CircularProgressIndicator(),);
        }
      ),
    );
  }


  @override
  void dispose() {
    UIUtils.portraitOrientation();
    UIUtils.disableFullscreen();
    super.dispose();
  }

  resetGame() {
    score = 0;
    mistakeCounter = 0;
    _termsNotShown = [];
    _termsShown = [];
    _termsCompleted = [];
    _termTexts = [];
    future = loadData();
    setState(() { });
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
