import 'dart:math';

import 'package:ephyli/screen/view_activities_screen.dart';
import 'package:ephyli/theme/themes.dart';
import 'package:ephyli/utils/i10n.dart';
import 'package:ephyli/widgets/badge_widget.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gap/gap.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../fragments/fragments.dart';
import '../model/activity.dart';
import '../model/challenge.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../model/game_badge.dart';
import '../utils/pref_utils.dart';
import 'challenge_image.dart';

class ChallengeWidget extends StatefulWidget {

  final Challenge challenge;
  final Function refresher;
  final bool dense;
  final bool adminMode;

  const ChallengeWidget(this.challenge, this.adminMode, {super.key, required this.refresher, this.dense = false});

  @override
  State<ChallengeWidget> createState() => _ChallengeWidgetState();
}

class _ChallengeWidgetState extends State<ChallengeWidget> {

  @override
  Widget build(BuildContext context) {

    return Container(
      margin: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        color: widget.challenge.completed ? Colors.green.shade50 : Colors.white,
        border: Border.all(
          width: 1,
          color: Colors.black12
        ),
        borderRadius: BorderRadius.circular(5)
      ),
      child: widget.challenge.unlocked ? InkWell(

        onTap: () async {
          if (context.mounted) {
              Navigator.push(context, MaterialPageRoute(builder: (context) =>
                  ViewActivitiesScreen(widget.challenge),)).then((value) {
                    widget.refresher();
                  },);
            }
            else {
              Fluttertoast.showToast(msg: AppLocalizations.of(context)!.error);
            }
        },

        //TODO - DEBUGGING ONLY REMOVE LATER
        onLongPress: widget.adminMode ? !widget.challenge.completed ? () {
          debugPrint("Long press complete test");
          for (String activityID in widget.challenge.activityIDs) {
            widget.challenge.completeActivity(activityID);
          }
          onActivityCompleted(context);
          widget.refresher();
        } : () {
          debugPrint("Long press reset test");
          for (String activityID in widget.challenge.activityIDs) {
            widget.challenge.resetActivity(activityID);
          }
          onChallengeReset();
        } : null,

        child: Column(
          children: [

            const Gap(10),

            ChallengeImage(widget.challenge),

            const Gap(5),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Column(
                children: [
                  Text(I10N.getI10nString(widget.challenge.nameRes)!, style: Theme.of(context).textTheme.titleMedium,),

                  // !widget.dense ? Text(
                  //   I10N.getI10nString(widget.challenge.descriptionRes)!,
                  //   overflow: TextOverflow.ellipsis,
                  //   maxLines: 2,
                  //   style: TextStyle(color: Colors.grey.shade700),
                  //   textAlign: TextAlign.center,
                  // ) : Container(),
                ],
              ),
            ),

            const Spacer(),

            !widget.dense ? widget.challenge.completed
                ? Container(
                  padding: const EdgeInsets.all(5),
                  color: Colors.green,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(AppLocalizations.of(context)!.completed, style: const TextStyle(color: Colors.white),),
                      const Gap(10),
                      const Icon(Icons.check, color: Colors.white, size: 20,)
                    ],
                  ),
                )
                : Text("${widget.challenge.activityIDs.length} ${AppLocalizations.of(context)!.activities}",
            style: const TextStyle(color: Colors.grey),) : Container(),

          ],
        ),
      ) : InkWell(
        onTap: () {
          Fluttertoast.showToast(msg: AppLocalizations.of(context)!.challengeLockedMessage, backgroundColor: Colors.red, textColor: Colors.white);
        },
        child: Padding(
          padding: Themes.standardPadding,
          child: Column(
            children: [
              const Gap(10),
              Opacity(opacity: 0.5,child: Icon(Icons.lock, color: Colors.lime.shade900, size: 75),),
              const Spacer(),
              !widget.dense ? Text(AppLocalizations.of(context)!.challengeLocked, textAlign: TextAlign.center, style: TextStyle(color: Colors.grey),) : Container(),
            ],
          ),
        ),
      ),
    );

  }

  //TEST ONLY
  onChallengeReset() {
    setState(() {
      widget.challenge.completed = false;
    });
  }

  //Once an activity is completed,
  onActivityCompleted(context) {
    debugPrint("onActivityCompleted");
    SharedPreferences.getInstance().then((prefs) {
      List<String> activityCompletionList = prefs.getStringList(PrefUtils.activity_completion) ?? [];

      bool challengeCompleted = true;

      //Check if all activities were completed, so that challenge completion is detected:
      for (String activityID in widget.challenge.activityIDs) {
        if (!activityCompletionList.contains(activityID)) {
          challengeCompleted = false;
          break;
        }
      }

      if (challengeCompleted) {
        if (widget.challenge.badgeIDs.isNotEmpty) {
          for (String badgeID in widget.challenge.badgeIDs) {
            var badge = GameBadge.findBadge(badgeID);
            if (badge != null) {
              //Earn the badge for the challenge
              badge.earn(context);

              bool unlocksFutureChallenges = false;

              //Unlock next challenge(s):
              for (var nextChallengeID in widget.challenge.unlocksChallengesIDs) {
                Challenge? nextChallenge = Challenge.findChallenge(nextChallengeID);
                if (nextChallenge != null) {
                  nextChallenge.unlock();
                  unlocksFutureChallenges = true;
                }
              }

              if (unlocksFutureChallenges) {
                setState(() { });
                Fluttertoast.showToast(
                    msg: AppLocalizations.of(context)!.nextChallengeUnlocked);
              }

            }
          }
        }
        setState(() {
          widget.challenge.completed = true;
        });
      }

    },);
  }

}
