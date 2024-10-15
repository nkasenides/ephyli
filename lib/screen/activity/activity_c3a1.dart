import 'dart:async';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:ephyli/controller/activity_manager.dart';
import 'package:ephyli/theme/themes.dart';
import 'package:ephyli/utils/i10n.dart';
import 'package:ephyli/utils/ui_utils.dart';
import 'package:ephyli/widgets/instructions_widget.dart';
import 'package:flutter/foundation.dart';
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

class ActivityC3A1 extends StatefulWidget {
  @override
  _ActivityC3A1State createState() => _ActivityC3A1State();
}

enum C3A1Stage {
  introduction,
  activity,
  finish
}

class _ActivityC3A1State extends State<ActivityC3A1> {


  C3A1Stage stage = C3A1Stage.introduction;
  final String activityID = "c3a1";
  late Activity activity;
  late SharedPreferences prefs;
  late Future<void> future;

  /**activity data**/




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
    UIUtils.disableFullscreen();
    super.dispose();
  }

  Widget activityIntroView() {
    return InstructionsWidget(
        prefs,
        AppLocalizations.of(context)!.c2a2_intro_message, //todo
        AppLocalizations.of(context)!.ok, //todo
        () {
          setState(() {
            stage = C3A1Stage.activity;
          });
        }
    );
  }

  Widget activityGameView() {
    return Container();
  }

  Widget activityFinishView() {
    return Container();
  }

  @override
  Widget build(BuildContext context) {
    UIUtils.enableFullScreen();
    return Scaffold(
      appBar: AppBar(title: Text(I10N.getI10nString("c3a1_name")!)),
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
      case C3A1Stage.introduction:
        return activityIntroView();
      case C3A1Stage.activity:
        return activityGameView();
      case C3A1Stage.finish:
        return activityFinishView();
    }
  }

}
