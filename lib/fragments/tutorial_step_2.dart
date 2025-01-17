import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:chat_bubbles/bubbles/bubble_normal.dart';
import 'package:chat_bubbles/bubbles/bubble_normal_image.dart';
import 'package:chat_bubbles/bubbles/bubble_special_one.dart';
import 'package:ephyli/theme/themes.dart';
import 'package:ephyli/utils/constants.dart';
import 'package:ephyli/utils/feature_explorer.dart';
import 'package:ephyli/utils/pref_utils.dart';
import 'package:ephyli/widgets/buddy_avatar_widget.dart';
import 'package:feature_discovery/feature_discovery.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../widgets/chat_bubble.dart';
import '../widgets/instructions_widget.dart';
import 'fragments.dart';

class TutorialStep2 extends StatefulWidget {

  const TutorialStep2({super.key});

  @override
  State<TutorialStep2> createState() => _TutorialStep2State();
}

class _TutorialStep2State extends State<TutorialStep2> {

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
                AppLocalizations.of(context)!.tutorial_text_buddy,
                AppLocalizations.of(context)!.next,
                () {
                  FeatureDiscovery.discoverFeatures(
                    context,
                    const <String>{
                      FeatureExplorer.buddyFeatureID,
                      // FeatureExplorer.newsFeatureID,
                      FeatureExplorer.glossaryFeatureID,
                      FeatureExplorer.profileFeatureID,
                    },
                  );
                }
            )
          );
        }
        return const Center(child: CircularProgressIndicator());
      },
    );

  }

}
