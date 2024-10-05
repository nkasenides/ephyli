import 'package:ephyli/theme/themes.dart';
import 'package:ephyli/utils/text_utils.dart';
import 'package:ephyli/utils/ui_utils.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../controller/activity_manager.dart';
import '../model/activity.dart';
import '../model/challenge.dart';
import '../utils/pref_utils.dart';
import 'fragments.dart';

class ChallengeOverviewFragment extends StatefulWidget {

  Challenge challenge;

  ChallengeOverviewFragment(this.challenge, {super.key});

  @override
  State<ChallengeOverviewFragment> createState() => _ChallengeOverviewFragmentState();
}

class _ChallengeOverviewFragmentState extends State<ChallengeOverviewFragment> {

  late Future<SharedPreferences> future;

  Future<SharedPreferences> getData() async {
    var prefs = await SharedPreferences.getInstance();
    return prefs;
  }

  @override
  void initState() {
    future = getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    UIUtils.portraitOrientation();
    UIUtils.disableFullscreen();


    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(AppLocalizations.of(context)!.activities.capitalizeFirstLetter(),
        ),
      ),
      body: FutureBuilder(
      future: future,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Container(
            padding: Themes.standardPadding,
            child: ListView.builder(
              itemCount: Activity.activities.length,
              itemBuilder: (context, index) {

                bool isCompleted = false;
                bool isUnlocked = false;

                final Activity activity = Activity.activities.values.toList()[index];

                //Determine if completed:
                List<String> completedActivityIDs = snapshot.data!.getStringList(PrefUtils.activity_completion) ?? [];
                if (completedActivityIDs.contains(activity.id)) {
                  activity.completed = true;
                  isCompleted = true;
                }

                //Determine if unlocked (if previous indices are all completed):
                final activityIndex = widget.challenge.activityIDs.indexOf(activity.id);
                bool previousActivitiesUnlocked = true;
                for (int i = 0; i < activityIndex; i++) {
                  if (!completedActivityIDs.contains(widget.challenge.activityIDs[i])) {
                    previousActivitiesUnlocked = false;
                    break;
                  }
                }

                if (previousActivitiesUnlocked) {
                  isUnlocked = true;
                }

                return Card(
                  child: ListTile(
                    title: Text(activity.nameRes), //TODO - Translate to actual i10n name.
                    subtitle: Text(activity.descriptionRes, style: const TextStyle(overflow: TextOverflow.ellipsis),), //TODO - Translate to actual i10n name.
                    onTap: isUnlocked ? () {
                      _startActivity(context, widget.challenge.id, activity.id);
                    } : () {
                      Fluttertoast.showToast(msg: AppLocalizations.of(context)!.activityLockedMessage);
                    },
                    // trailing: isCompleted ? const Icon(Icons.check, color: Themes.primaryColor,) : Container(),
                  ),
                );

              },),
          );
        }
        return const Center(child: CircularProgressIndicator());
      },
      ),
    );
  }

  _startActivity(BuildContext context, String challengeID, String activityID) {
    ActivityManager.navigateToActivity(context, challengeID, activityID);
  }

}
