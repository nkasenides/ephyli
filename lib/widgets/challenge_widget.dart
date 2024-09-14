import 'package:ephyli/theme/themes.dart';
import 'package:ephyli/widgets/badge_widget.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/activity.dart';
import '../model/challenge.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../model/game_badge.dart';
import '../utils/pref_utils.dart';
import 'challenge_image.dart';

class ChallengeWidget extends StatefulWidget {

  final Challenge challenge;

  const ChallengeWidget(this.challenge, {super.key});

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
      child: InkWell(
        onTap: !widget.challenge.completed ? () {
          //TODO - Proceed with the next activity.
        } : null,

        //TODO - DEBUGGING ONLY REMOVE LATER
        onLongPress: !widget.challenge.completed ? () {
          debugPrint("Long press complete test");
          for (String activityID in widget.challenge.activityIDs) {
            widget.challenge.completeActivity(activityID);
          }
          onActivityCompleted(context);
        } : () {
          debugPrint("Long press reset test");
          for (String activityID in widget.challenge.activityIDs) {
            widget.challenge.resetActivity(activityID);
          }
          onChallengeReset();
        },

        child: Column(
          children: [

            ChallengeImage(widget.challenge),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  Text(widget.challenge.nameRes, style: Theme.of(context).textTheme.titleMedium,),

                  Text(
                    widget.challenge.descriptionRes,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: TextStyle(color: Colors.grey.shade700),
                  ),
                ],
              ),
            ),

            const Spacer(),

            widget.challenge.completed
                ? Container(
                  padding: const EdgeInsets.all(5),
                  color: Colors.green,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(AppLocalizations.of(context)!.completed, style: TextStyle(color: Colors.white),),
                      const Gap(10),
                      const Icon(Icons.check, color: Colors.white, size: 20,)
                    ],
                  ),
                )
                : Text("${widget.challenge.activityIDs.length} ${AppLocalizations.of(context)!.activities}",
            style: TextStyle(color: Colors.grey),),

          ],
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
      List<String> activityCompletionList = prefs.getStringList(PrefUtils.activity_completion_key) ?? [];

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
              //Earn the badge for the challenge, and update the state of the UI:
              badge.earn(context);
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
