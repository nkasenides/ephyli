import 'dart:async';
import 'dart:math';

import 'package:ephyli/controller/activity_manager.dart';
import 'package:ephyli/theme/themes.dart';
import 'package:ephyli/utils/i10n.dart';
import 'package:ephyli/widgets/instructions_widget.dart';
import 'package:ephyli/widgets/rotate_device_widget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../model/activity.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ActivityC10A1 extends StatefulWidget {
  @override
  _ActivityC10A1State createState() => _ActivityC10A1State();
}

enum C10A1Stage {
  introduction,
  activity,
  finish
}

class LetterInputDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextEditingController _controller = TextEditingController();

    return AlertDialog(
      title: Text(AppLocalizations.of(context)!.enter_letter),
      content: TextField(
        controller: _controller,
        maxLength: 1,
        autofocus: true,
        textCapitalization: TextCapitalization.characters,
        decoration: InputDecoration(hintText: AppLocalizations.of(context)!.enter_letter),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(_controller.text),
          child: Text(AppLocalizations.of(context)!.ok),
        ),
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text(AppLocalizations.of(context)!.cancel),
        ),
      ],
    );
  }
}

class _ActivityC10A1State extends State<ActivityC10A1> {


  C10A1Stage stage = C10A1Stage.introduction;
  final String activityID = "c10a1";
  late Activity activity;
  late SharedPreferences prefs;
  late Future<void> future;

  /**activity data**/
  // List of terms and hints with hidden letters
  List<Map<String, dynamic>> terms = [];

  List<int> completedTermIndices = [];

  int selectedTermIndex = -1; // Track which word's hint to show
  int currentLetterIndex = 0; // Track the current blank letter in the selected word
  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  final ItemScrollController itemScrollController = ItemScrollController();
  final ScrollOffsetController scrollOffsetController = ScrollOffsetController();
  final ItemPositionsListener itemPositionsListener = ItemPositionsListener.create();
  final ScrollOffsetListener scrollOffsetListener = ScrollOffsetListener.create();


  // Check if all terms are completed
  bool get isGameComplete => terms.every((term) => term['revealed'].every((letter) => letter == true));

  // Function to reveal a letter in the term
  void revealLetter(int termIndex, int letterIndex) {
    setState(() {
      terms[termIndex]["revealed"][letterIndex] = true;
      selectedTermIndex = termIndex; // Set selected term to show hint
    });
  }

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
    hideKeyboard();
    super.dispose();
  }

  Widget activityIntroView() {
    return InstructionsWidget(
        prefs,
        AppLocalizations.of(context)!.c10a1_instructions,
        AppLocalizations.of(context)!.ready_letsgo,
        () {
          setState(() {
            stage = C10A1Stage.activity;
          });
        }
    );
  }

// Function to handle letter guess input
  void guessLetter(String guessedLetter) {
    setState(() {
      String actualLetter = terms[selectedTermIndex]["term"][currentLetterIndex];
      if (actualLetter.toUpperCase() == guessedLetter.toUpperCase()) {
        terms[selectedTermIndex]["revealed"][currentLetterIndex] = true;
        terms[selectedTermIndex]["colors"][currentLetterIndex] = Colors.blue;
      } else {
        terms[selectedTermIndex]["colors"][currentLetterIndex] = Colors.red;
      }

      // Move to the next unfilled position
      moveToNextBlank();
    });
  }

  // Function to move to the next blank position or hide keyboard if word is complete
  void moveToNextBlank() {
    List<bool> revealed = terms[selectedTermIndex]["revealed"];
    int nextIndex = revealed.indexWhere((isRevealed) => !isRevealed, currentLetterIndex + 1);

    if (nextIndex == -1) {
      // All letters in the word are revealed, stop editing
      _focusNode.unfocus();
      selectedTermIndex = -1;
      completedTermIndices.add(selectedTermIndex);

      //If all terms are completed move to the next stage.
      if (completedTermIndices.length == terms.length) {
        setState(() {
          stage = C10A1Stage.finish;
        });
      }

    } else {
      currentLetterIndex = nextIndex;
    }
    _controller.clear();
  }

  void openKeyboard() {
    _focusNode.requestFocus();
    SystemChannels.textInput.invokeMethod("TextInput.show");
  }

  void hideKeyboard() {
    _focusNode.requestFocus();
    SystemChannels.textInput.invokeMethod("TextInput.hide");
  }

  // Function to initiate typing on a blank letter
  void startTyping(int termIndex, int letterIndex) {
    setState(() {
      selectedTermIndex = termIndex;
      currentLetterIndex = letterIndex;
    });
    itemScrollController.scrollTo(
        index: selectedTermIndex,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOutCubic
    ).then((value) {
      _focusNode.requestFocus();
      openKeyboard();
    },);
  }

  Widget buildLetterBox(int termIndex, int letterIndex) {
    bool isRevealed = terms[termIndex]["revealed"][letterIndex];
    String letter = terms[termIndex]["term"][letterIndex];
    Color color = terms[termIndex]["colors"][letterIndex];

    if (letterIndex == currentLetterIndex && termIndex == selectedTermIndex) {
      color = Colors.yellow;
    }
    else {
      if (isRevealed) {
        color = Colors.blue[100]!;
      }
    }

    return GestureDetector(
      onTap: isRevealed ? null : () => startTyping(termIndex, letterIndex),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 2),
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: Colors.blue),
        ),
        child: Text(
          isRevealed ? letter : "_",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget activityGameView() {

    if (terms.isEmpty) {
      // List of terms and hints with hidden letters
      terms = kDebugMode ? [
        {"term": "JOHN", "hint": "John", "revealed": [true, false, false, true]},
        {"term": "SMITH", "hint": "Smith", "revealed": [true, false, false, true, false]},
      ] : [
        {"term": AppLocalizations.of(context)!.term1, "hint": AppLocalizations.of(context)!.term1_hint, "revealed": [true, false, false, false, false, true, true]},
        {"term": AppLocalizations.of(context)!.term2, "hint": AppLocalizations.of(context)!.term2_hint, "revealed": [true, false, false, false, true, false, true, true]},
        {"term": AppLocalizations.of(context)!.term3, "hint": AppLocalizations.of(context)!.term3_hint, "revealed": [true, false, false, false, true, false, false, false, true, true]},
        {"term": AppLocalizations.of(context)!.term4, "hint": AppLocalizations.of(context)!.term4_hint, "revealed": [true, false, false, false, false, true, false, true, true]},
        {"term": AppLocalizations.of(context)!.term5, "hint": AppLocalizations.of(context)!.term5_hint, "revealed": [true, false, false, false, false, true, true, true]},
        {"term": AppLocalizations.of(context)!.term6, "hint": AppLocalizations.of(context)!.term6_hint, "revealed": [true, false, false, true, true, true]},
        {"term": AppLocalizations.of(context)!.term7, "hint": AppLocalizations.of(context)!.term7_hint, "revealed": [true, false, true, false, true, false, true, false, true, true]},
        {"term": AppLocalizations.of(context)!.term8, "hint": AppLocalizations.of(context)!.term8_hint, "revealed": [true, false, true, false, true, false, true, true]},
        {"term": AppLocalizations.of(context)!.term9, "hint": AppLocalizations.of(context)!.term9_hint, "revealed": [true, false, true, false, true, true, true, true]},
        {"term": AppLocalizations.of(context)!.term10, "hint": AppLocalizations.of(context)!.term10_hint, "revealed": [true, false, true, false, true, true, true, true]},
        {"term": AppLocalizations.of(context)!.term11, "hint": AppLocalizations.of(context)!.term11_hint, "revealed": [true, false, false, false, true, false, true, true, true, true, true]}
      ];

      for (var term in terms) {
        int length = term["term"].length;
        int lettersToReveal = Random().nextInt(3) + 2;
        term["revealed"] = List.generate(length, (index) => false);
        term["colors"] = List.generate(length, (index) => Colors.grey[300]);
        List<int> indices = List.generate(length, (index) => index)..shuffle();
        for (int i = 0; i < lettersToReveal; i++) {
          term["revealed"][indices[i]] = true;
        }
      }

    }

    return OrientationBuilder(
      builder: (context, orientation) {
        if (orientation == Orientation.landscape) {
          return Center(child: RotateDeviceWidget(Orientation.portrait));
        }

        //Only open keyboard in portrait mode:
        Future.delayed(const Duration(milliseconds: 500), () {
          openKeyboard();
        },);

        return Scaffold(
          body: Padding(
            padding: Themes.standardPadding,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                //Display hint or instruction to start.
                Text(
                  selectedTermIndex != -1 ? "Hint: ${terms[selectedTermIndex]['hint']}" : "Click on the letter boxes to fill in the word using the hint provided.",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.grey[700]),
                  textAlign: TextAlign.center,
                ),

                const SizedBox(height: 20),

                // Display all terms together at the top
                Expanded(
                  child: ScrollablePositionedList.separated(
                    itemScrollController: itemScrollController,
                    scrollOffsetController: scrollOffsetController,
                    itemPositionsListener: itemPositionsListener,
                    scrollOffsetListener: scrollOffsetListener,
                    itemCount: terms.length,
                    separatorBuilder: (context, index) {
                      return const Gap(10);
                    },
                    itemBuilder: (context, termIndex) {
                      final Map<String, dynamic> termEntry = terms[termIndex];
                      return FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(termEntry["term"].length, (letterIndex) {
                            return buildLetterBox(termIndex, letterIndex);
                          }),
                        ),
                      );
                    },
                  ),
                ),

              ],
            ),
          ),
          bottomNavigationBar: selectedTermIndex != -1
              ? Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              autofocus: true,
              controller: _controller,
              focusNode: _focusNode,
              maxLength: 1,
              textCapitalization: TextCapitalization.characters,
              decoration: InputDecoration(hintText: "Type a letter"),
              onChanged: (input) {
                if (input.isNotEmpty) {
                  guessLetter(input[0]);
                }
              },
            ),
          )
              : null,
        );
      },
    );
  }

  Widget activityFinishView() {
    return InstructionsWidget(
      prefs,
      AppLocalizations.of(context)!.c10a1_finish,
      AppLocalizations.of(context)!.finish,
      () {
        ActivityManager.completeActivity(activityID).then((value) {
          Navigator.pop(context, "_");
        },);
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(title: Text(I10N.getI10nString("c10a1_name")!, style: const TextStyle(color: Colors.white),),
        backgroundColor: Themes.primaryColorDark,
        iconTheme: const IconThemeData(color: Colors.white),),
      body: SafeArea(
        child: FutureBuilder(
          future: future,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return chooseView();
            }
            return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }

  Widget chooseView() {
    switch (stage) {
      case C10A1Stage.activity:
        return activityGameView();
      case C10A1Stage.finish:
        return activityFinishView();
      case C10A1Stage.introduction:
        return activityIntroView();
    }
  }

}
