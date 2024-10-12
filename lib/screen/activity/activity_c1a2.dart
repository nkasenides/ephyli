import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:ephyli/utils/ui_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:fluttermoji/fluttermojiCircleAvatar.dart';
import 'package:gap/gap.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../controller/activity_manager.dart';
import '../../model/activity.dart';
import '../../model/challenge.dart';
import '../../model/game_badge.dart';
import '../../theme/themes.dart';
import '../../utils/constants.dart';
import '../../utils/i10n.dart';
import '../../utils/pref_utils.dart';
import '../../widgets/buddy_avatar_widget.dart';
import '../../widgets/chat_bubble.dart';
import '../../widgets/text_bubble.dart';

class ActivityC1a2 extends StatefulWidget {
  const ActivityC1a2({super.key});

  @override
  State<ActivityC1a2> createState() => _ActivityC1a2State();
}

enum C1A2Stage {
  main,
  finish
}

class _ActivityC1a2State extends State<ActivityC1a2> {

  final String activityID = "c1a2";

  late Future future;
  late SharedPreferences prefs;

  //Bubble activity
  int bubbleIndex = 0;
  bool finishVisible = false;

  bool messageShown = false;
  bool message2Shown = false;
  C1A2Stage stage = C1A2Stage.main;

  Future<void> loadData() async {
    SharedPreferences.getInstance().then((value) => prefs = value,);
  }

  @override
  void initState() {
    future = loadData();
    super.initState();
  }

  Widget luggageView() {

    final List<String> bubbleTexts = [
      AppLocalizations.of(context)!.c1a2_bubble1,
      AppLocalizations.of(context)!.c1a2_bubble2,
      AppLocalizations.of(context)!.c1a2_bubble3,
      AppLocalizations.of(context)!.c1a2_bubble4,
      AppLocalizations.of(context)!.c1a2_bubble5,
    ];

    return SingleChildScrollView(
      child: Container(
        padding: Themes.standardPadding,
        child: Column(
          children: [

            //Buddy + instructions:
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
                        AppLocalizations.of(context)!.c1a2_bubbles_instructions,
                        textStyle: const TextStyle(color: Colors.white,),
                        speed: const Duration(milliseconds: 0),
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

            const Divider(),


            for (int i = 0; i <= bubbleIndex; i++) Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [

                  i == bubbleIndex ? Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: SizedBox(
                      width: 50,
                      height: 50,
                      child: FluttermojiCircleAvatar(
                        backgroundColor: Colors.grey.shade100,
                      ),
                    ),
                  ) : const SizedBox(
                    width: 50,
                    height: 50,
                  ),

                  Expanded(
                    child: TextBubble(text: bubbleTexts[i], onTap: () {
                      debugPrint("click - index $bubbleIndex");

                      //Show next bubble:
                      if (i == bubbleIndex) {
                        setState(() {
                          if (bubbleIndex < bubbleTexts.length - 1) {
                            bubbleIndex++;
                          }
                        });
                      }

                      //Show the button:
                      if (bubbleIndex == bubbleTexts.length - 1) {
                        setState(() {
                          finishVisible = true;
                        });
                      }

                    }),
                  ),
                ]
            ),

            const Gap(20),

            Visibility(
              visible: finishVisible,
              child: ElevatedButton(
                child: Text(AppLocalizations.of(context)!.next),
                onPressed: () {
                  setState(() {
                    setState(() {
                      stage = C1A2Stage.finish;
                    });
                  });
                },
              ),
            ),



          ],
        ),
      ),
    );
  }

  Widget finishView() {
    return Container(
      padding: Themes.standardPadding,
      child: Column(
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
                      AppLocalizations.of(context)!.c1a2_finish,
                      textStyle: const TextStyle(color: Colors.white,),
                      speed: const Duration(milliseconds: 50),
                    ),
                  ],
                  displayFullTextOnTap: true,
                  isRepeatingAnimation: false,
                  onFinished: () {
                    setState(() {
                      message2Shown = true;
                    });
                  },
                  onTap: () {
                    setState(() {
                      message2Shown = true;
                    });
                  },
                ),
              )

            ],
          ),

          const Gap(20),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              message2Shown ? OutlinedButton(
                onPressed: () {
                  UIUtils.visitLink("https://bjsm.bmj.com/content/48/3/174.long");
                },
                child: Text(AppLocalizations.of(context)!.clickToViewArticle),
              ) : Container(),

              const Gap(20),

              message2Shown ? Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    child: Text(AppLocalizations.of(context)!.finish),
                    onPressed: () {
                      setState(() {
                        ActivityManager.completeActivity(activityID).then((value) {

                          //Find all badges related to this activity and award them:
                          Challenge.challenge1.badgeIDs.forEach((badgeID) {
                            var badge = GameBadge.findBadge(badgeID);
                            badge!.earn(context);
                          },);

                          Navigator.pop(context, "_");
                          Navigator.pop(context, "_");
                        },);
                      });
                    },
                  ),
                ],
              ) : Container(),
            ],
          )

        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back),
        ),
        backgroundColor: Themes.primaryColorDark,
        iconTheme: const IconThemeData(color: Colors.white),
        title: Text(I10N.getI10nString(Activity.activities[activityID]!.nameRes)!, style: const TextStyle(color: Colors.white),), //TODO - Get name out of resource
      ),
      body: FutureBuilder(
          future: future,
          builder: (context, snapshot) {

            if (snapshot.connectionState == ConnectionState.done) {

              // debugPrint(terms.toString());

              return Padding(
                  padding: const EdgeInsets.all(2),
                  child: getChildView()
              );

            }
            return const Center(child: CircularProgressIndicator(),);
          }
      ),
    );
  }

  Widget getChildView() {
    switch (stage) {
      case C1A2Stage.main:
        return luggageView();
      case C1A2Stage.finish:
        return finishView();
    }
  }

}
