import 'package:ephyli/theme/themes.dart';
import 'package:ephyli/utils/constants.dart';
import 'package:ephyli/widgets/buddy_avatar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../utils/pref_utils.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {

  late Future<SharedPreferences> dataFuture;

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

    return FutureBuilder(
      future: dataFuture,
      builder: (context, snapshot) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Themes.primaryColorDark,
            foregroundColor: Colors.white,
            leading: snapshot.hasData ? SizedBox(
              height: 50,
              child: IconButton(
                icon: PersonalizedAvatar(
                  buddyAvatars[snapshot.data!.getInt(PrefUtils.buddy_selection)!],
                  avatarSize: 25,
                  backgroundRadius: 15,
                ),
                onPressed: () {
                  //TODO - Implement
                },
                tooltip: AppLocalizations.of(context)!.ePhyLiBuddy,
              ),
            ) : const Icon(Icons.account_circle),

            actions: [

              IconButton(
                icon: const Icon(Icons.newspaper_rounded),
                onPressed: () {
                  //TODO
                },
                tooltip: AppLocalizations.of(context)!.news,
              ),

              IconButton(
                icon: const Icon(Icons.text_snippet_rounded),
                onPressed: () {
                  //TODO
                },
                tooltip: AppLocalizations.of(context)!.news,
              ),

              IconButton(
                icon: const Icon(Icons.person_rounded),
                onPressed: () {
                  //TODO
                },
                tooltip: AppLocalizations.of(context)!.profile,
              ),


            ],

          ),
        );
      },
    );


  }
}
