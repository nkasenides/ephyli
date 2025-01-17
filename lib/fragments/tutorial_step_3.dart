import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:chat_bubbles/bubbles/bubble_normal.dart';
import 'package:chat_bubbles/bubbles/bubble_normal_image.dart';
import 'package:chat_bubbles/bubbles/bubble_special_one.dart';
import 'package:ephyli/theme/themes.dart';
import 'package:ephyli/utils/constants.dart';
import 'package:ephyli/utils/pref_utils.dart';
import 'package:ephyli/widgets/buddy_avatar_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../widgets/chat_bubble.dart';
import '../widgets/instructions_widget.dart';
import 'fragments.dart';

class TutorialStep3 extends StatefulWidget {

  const TutorialStep3({super.key});

  @override
  State<TutorialStep3> createState() => _TutorialStep3State();
}

class _TutorialStep3State extends State<TutorialStep3> {

  late Future<SharedPreferences> future;
  bool messageShown = false;

  Future<SharedPreferences> getData() async {
    return await SharedPreferences.getInstance();
  }

  @override
  void initState() {
    future = getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return FutureBuilder(
      future: future,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return SingleChildScrollView(

            child: InstructionsWidget(
                snapshot.data!,
                AppLocalizations.of(context)!.tutorialTextChallenges,
                AppLocalizations.of(context)!.exploreChallenges,
                () {
                  Fragments.navigator.putPosit(key: Fragments.CHALLENGES_KEY);
                }
            )
          );
        }
        return const Center(child: CircularProgressIndicator());
      },
    );

  }

}
