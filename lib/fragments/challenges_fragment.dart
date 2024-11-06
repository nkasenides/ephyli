import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:chat_bubbles/bubbles/bubble_normal.dart';
import 'package:chat_bubbles/bubbles/bubble_normal_image.dart';
import 'package:chat_bubbles/bubbles/bubble_special_one.dart';
import 'package:ephyli/model/game_badge_type.dart';
import 'package:ephyli/theme/app_images.dart';
import 'package:ephyli/theme/themes.dart';
import 'package:ephyli/utils/constants.dart';
import 'package:ephyli/utils/pref_utils.dart';
import 'package:ephyli/utils/ui_utils.dart';
import 'package:ephyli/widgets/buddy_avatar_widget.dart';
import 'package:ephyli/widgets/ephyli_gradient.dart';
import 'package:ephyli/widgets/instructions_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/challenge.dart';
import '../model/game_badge.dart';
import '../widgets/challenge_widget.dart';
import '../widgets/chat_bubble.dart';
import 'fragments.dart';

class ChallengesFragment extends StatefulWidget {
  const ChallengesFragment({super.key});

  @override
  State<ChallengesFragment> createState() => _ChallengesFragmentState();
}

class _ChallengesFragmentState extends State<ChallengesFragment> {
  late Future<SharedPreferences> future;
  bool messageShown = false;
  bool tutorialCompleted = false;
  late SharedPreferences prefs;

  Future<SharedPreferences> getData() async {
    prefs = await SharedPreferences.getInstance();

    List<String> unlockedChallenges = prefs.getStringList(PrefUtils.unlocked_challenges) ?? [];

    for (var e in Challenge.challenges) {
      //Determine if challenge is unlocked:
      if (unlockedChallenges.contains(e.id)) {
        e.unlocked = true;
      }

      //Determine if challenge is completed:
      e.completed = await e.isCompleted();
    }

    return prefs;
  }

  @override
  void initState() {
    future = getData();
    super.initState();
  }

  createTutorialView(AsyncSnapshot<SharedPreferences> snapshot) {
    debugPrint("Tutorial view");

    return InstructionsWidget(
        prefs,
        AppLocalizations.of(context)!.challengesTextTutorial,
        AppLocalizations.of(context)!.ok,
        () {
          snapshot.data!.setBool(PrefUtils.tutorial_completed, true).then((value) {
            setState(() { });
            GameBadge.tutorialBadge.earn(context);
          },);
        }
    );
  }

  createNormalView(AsyncSnapshot<SharedPreferences> snapshot) {
    debugPrint("Normal view");

    int totalChallenges = Challenge.challenges.length;
    int challengesCompleted = 0;

    for (var challenge in Challenge.challenges) {
      challenge.getNumOfCompletedActivities().then((value) {
        if (value >= challenge.activityIDs.length) {
          challengesCompleted++;
        }
      },);
    }

    return InstructionsWidget(
        prefs,
        challengesCompleted > 0 ?
        AppLocalizations.of(context)!.challengesTextNormal
            .replaceAll("%1", "$challengesCompleted")
            .replaceAll("%2", "$totalChallenges") :
        AppLocalizations.of(context)!.challengesTextNormalInitial
            .replaceAll("%1", snapshot.data!.getString(PrefUtils.username)!),
        "",
        null
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: future,
      builder: (context, snapshot) {
        if (snapshot.hasData) {

          tutorialCompleted = snapshot.data!.getBool(PrefUtils.tutorial_completed) ?? false;
          debugPrint("tutorialCompleted: $tutorialCompleted");

          return EphyliGradient(
            child: Padding(
                padding: Themes.standardPadding,
                child: Column(
                  children: [

                    !tutorialCompleted ? createTutorialView(snapshot)
                        : createNormalView(snapshot),

                    const Gap(20),

                    //TODO ---

                    Expanded(
                      child: OrientationBuilder(builder: (context, orientation) {
                        if (orientation == Orientation.landscape) {
                          return GridView.count(
                            scrollDirection: Axis.horizontal,
                            crossAxisCount: 1,
                            children: Challenge.challenges.map((e) {
                              return ChallengeWidget(e, refresher: _refresh);
                            }).toList(),
                          );
                        }
                        else {
                          return GridView.count(
                            // scrollDirection: Axis.horizontal,
                            crossAxisCount: 2,
                            children: Challenge.challenges.map((e) {
                              return ChallengeWidget(e, refresher: _refresh);
                            }).toList(),
                          );
                        }
                      },),
                    ),
                  ],
                )),
          );
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }

  _refresh() {
    future = getData();
    setState(() {});
  }

}
