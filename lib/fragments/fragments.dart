import 'package:ephyli/fragments/challenges_fragment.dart';
import 'package:ephyli/fragments/tutorial_step_1.dart';
import 'package:ephyli/fragments/tutorial_step_2.dart';
import 'package:ephyli/fragments/tutorial_step_3.dart';
import 'package:flutter/material.dart';
import 'package:fragment_navigate/navigate-control.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Fragments {

  static const String TUTORIAL_STEP_1_KEY = "TUTORIAL_STEP_1_KEY";
  static const String TUTORIAL_STEP_2_KEY = "TUTORIAL_STEP_2_KEY";
  static const String TUTORIAL_STEP_3_KEY = "TUTORIAL_STEP_3_KEY";
  static const String CHALLENGES_KEY = "CHALLENGES_KEY";

  static final List<Posit> screens = [
    Posit(
      key: TUTORIAL_STEP_1_KEY,
      title: TUTORIAL_STEP_1_KEY,
      fragmentBuilder: (params) => TutorialStep1(),
    ),

    Posit(
      key: TUTORIAL_STEP_2_KEY,
      title: TUTORIAL_STEP_2_KEY,
      fragmentBuilder: (params) => TutorialStep2(),
    ),

    Posit(
      key: TUTORIAL_STEP_3_KEY,
      title: TUTORIAL_STEP_3_KEY,
      fragmentBuilder: (params) => TutorialStep3(),
    ),

    Posit(
      key: CHALLENGES_KEY,
      title: CHALLENGES_KEY,
      fragmentBuilder: (params) => ChallengesFragment(),
    ),

  ];

  static FragNavigate navigator = FragNavigate(
    firstKey: "TUTORIAL_STEP_1_KEY",
    screens: screens,
  );

}