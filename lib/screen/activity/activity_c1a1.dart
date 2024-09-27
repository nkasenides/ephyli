import 'dart:math';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:ephyli/theme/themes.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../fragments/fragments.dart';
import '../../model/match_game/TermPick.dart';
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
  late TermPick termPick;

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

  Term? getTermByID(String id) {
    for (Term t in terms) {
      if (t.id == id) {
        return t;
      }
    }
    return null;
  }

  TermPick _pickTermToShow() {
    int random = Random().nextInt(_termsNotCompleted.length);
    int random2 = Random().nextInt(terms.length);

    String idOfTerm = _termsNotCompleted[random];
    Term? term = getTermByID(idOfTerm);
    Term term2 = terms[random2];

    if (term == null) {
      throw Exception("Invalid ID, cannot pick term $idOfTerm");
    }

    //Make sure the 2 random terms are not the same:
    while (term.id == term2.id) {
      term2 = terms[Random().nextInt(terms.length)];
    }

    _termsCompleted.add(term.id);
    _termsNotCompleted.remove(term.id);
    return TermPick(
      term,
      term.correctDescription,
      term.wrongDescription,
      term2.correctDescription
    );
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
            termPick = _pickTermToShow();
          },),
      SharedPreferences.getInstance().then((value) => prefs = value,),
    ]);
  }

  //Intro
  Widget instructionsView() {
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

    return Expanded(
      child: Column(
        children: [

          Row(
            children: [
              Text(termPick.termShown.text)
            ],
          ),

          const Gap(20),

          Column(
            children: [

              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: OutlinedButton(
                  child: Text(termPick.option1),
                  onPressed: () {
                    //TODO
                  },
                ),
              ),

              const Gap(10),

              //TODO - Customize buttons
              //TODO - Colorful app bar
              //TODO - Help from the ePhyLi Buddy

              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: OutlinedButton(
                  child: Text(termPick.option2),
                  onPressed: () {
                    //TODO
                  },
                ),
              ),

              const Gap(10),

              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: OutlinedButton(
                  child: Text(termPick.option3),
                  onPressed: () {
                    //TODO
                  },
                ),
              ),


            ],
          )

        ],
      ),
    );

    // return Expanded(
    //   child: Column(
    //     children: [
    //       Text(
    //         'Score: $score',
    //         style: TextStyle(fontSize: 24),
    //       ),
    //       Expanded(
    //         child: Row(
    //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //           children: [
    //             // Draggable words (Keys)
    //             Column(
    //               mainAxisAlignment: MainAxisAlignment.center,
    //               children: correctPairs.keys.map((word) {
    //                 return Draggable<String>(
    //                   data: word,
    //                   feedback: Material(
    //                     color: Colors.transparent,
    //                     child: Text(
    //                       word,
    //                       style: const TextStyle(
    //                         color: Colors.blue,
    //                         fontSize: 18,
    //                       ),
    //                     ),
    //                   ),
    //                   childWhenDragging: Opacity(
    //                     opacity: 0.5,
    //                     child: Text(word),
    //                   ),
    //                   child: Text(
    //                     word,
    //                     style: TextStyle(fontSize: 18),
    //                   ),
    //                 );
    //               }).toList(),
    //             ),
    //             // Drag Targets (Values)
    //             Column(
    //               mainAxisAlignment: MainAxisAlignment.center,
    //               children: correctPairs.values.map((definition) {
    //                 return DragTarget<String>(
    //                   onAccept: (receivedWord) {
    //                     if (correctPairs[receivedWord] == definition) {
    //                       setState(() {
    //                         score +=
    //                         10; // Increase score for correct match
    //                       });
    //                     } else {
    //                       setState(() {
    //                         score -=
    //                         5; // Decrease score for incorrect match
    //                       });
    //                     }
    //                   },
    //                   builder: (context, candidateData, rejectedData) {
    //                     return Container(
    //                       margin: EdgeInsets.symmetric(vertical: 8),
    //                       padding: EdgeInsets.all(16),
    //                       decoration: BoxDecoration(
    //                         borderRadius: BorderRadius.circular(8),
    //                         border: Border.all(color: Colors.blueAccent),
    //                       ),
    //                       child: Text(
    //                         definition,
    //                         style: TextStyle(fontSize: 18),
    //                       ),
    //                     );
    //                   },
    //                 );
    //               }).toList(),
    //             ),
    //           ],
    //         ),
    //       ),
    //       Padding(
    //         padding: const EdgeInsets.all(8.0),
    //         child: ElevatedButton(
    //           onPressed: () {
    //             setState(() {
    //               score = 0; // Reset score
    //             });
    //           },
    //           child: Text('Reset Game'),
    //         ),
    //       ),
    //     ],
    //   ),
    // );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Word Matching Puzzle'),
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
