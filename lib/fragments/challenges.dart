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

  Future<SharedPreferences> getData() async {
    return await SharedPreferences.getInstance();
  }

  @override
  void initState() {
    future = getData();
    super.initState();
  }

  createTutorialView(AsyncSnapshot<SharedPreferences> snapshot) {
    debugPrint("Tutorial view");
    return Column(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PersonalizedAvatar(
              buddyAvatars[snapshot.data!.getInt(PrefUtils.buddy_selection)!],
              backgroundRadius: 25,
              avatarSize: 35,
            ),
            ChatBubble(
              margin: const EdgeInsets.only(left: 50),
              child: AnimatedTextKit(
                animatedTexts: [
                  TypewriterAnimatedText(
                    AppLocalizations.of(context)!.challengesTextTutorial,
                    textStyle: const TextStyle(
                      color: Colors.white,
                    ),
                    speed: const Duration(milliseconds: 50),
                  ),
                ],
                displayFullTextOnTap: true,
                isRepeatingAnimation: false,
                onFinished: () {
                  setState(() {
                    messageShown = true;
                  });
                },
                onTap: () {
                  setState(() {
                    messageShown = true;
                  });
                },
              ),
            )
          ],
        ),
        messageShown
            ? Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    child: Text(AppLocalizations.of(context)!.ok),
                    onPressed: () {

                      snapshot.data!.setBool(PrefUtils.tutorial_completed, true).then((value) {
                        setState(() { });
                        showDialog(context: context, builder: (context) {
                          //Show dialog for badge:
                          return UIUtils.createBadgeDialog(GameBadge.gameBadges[GameBadgeType.TUTORIAL_BADGE]!, context);
                        },);
                      },);

                    },
                  ),
                ],
              )
            : Container(),
      ],
    );
  }

  createNormalView(snapshot) {
    debugPrint("Normal view");
    return Container(
      child: Column(children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PersonalizedAvatar(
              buddyAvatars[snapshot.data!.getInt(PrefUtils.buddy_selection)!],
              backgroundRadius: 25,
              avatarSize: 35,
            ),
            ChatBubble(
              margin: const EdgeInsets.only(left: 50),
              child: AnimatedTextKit(
                animatedTexts: [
                  TypewriterAnimatedText(
                    AppLocalizations.of(context)!.challengesTextNormal,
                    textStyle: const TextStyle(
                      color: Colors.white,
                    ),
                    speed: const Duration(milliseconds: 5),
                  ),
                ],
                displayFullTextOnTap: true,
                isRepeatingAnimation: false,
                onFinished: () {
                  setState(() {
                    //TODO
                  });
                },
                onTap: () {
                  setState(() {
                    //TODO
                  });
                },
              ),
            )
          ],
        ),
        messageShown ? Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    child: Text(AppLocalizations.of(context)!.ready_letsgo),
                    onPressed: () {
                      setState(() { });
                    },
                  ),
                ],
              )
            : Container(),
      ]),
    );
  }

  List<Challenge> challenges = [
    Challenge(
        completedImage: Image.asset(AppImages.logo),
        incompleteImage: Image.asset(AppImages.logoBlackAndWhite),
        description:
            "this is a descriptionasdkjfhalksdjfhalkjsdhflkajsdhflkajshdflkjahsdf",
        name: "Challenge 1"),
    Challenge(
        completedImage: Image.asset(AppImages.logo),
        incompleteImage: Image.asset(AppImages.logoBlackAndWhite),
        description: "this is a description",
        name: "Challenge 1"),
    Challenge(
        completedImage: Image.asset(AppImages.logo),
        incompleteImage: Image.asset(AppImages.logoBlackAndWhite),
        description: "this is a description",
        name: "Challenge 1"),
    Challenge(
        completedImage: Image.asset(AppImages.logo),
        incompleteImage: Image.asset(AppImages.logoBlackAndWhite),
        description: "this is a description",
        name: "Challenge 1"),
    Challenge(
        completedImage: Image.asset(AppImages.logo),
        incompleteImage: Image.asset(AppImages.logoBlackAndWhite),
        description: "this is a description",
        name: "Challenge 1"),
  ];

  @override
  Widget build(BuildContext context) {
    debugPrint("build()");
    return FutureBuilder(
      future: future,
      builder: (context, snapshot) {
        if (snapshot.hasData) {

          tutorialCompleted = snapshot.data!.getBool(PrefUtils.tutorial_completed) ?? false;
          debugPrint("tutorialCompleted: $tutorialCompleted");

          return Padding(
              padding: Themes.standardPadding,
              child: Column(
                children: [

                  Expanded(
                    child: !tutorialCompleted ? createTutorialView(snapshot)
                        : createNormalView(snapshot),
                  ),

                  //TODO ---

                  Expanded(
                    child: GridView.count(
                      // scrollDirection: Axis.horizontal,
                      crossAxisCount: 2,
                      children: challenges.map((e) {
                        return ChallengeWidget(e);
                      }).toList(),
                    ),
                  ),
                ],
              ));
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
