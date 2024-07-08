import 'package:ephyli/screen/buddy_screen.dart';
import 'package:ephyli/theme/themes.dart';
import 'package:ephyli/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttermoji/fluttermoji.dart';
import 'package:fluttermoji/fluttermojiCustomizer.dart';
import 'package:fluttermoji/fluttermojiFunctions.dart';
import 'package:fluttermoji/fluttermojiThemeData.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:gap/gap.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/pref_utils.dart';

class OnboardAvatarScreen extends StatefulWidget {

  const OnboardAvatarScreen({super.key});

  @override
  State<OnboardAvatarScreen> createState() => _OnboardAvatarScreenState();
}

class _OnboardAvatarScreenState extends State<OnboardAvatarScreen> {

  String avatarData = defaultAvatarData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.only(
            top: 50,
            bottom: 15,
            left: 15,
            right: 15
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            //Avatar:
            FluttermojiCircleAvatar(
              backgroundColor: Colors.grey.shade100,
            ),

            const Gap(40),

            //Customizer:
            FluttermojiCustomizer(
              autosave: false,
              theme: FluttermojiThemeData(
                  labelTextStyle: Theme.of(context).textTheme.titleSmall,
                  secondaryBgColor: Colors.white
              ),
            ),

            const Gap(20),

            //Proceed button:
            SizedBox(
              height: 50,
              width: MediaQuery.of(context).size.width * 2/3,
              child: ElevatedButton(
                child: Text(AppLocalizations.of(context)!.proceed.toUpperCase()),
                onPressed: () async {

                  //Encode avatar data:
                  FluttermojiFunctions().encodeMySVGtoString().then((value) {
                    avatarData = value;
                  },);

                  //Save to prefs and move on:
                  var prefs = await SharedPreferences.getInstance();
                  prefs.setString(PrefUtils.user_avatar, avatarData).then((value) {
                    Navigator.push(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (_, __, ___) => const BuddyScreen(),
                        transitionDuration: const Duration(milliseconds: 200),
                        transitionsBuilder: (_, a, __, c) => FadeTransition(opacity: a, child: c),
                      ),
                    );
                  },);

                },
              ),
            ),

          ],
        ),
      ),
    );
  }

}
