import 'dart:async';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:ephyli/controller/activity_manager.dart';
import 'package:ephyli/theme/themes.dart';
import 'package:ephyli/utils/i10n.dart';
import 'package:ephyli/utils/ui_utils.dart';
import 'package:ephyli/widgets/instructions_widget.dart';
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

class ActivityC2A2 extends StatefulWidget {
  @override
  _ActivityC2A2State createState() => _ActivityC2A2State();
}

enum C2A2Stage {
  introduction,
  activity,
  finish
}

class _ActivityC2A2State extends State<ActivityC2A2> {


  C2A2Stage stage = C2A2Stage.introduction;
  final String activityID = "c2a1";
  late Activity activity;
  late SharedPreferences prefs;
  late Future<void> future;
  int correct = 0;
  int wrong = 0;
  bool showPrompt = false;
  late Timer timer;

  /**activity data**/

  // Definitions and their respective countries
  final List<Map<String, String>> definitions = [
    {
      "definition":
      "Physical literacy can be described as the motivation, confidence, physical competence, knowledge, and understanding to value and take responsibility for engagement in physical activities for life.",
      "country": "IPLA, Ireland, Northern Ireland, Canada"
    },
    {
      "definition":
      "Physical literacy is about building the skills, knowledge, and behaviors that give us the confidence and motivation to lead active lives.",
      "country": "Australia"
    },
    {
      "definition":
      "Physical literacy is the ability, confidence, and desire to be physically active for life.",
      "country": "USA"
    },
    {
      "definition":
      "Physical literacy is our relationship with movement and physical activity throughout life.",
      "country": "England"
    }
  ];

  // List of countries and their flag image paths
  final List<Map<String, String>> countries = [
    {"name": "IPLA, Ireland, Northern Ireland, Canada", "flag": "assets/img/ipla-ireland-canada.png"}, // Replace with actual paths to your flag images
    {"name": "Australia", "flag": "assets/img/australia.png"},
    {"name": "USA", "flag": "assets/img/united-states-of-america.png"},
    {"name": "England", "flag": "assets/img/england.png"},
  ];


  // Tracks which definitions have been matched to the correct country
  final Map<String, bool> matched = {};


  Future<void> loadData() async {
    prefs = await SharedPreferences.getInstance();
    activity = Activity.activities[activityID]!;
  }

  @override
  void initState() {
    //Initialize prefs & activity data:
    future = loadData();
    shuffleCountries(); // Shuffle countries when the widget is initialized
    super.initState();
  }

  @override
  void dispose() {
    UIUtils.disableFullscreen();
    timer.cancel();
    super.dispose();
  }

  Widget activityIntroView() {
    return InstructionsWidget(
        prefs,
        AppLocalizations.of(context)!.c2a2_intro_message,
        AppLocalizations.of(context)!.ok,
        () {
          setState(() {
            stage = C2A2Stage.activity;
          });
        }
    );
  }

  Widget activityGameView() {
    timer = Timer(const Duration(seconds: 5), () {
      setState(() {
        showPrompt = true;
      });
    },);

    String currentDefinition = definitions[currentDefinitionIndex]["definition"]!;

    return Padding(
      padding: Themes.standardPadding,
      child: Center(
        child: Column(
          children: [

            Text(
              "\"$currentDefinition\"",
              style:  const TextStyle(fontSize: 18, fontStyle: FontStyle.italic),
              textAlign: TextAlign.justify,
            ),

            const SizedBox(height: 50),

            showPrompt ? Text(
              AppLocalizations.of(context)!.c2a2_instruction,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ) : Container(),

            const SizedBox(height: 50),

            // Show the list of country options with flags in a grid
            showPrompt ? Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // Number of flags in one row
                  childAspectRatio: 1.5,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 20,
                ),
                itemCount: countries.length,
                itemBuilder: (context, index) {
                  String countryName = countries[index]["name"]!;
                  String flagPath = countries[index]["flag"]!;
                  return ElevatedButton(
                    onPressed: () => handleCountrySelection(countryName),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey.shade100,
                      foregroundColor: Colors.black
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(5),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [

                          const SizedBox(height: 10),

                          // Country Flag
                          SizedBox(
                            height: 50,
                            child: Image.asset(
                              flagPath,
                              fit: BoxFit.cover,
                            ),
                          ),


                          const SizedBox(height: 15),

                          // Country Name
                          Expanded(
                            child: AutoSizeText(
                              countryName,
                              style: const TextStyle(fontSize: 16),
                              textAlign: TextAlign.center,
                            ),
                          ),

                        ],
                      ),
                    ),
                  );
                },
              ),
            ) : Container(),


          ],
        ),
      ),
    );

  }

  int currentDefinitionIndex = 0; // Track current definition index

  // Method to shuffle the countries
  void shuffleCountries() {
    setState(() {
      countries.shuffle();
    });
  }

  // Method to handle country selection
  void handleCountrySelection(String selectedCountry) {
    String correctCountry = definitions[currentDefinitionIndex]["country"]!;
    setState(() {
      if (selectedCountry == correctCountry) {
        correct++;
        UIUtils.showFeedbackBar(context, true);
        showPrompt = false;

        //Next definition:
        if (currentDefinitionIndex < definitions.length - 1) {
          nextDefinition();

          if (timer.isActive) {
            timer.cancel();
          }

          timer = Timer(const Duration(seconds: 5), () {
            setState(() {
              showPrompt = true;
            });
          },);
        }
        //End of game:
        else {
          setState(() {
            stage = C2A2Stage.finish;
          });
        }


      } else {
        wrong++;
        UIUtils.showFeedbackBar(context, false);
        nextDefinition();
      }
    });
  }

// Move to the next definition
  void nextDefinition() {
    setState(() {
      if (currentDefinitionIndex < definitions.length - 1) {
        currentDefinitionIndex++;
        shuffleCountries(); // Shuffle countries for the next definition
      }
    });
  }

  Widget activityFinishView() {
    return InstructionsWidget(
        prefs,
        AppLocalizations.of(context)!.c2a2_finish_message,
        AppLocalizations.of(context)!.finish,
        () {

          ActivityManager.completeActivity(activityID).then((value) async {

            //Find all badges related to this activity and award them:
            for (var badgeID in Challenge.challenge2.badgeIDs) {
              var badge = GameBadge.findBadge(badgeID);
              badge!.earn(context);
            }

            //Unlock next challenges:
            List<Future> unlockFutures = [];
            for (var challengeID in Challenge.challenge2.unlocksChallengesIDs) {
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

  @override
  Widget build(BuildContext context) {
    UIUtils.enableFullScreen();
    return Scaffold(
      appBar: AppBar(title: Text(I10N.getI10nString("c2a2_name")!)),
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
      case C2A2Stage.introduction:
        return activityIntroView();
      case C2A2Stage.activity:
        return activityGameView();
      case C2A2Stage.finish:
        return activityFinishView();
    }
  }

}