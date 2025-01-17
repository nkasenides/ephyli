import 'package:ephyli/model/game_badge.dart';
import 'package:ephyli/utils/i10n.dart';
import 'package:ephyli/widgets/language_selection_widget.dart';
import 'package:ephyli/widgets/rotate_device_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:fluttermoji/fluttermojiCircleAvatar.dart';
import 'package:fluttermoji/fluttermojiCustomizer.dart';
import 'package:fluttermoji/fluttermojiFunctions.dart';
import 'package:fluttermoji/fluttermojiThemeData.dart';
import 'package:gap/gap.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../theme/themes.dart';
import '../utils/constants.dart';
import '../utils/pref_utils.dart';
import '../widgets/badge_widget.dart';
import '../widgets/buddy_avatar_widget.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  late SharedPreferences prefs;
  late Future<void> future;
  List<GameBadge> earnedBadges = [];
  late String avatarData;

  Future<void> loadData() async {
    prefs = await SharedPreferences.getInstance();

    avatarData = prefs.getString(PrefUtils.user_avatar)!;

    //Check and add earned badges:
    for (GameBadge badge in GameBadge.gameBadges) {
      bool earned = prefs.getBool("badge_${badge.id}") ?? false;
      if (earned) {
        badge.isOwned = true;
        earnedBadges.add(badge);
      }
    }

  }

  @override
  void initState() {
    future = loadData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return FutureBuilder(
      future: future,
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return const Center(child: CircularProgressIndicator(),);
        }

        return Scaffold(
          appBar: AppBar(
            backgroundColor: Themes.primaryColorDark,
            iconTheme: const IconThemeData(color: Colors.white),
            titleTextStyle: Theme.of(context).appBarTheme.titleTextStyle,
            title: Text(AppLocalizations.of(context)!.profile, style: const TextStyle(color: Colors.white),),
          ),
          body: OrientationBuilder(
            builder: (context, orientation) {
              if (orientation == Orientation.portrait) {
                return SingleChildScrollView(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [

                      Card(
                        color: Colors.white,
                        child: Padding(
                          padding: Themes.standardPadding,
                          child: Column(
                            children: [
                              //Avatar:
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    child: PersonalizedAvatar(
                                        avatarData
                                    ),
                                  ),
                                ],
                              ),

                              // Name and Bio
                              Text(
                                prefs.getString(PrefUtils.username)!,
                                style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                              ),

                              const Gap(20),

                              OutlinedButton(
                                onPressed: () {
                                  showModalBottomSheet(context: context, isScrollControlled: true, builder: (context) {
                                    return Card(
                                      color: Colors.white,
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [

                                          Row(
                                            children: [
                                              IconButton(
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                                icon: const Icon(Icons.arrow_back),
                                              )
                                            ],
                                          ),

                                          const Gap(10),

                                          //Avatar:
                                          SizedBox(
                                            child: FluttermojiCircleAvatar(
                                              backgroundColor: Colors.grey.shade100,
                                            ),
                                          ),

                                          const Gap(40),

                                          //Customizer:
                                          SizedBox(
                                            width: MediaQuery.of(context).orientation == Orientation.landscape ? 500 : null,
                                            child: FluttermojiCustomizer(
                                              autosave: true,
                                              theme: FluttermojiThemeData(
                                                  labelTextStyle: Theme.of(context).textTheme.titleSmall,
                                                  secondaryBgColor: Colors.white
                                              ),
                                            ),
                                          ),

                                          const Gap(20),

                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                            children: [

                                              ElevatedButton(
                                                child: Text(AppLocalizations.of(context)!.ok),
                                                onPressed: () {

                                                  //Encode avatar data:
                                                  FluttermojiFunctions().encodeMySVGtoString().then((value) {
                                                    avatarData = value;
                                                    debugPrint(avatarData);
                                                    prefs.setString(PrefUtils.user_avatar, avatarData).then((value) {
                                                      Navigator.pop(context);
                                                      setState(() { });
                                                    },);
                                                  },);

                                                },
                                              ),
                                            ],
                                          ),

                                        ],
                                      ),
                                    );
                                  },);
                                },
                                child: Text(AppLocalizations.of(context)!.customizeAvatar),
                              ),

                              //Change language:
                              OutlinedButton(
                                child: Text(AppLocalizations.of(context)!.change_language),
                                onPressed: () {
                                  showDialog(context: context, builder: (context) {
                                    return AlertDialog(
                                      title: Text(AppLocalizations.of(context)!.change_language),
                                      content: LanguageSelectionWidget(refreshParentCallback: () {
                                        setState(() {});
                                      },),
                                      actions: [
                                        OutlinedButton(
                                          child: Text(AppLocalizations.of(context)!.ok),
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                        )
                                      ],
                                    );
                                  },);
                                },
                              ),

                            ],
                          ),
                        ),
                      ),

                      const Gap(20),

                      Text(
                        AppLocalizations.of(context)!.badges_view_title,
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),

                      const Gap(20),

                      earnedBadges.isNotEmpty ? GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2
                        ),
                        itemBuilder: (context, index) {
                          GameBadge badge = earnedBadges[index];
                          return Card(
                            color: Colors.white,
                            child: InkWell(
                              child: Padding(
                                padding: Themes.standardPadding,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    BadgeWidget(badge, size: 100,),
                                    const Spacer(),
                                    Text(I10N.getI10nString(earnedBadges[index].nameRes)!, style: const TextStyle(fontSize: 16), textAlign: TextAlign.center,),
                                  ],
                                ),
                              ),
                              onTap: () {
                                showDialog(context: context, builder: (context) {
                                  return AlertDialog(
                                    title: Text(I10N.getI10nString(earnedBadges[index].nameRes)!, textAlign: TextAlign.center,),
                                    content: Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        BadgeWidget(badge, size: 200,),
                                        const Gap(20),
                                        Text(I10N.getI10nString(earnedBadges[index].descriptionRes)!, textAlign: TextAlign.center,),
                                        const Gap(20),
                                        Text(
                                          AppLocalizations.of(context)!.you_have_earned_badge,
                                          style: const TextStyle(
                                              color: Colors.green, fontWeight: FontWeight.bold
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ],
                                    ),
                                    actions: [
                                      OutlinedButton(
                                        child: Text(AppLocalizations.of(context)!.ok),
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                      )
                                    ],
                                  );
                                },);
                              },
                            ),
                          );
                        },
                        itemCount: earnedBadges.length,
                      ) : Text(
                        AppLocalizations.of(context)!.no_badges_yet,
                        textAlign: TextAlign.center,
                        style: const TextStyle(color: Colors.grey),
                      ),

                    ],
                  ),
                );
              }

              //Landscape mode:
              else {
                return Center(child: RotateDeviceWidget(Orientation.portrait));
              }
            },
          ),
        );

      },
    );
  }
}
