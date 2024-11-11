import 'dart:async';
import 'dart:math';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:ephyli/controller/activity_manager.dart';
import 'package:ephyli/theme/themes.dart';
import 'package:ephyli/utils/i10n.dart';
import 'package:ephyli/utils/ui_utils.dart';
import 'package:ephyli/widgets/instructions_widget.dart';
import 'package:ephyli/widgets/rotate_device_widget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gap/gap.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:widget_zoom/widget_zoom.dart';

import '../../model/activity.dart';
import '../../model/challenge.dart';
import '../../model/game_badge.dart';
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
      title: Text("Enter a letter"),
      content: TextField(
        controller: _controller,
        maxLength: 1,
        autofocus: true,
        textCapitalization: TextCapitalization.characters,
        decoration: InputDecoration(hintText: "Enter a letter"),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(_controller.text),
          child: Text("OK"),
        ),
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text("Cancel"),
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
  final List<Map<String, dynamic>> terms = [
    {"term": "COMMAND", "hint": "The teacher's directive control of students' learning activities.", "revealed": [true, false, false, false, false, true, true]},
    {"term": "PRACTICE", "hint": "Delegation of some decisions from the teacher to the student.", "revealed": [true, false, false, false, true, false, true, true]},
    {"term": "RECIPROCAL", "hint": "Groups with assigned roles: practice, observe, evaluate, correct, and help.", "revealed": [true, false, false, false, true, false, false, false, true, true]},
    {"term": "SELFCHECK", "hint": "Self-assessment of exercise execution and results.", "revealed": [true, false, false, false, false, true, false, true, true]},
    {"term": "INCLUSION", "hint": "Working together in groups to achieve common goals.", "revealed": [true, false, false, false, false, true, true, true]},
    {"term": "GUIDED", "hint": "The teacher leads students to independently discover solutions through questions.", "revealed": [true, false, false, true, true, true]},
    {"term": "CONVERGENT", "hint": "Students analyze and develop strategies to solve teacher-presented problems.", "revealed": [true, false, true, false, true, false, true, false, true, true]},
    {"term": "DIVERGENT", "hint": "Encourages creativity with self-created exercises.", "revealed": [true, false, true, false, true, false, true, true]},
    {"term": "DESIGNED", "hint": "A personalized program based on individual abilities, with teacher as consultant.", "revealed": [true, false, true, false, true, true, true, true]},
    {"term": "INITIATED", "hint": "Student-led, from design to execution, with teacher as consultant.", "revealed": [true, false, true, false, true, true, true, true]},
    {"term": "SELFTEACHING", "hint": "Students plan, execute, and evaluate their learning.", "revealed": [true, false, false, false, true, false, true, true, true, true, true]}
  ];

  int selectedTermIndex = -1; // Track which word's hint to show
  int currentLetterIndex = 0; // Track the current blank letter in the selected word
  TextEditingController _controller = TextEditingController();
  FocusNode _focusNode = FocusNode();


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

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Widget activityIntroView() {
    return InstructionsWidget(
        prefs,
        AppLocalizations.of(context)!.c9a1_instructions, //todo
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
    } else {
      currentLetterIndex = nextIndex;
      _controller.clear();
    }
  }

  // Function to initiate typing on a blank letter
  void startTyping(int termIndex, int letterIndex) {
    setState(() {
      selectedTermIndex = termIndex;
      currentLetterIndex = letterIndex;
      _focusNode.requestFocus();
    });
  }

  Widget buildLetterBox(int termIndex, int letterIndex) {
    bool isRevealed = terms[termIndex]["revealed"][letterIndex];
    String letter = terms[termIndex]["term"][letterIndex];
    Color color = terms[termIndex]["colors"][letterIndex];

    return GestureDetector(
      onTap: isRevealed ? null : () => startTyping(termIndex, letterIndex),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 2),
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: isRevealed ? Colors.blue[100] : color,
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
    return Scaffold(
      appBar: AppBar(
        title: Text("Cody Cross-Style Game"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (isGameComplete)
              Center(
                child: Text(
                  "Congratulations! You've completed the game!",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.green),
                  textAlign: TextAlign.center,
                ),
              )
            else
              Column(
                children: [
                  // Display all terms together at the top
                  Wrap(
                    spacing: 8,
                    runSpacing: 10,
                    alignment: WrapAlignment.center,
                    children: terms.asMap().entries.map((entry) {
                      int termIndex = entry.key;
                      Map<String, dynamic> term = entry.value;
                      return Row(
                        mainAxisSize: MainAxisSize.min,
                        children: List.generate(term["term"].length, (letterIndex) {
                          return buildLetterBox(termIndex, letterIndex);
                        }),
                      );
                    }).toList(),
                  ),
                  SizedBox(height: 20),

                  // Display the hint for the selected word
                  if (selectedTermIndex != -1)
                    Text(
                      "Hint: ${terms[selectedTermIndex]['hint']}",
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.grey[700]),
                      textAlign: TextAlign.center,
                    ),
                ],
              ),
          ],
        ),
      ),
      bottomNavigationBar: selectedTermIndex != -1
          ? Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextField(
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
  }

  Widget activityFinishView() {
    return InstructionsWidget(
      prefs,
      AppLocalizations.of(context)!.c9a1_finish_message, //todo
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
      appBar: AppBar(title: Text(I10N.getI10nString("c10a1_name")!, style: const TextStyle(color: Colors.white),),
        backgroundColor: Themes.primaryColorDark,
        iconTheme: const IconThemeData(color: Colors.white),),
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
      case C10A1Stage.activity:
        return activityGameView();
      case C10A1Stage.finish:
        return activityFinishView();
      case C10A1Stage.introduction:
        return activityIntroView();
    }
  }

}
