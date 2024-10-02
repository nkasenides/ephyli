import 'dart:math';

import 'package:animated_text_kit/animated_text_kit.dart';
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

class _ActivityC1a1State extends State<ActivityC1a1> {

  List<String> _termsNotCompleted = []; //List of IDs
  List<String> _termsCompleted = []; //List of IDs
  List<String> _termsShown = []; //List of IDs

  List<String> _termTexts = []; //UI Items
  List<String> _termDescriptions = []; //UI Items

  MatchingPairs? matchingPairs;

  int score = 0;
  bool step1MessageShown = false;

  late Future future;
  late SharedPreferences prefs;
  List<Term> terms = [];
  bool showActivity = false;

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
    matchingPairs ??= MatchingPairs();

    List<String> titles = [];
    List<String> descriptions = [];

    //Find correct pair:
    if (matchingPairs!.correctPair == null) {
      int randomIndex = Random().nextInt(_termsNotCompleted.length);
      String termID = _termsNotCompleted[randomIndex];
      Term? term = getTermByID(termID);
      if (term == null) {
        throw Exception("Could not find term with id $termID.");
      }
      MatchingPair pair = MatchingPair(
          term.text, term.correctDescription);
      matchingPairs!.correctPair = pair;

      _termsNotCompleted.remove(termID);
      _termsShown.add(termID);
      titles.add(term.text);
      descriptions.add(term.correctDescription);
    }

    //Find wrong pair 1:
    if (matchingPairs!.wrongPair1 == null) {
      int randomIndex = Random().nextInt(_termsNotCompleted.length);
      String termID = _termsNotCompleted[randomIndex];
      Term? term = getTermByID(termID);
      if (term == null) {
        throw Exception("Could not find term with id $termID.");
      }
      MatchingPair pair = MatchingPair(
          term.text, term.wrongDescription);
      matchingPairs!.wrongPair1 = pair;

      _termsNotCompleted.remove(termID);
      _termsShown.add(termID);
      titles.add(term.text);
      descriptions.add(term.wrongDescription);
    }

    //Find wrong pair 2:
    if (matchingPairs!.wrongPair2 == null) {
      int randomIndex = Random().nextInt(_termsNotCompleted.length);
      String termID = _termsNotCompleted[randomIndex];
      Term? term = getTermByID(termID);
      if (term == null) {
        throw Exception("Could not find term with id $termID.");
      }
      MatchingPair pair = MatchingPair(
          term.text, term.wrongDescription);
      matchingPairs!.wrongPair2 = pair;

      _termsNotCompleted.remove(termID);
      _termsShown.add(termID);
      titles.add(term.text);
      descriptions.add(term.wrongDescription);
    }

    //Randomize the lists and set for UI:
    titles.shuffle();
    descriptions.shuffle();
    _termTexts = titles;
    _termDescriptions = descriptions;

    debugPrint("Terms:");
    debugPrint(_termTexts[0]);
    debugPrint(_termTexts[1]);
    debugPrint(_termTexts[2]);

    debugPrint("Descriptions:");
    debugPrint(_termDescriptions[0]);
    debugPrint(_termDescriptions[1]);
    debugPrint(_termDescriptions[2]);

  }

  Future<void> loadData() async {
    await Future.wait([
      Term.readTermsFromJSONFile("assets/activity_data/activity1/terms.json")
          .then((value) {
            terms = value;
            //Add all terms as not completed:
            for (Term t in terms) {
              _termsNotCompleted.add(t.id);
            }
            _findMatchingPairs();
          },),
      SharedPreferences.getInstance().then((value) => prefs = value,),
    ]);
  }

  //Intro
  Widget instructionsView() {
    UIUtils.forcePortrait();
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
                  showActivity = true;
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
    UIUtils.forceLandscape();
    return Expanded(
      child: Column(
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // Draggable words (Keys)
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: _termTexts.map((word) {
                    return Container(
                      margin: EdgeInsets.symmetric(vertical: 8),
                      child: Draggable<String>(
                        data: word,
                        feedback: Material(
                          color: Colors.transparent,
                          child: Text(
                            word,
                            style: const TextStyle(
                              color: Colors.blue,
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
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    );
                  }).toList(),
                ),

                const Gap(20),

                // Drag Targets (Values)
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: _termDescriptions.map((definition) {
                    return DragTarget<String>(
                      onAccept: (receivedWord) {
                        if (isMatch(receivedWord, definition)) {
                          setState(() {
                            score +=
                            100; // Increase score for correct match
                          });
                        } else {
                          setState(() {
                            score -=
                            100; // Decrease score for incorrect match
                          });
                        }
                      },
                      builder: (context, candidateData, rejectedData) {
                        return Container(
                          margin: EdgeInsets.symmetric(vertical: 8),
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: Colors.blueAccent),
                          ),
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
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Themes.primaryColorDark,
        iconTheme: const IconThemeData(color: Colors.white),
        title: Text(Activity.activities["c1a1"]!.nameRes, style: const TextStyle(color: Colors.white),), //TODO - Get name out of resource
        actions: showActivity ? [

          Text(
            'Score: $score',
            style: const TextStyle(fontSize: 20, color: Colors.white),
          ),

          const Gap(20),

          OutlinedButton(
            onPressed: () {
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
              padding: Themes.standardPadding,
              child: Column(
                children: [
                  !showActivity ? instructionsView() : Container(),
                  showActivity ? puzzleView() : Container()
                ],
              ),
            );

          }
          return const Center(child: CircularProgressIndicator(),);
        }
      ),
    );
  }

}
