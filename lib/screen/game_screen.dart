import 'package:ephyli/fragments/tutorial_step_1.dart';
import 'package:ephyli/screen/glossary_screen.dart';
import 'package:ephyli/screen/news_screen.dart';
import 'package:ephyli/screen/profile_screen.dart';
import 'package:ephyli/theme/themes.dart';
import 'package:ephyli/utils/constants.dart';
import 'package:ephyli/utils/ui_utils.dart';
import 'package:ephyli/widgets/buddy_avatar_widget.dart';
import 'package:feature_discovery/feature_discovery.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:fragment_navigate/navigate-control.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../fragments/fragments.dart';
import '../utils/feature_explorer.dart';
import '../utils/pref_utils.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {

  late Future<SharedPreferences> dataFuture;
  bool navBarFeaturesEnabled = false;

  Future<SharedPreferences> _getData() async {
    return await SharedPreferences.getInstance();
  }

  @override
  void initState() {
    super.initState();
    dataFuture = _getData();
  }

  @override
  Widget build(BuildContext context) {

    Fragments.navigator.setDrawerContext = context;

    return FutureBuilder(
      future: dataFuture,
      builder: (context, snapshot) {

        if (snapshot.connectionState != ConnectionState.done) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        var prefs = snapshot.data!;
        navBarFeaturesEnabled = prefs.getBool(PrefUtils.navBarFeaturesEnabled) ?? false;

        if (snapshot.data!.getBool(PrefUtils.tutorial_completed) ?? false) {
          Fragments.navigator.putAndClean(key: Fragments.CHALLENGES_KEY);
        }

        return Scaffold(
          appBar: AppBar(
            backgroundColor: Themes.primaryColorDark,
            foregroundColor: Colors.white,
            leading: snapshot.hasData ? SizedBox(
              height: 50,

              //Buddy:
              child: DescribedFeatureOverlay(
                featureId: FeatureExplorer.buddyFeatureID,
                tapTarget: PersonalizedAvatar(
                  buddyAvatars[snapshot.data!.getInt(PrefUtils.buddy_selection)!],
                  avatarSize: 25,
                  backgroundRadius: 15,
                ),
                title: Text(AppLocalizations.of(context)!.ePhyLiBuddy),
                description: Text(AppLocalizations.of(context)!.buddy_description),
                barrierDismissible: false,
                backgroundDismissible: false,
                backgroundColor: Themes.secondaryColor,
                textColor: Colors.black,
                onComplete: () async {
                  debugPrint("Feature discovered - Buddy");
                  return true;
                },

                child: IconButton(
                  icon: PersonalizedAvatar(
                    buddyAvatars[snapshot.data!.getInt(PrefUtils.buddy_selection)!],
                    avatarSize: 25,
                    backgroundRadius: 15,
                    isEnabled: navBarFeaturesEnabled,
                  ),
                  onPressed: navBarFeaturesEnabled ? () {
                    Fluttertoast.showToast(msg: "TODO - Context specific action."); //TODO Change later
                  } : null,
                  tooltip: AppLocalizations.of(context)!.ePhyLiBuddy,
                ),
              ),
            ) : const Icon(Icons.account_circle),

            actions: [

              //NEWS:
              DescribedFeatureOverlay(
                featureId: FeatureExplorer.newsFeatureID,
                tapTarget: const Icon(Icons.newspaper_rounded),
                title: Text(AppLocalizations.of(context)!.news),
                description: Text(AppLocalizations.of(context)!.news_description),
                barrierDismissible: false,
                backgroundDismissible: false,
                backgroundColor: Themes.secondaryColor,
                textColor: Colors.black,
                onComplete: () async {
                  debugPrint("Feature discovered - News");
                  return true;
                },

                child: IconButton(
                  icon: const Icon(Icons.newspaper_rounded),
                  onPressed: navBarFeaturesEnabled ? () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => const NewsScreen(),));
                  } : null,
                  tooltip: AppLocalizations.of(context)!.news,
                ),
              ),

              //GLOSSARY
              DescribedFeatureOverlay(
                featureId: FeatureExplorer.glossaryFeatureID,
                tapTarget: const Icon(Icons.text_snippet_rounded),
                title: Text(AppLocalizations.of(context)!.glossary),
                description: Text(AppLocalizations.of(context)!.glossary_description),
                barrierDismissible: false,
                backgroundDismissible: false,
                backgroundColor: Themes.secondaryColor,
                textColor: Colors.black,
                onComplete: () async {
                  debugPrint("Feature discovered - Glossary");
                  return true;
                },

                child: IconButton(
                  icon: const Icon(Icons.text_snippet_rounded),
                  onPressed: navBarFeaturesEnabled ? () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => const GlossaryScreen(),));
                  } : null,
                  tooltip: AppLocalizations.of(context)!.glossary,
                ),
              ),


              //PROFILE
              DescribedFeatureOverlay(
                featureId: FeatureExplorer.profileFeatureID,
                tapTarget: const Icon(Icons.person_rounded),
                title: Text(AppLocalizations.of(context)!.profile),
                description: Text(AppLocalizations.of(context)!.profile_description),
                barrierDismissible: false,
                backgroundDismissible: false,
                backgroundColor: Themes.secondaryColor,
                textColor: Colors.black,
                onComplete: () async {
                  debugPrint("Feature discovered - Profile");
                  enableNavBarFeatures(prefs);
                  Fragments.navigator.putPosit(key: Fragments.TUTORIAL_STEP_3_KEY);
                  return true;
                },

                child: IconButton(
                  icon: const Icon(Icons.person_rounded),
                  onPressed: navBarFeaturesEnabled ? () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => const ProfileScreen(),));
                  } : null,
                  tooltip: AppLocalizations.of(context)!.profile,
                ),
              ),

            ],

          ),

          body: StreamBuilder(
            stream: Fragments.navigator.outStreamFragment,
            builder: (context, streamSnapshot) {
              if (streamSnapshot.data != null) {

                // //If the tutorial has been completed, start at the challenges screen.
                // if (snapshot.data!.getBool(PrefUtils.tutorial_completed) ?? false) {
                //   Fragments.navigator.stack.forEach((element) => print(element.key),);
                //   //Only switch if the user is coming from the tutorial:
                //   if (Fragments.navigator.stack.last.key == Fragments.TUTORIAL_STEP_1_KEY) {
                //
                //   }
                // }

                return DefaultTabController(
                  length: streamSnapshot.data!.bottom?.length ?? 1,
                  child: ScreenNavigate(
                    control: Fragments.navigator,
                    child: AnimatedContainer(
                      curve: Curves.bounceIn,
                      duration: const Duration(milliseconds: 200),
                      child: streamSnapshot.data!.fragment,
                    ),
                  ),
                );
              }
              return Container();
            },
          ),

        );
      },
    );

  }

  enableNavBarFeatures(SharedPreferences prefs) {
    prefs.setBool(PrefUtils.navBarFeaturesEnabled, true).then((value) {
      setState(() {
        navBarFeaturesEnabled = true;
      });
    },);
  }

}
