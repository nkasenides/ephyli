import 'package:shared_preferences/shared_preferences.dart';

class PrefUtils {

  static const String languagePref = "language_preference_key"; //String
  static const String username = "username_key"; //String
  static const String user_avatar = "user_avatar_key"; //String
  static const String buddy_selection = "buddy_selection_key"; //int
  static const String onboarding_completed = "onboarding_completed_key"; //bool
  static const String tutorial_completed = "tutorial_completed_key"; //bool
  static const String badge_data = "badge_data_key"; //String
  static const String navBarFeaturesEnabled = "navBarFeaturesEnabled_key"; //bool
  static const String activity_completion = "activity_completion_key"; //List
  static const String unlocked_challenges = "unlocked_challenges_key"; //List

  static Future<void> finishActivity(String activityID) async {
    var prefs = await SharedPreferences.getInstance();
    List<String>? completedActivityIDs = prefs.getStringList(activity_completion) ?? [];
    completedActivityIDs.add(activityID);
    prefs.setStringList(activity_completion, completedActivityIDs);
  }

}