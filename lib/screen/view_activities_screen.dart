import 'package:ephyli/theme/themes.dart';
import 'package:ephyli/utils/i10n.dart';
import 'package:ephyli/utils/text_utils.dart';
import 'package:ephyli/utils/ui_utils.dart';
import 'package:ephyli/widgets/ephyli_gradient.dart';
import 'package:ephyli/widgets/rotate_device_widget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../controller/activity_manager.dart';
import '../model/activity.dart';
import '../model/challenge.dart';
import '../utils/pref_utils.dart';

class ViewActivitiesScreen extends StatefulWidget {

  Challenge challenge;

  ViewActivitiesScreen(this.challenge, {super.key});

  @override
  State<ViewActivitiesScreen> createState() => _ViewActivitiesScreenState();
}

class _ViewActivitiesScreenState extends State<ViewActivitiesScreen> {

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

  List<Activity> _getActivitiesForChallenge() {
    List<Activity> activities = [];
    for (String id in widget.challenge.activityIDs) {
      activities.add(Activity.activities[id]!);
    }
    return activities;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Themes.primaryColorDark,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white,),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(AppLocalizations.of(context)!.activities.capitalizeFirstLetter(),
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: FutureBuilder(
      future: future,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return EphyliGradient(
            child: Container(
              padding: Themes.standardPadding,
              child: ListView.builder(
                itemCount: _getActivitiesForChallenge().length,
                itemBuilder: (context, index) {

                  bool isCompleted = false;
                  bool isUnlocked = false;

                  final Activity activity = _getActivitiesForChallenge()[index];

                  //Determine if completed:
                  List<String> completedActivityIDs = snapshot.data!.getStringList(PrefUtils.activity_completion) ?? [];

                  if (completedActivityIDs.contains(activity.id)) {
                    activity.completed = true;
                    isCompleted = true;
                  }

                  //Determine if unlocked (if previous indices are all completed):

                  debugPrint("Checking if activity ${activity.id} is unlocked...");

                  final activityIndex = widget.challenge.activityIDs.indexOf(activity.id);
                  debugPrint("activityIndex: $activityIndex");
                  bool previousActivitiesUnlocked = true;
                  if (activityIndex == 0) {
                    previousActivitiesUnlocked = true;
                  }
                  else {
                    for (int i = 0; i < activityIndex; i++) {
                      if (!completedActivityIDs.contains(
                          widget.challenge.activityIDs[i])) {
                        previousActivitiesUnlocked = false;
                        break;
                      }
                    }
                  }

                  if (previousActivitiesUnlocked) {
                    isUnlocked = true;
                    activity.unlocked = true;
                  }
                  debugPrint("${activity.id} unlocked: $isUnlocked.");

                  //Check if all activities are completed:
                  bool allCompleted = true;
                  for (Activity a in _getActivitiesForChallenge()) {
                    if (!completedActivityIDs.contains(a.id)) {
                      allCompleted = false;
                      break;
                    }
                  }

                  return Card(
                    color: isCompleted ? Themes.secondaryColorLight : null,
                    child: ListTile(
                      title: Text(I10N.getI10nString(activity.nameRes)! + (activity.completed ? " (${AppLocalizations.of(context)!.completed})" : "")),
                      subtitle: Text(I10N.getI10nString(activity.descriptionRes)!, style: const TextStyle(overflow: TextOverflow.ellipsis),), //TODO - Translate to actual i10n name.
                      onTap: () {
                        if (activity.completed) {
                          //Confirm if user wants to replay the challenge:
                          showDialog(context: context, builder: (context) {
                            return AlertDialog(
                              title: Text(AppLocalizations.of(context)!.areYouSure),
                              content: Text(AppLocalizations.of(context)!.alreadyPlayedActivity),
                              actions: [

                                TextButton(
                                  child: Text(AppLocalizations.of(context)!.yes),
                                  onPressed: () {
                                    Navigator.pop(context);
                                    _startActivity(context, widget.challenge.id, activity.id);
                                  },
                                ),

                                TextButton(
                                  child: Text(AppLocalizations.of(context)!.no),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                ),

                              ],
                            );
                          },);
                        }
                        else {
                          if (activity.unlocked) {
                            _startActivity(context, widget.challenge.id, activity.id);
                          }
                          else {
                            Fluttertoast.showToast(msg: AppLocalizations.of(context)!.activityLockedMessage);
                          }
                        }
                      },
                      trailing: isCompleted ? const Icon(Icons.check, color: Themes.secondaryColorDark,) : const SizedBox(),

                    ),
                  );

                },),
            ),
          );
        }
        return const Center(child: CircularProgressIndicator());
      },
    ),
    );
  }

  _startActivity(BuildContext context, String challengeID, String activityID) {
    try {
      ActivityManager.navigateToActivity(
          context, challengeID, activityID, setState);
    }
    catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(AppLocalizations.of(context)!.unableToStartActivity))
      );
    }
  }

}
