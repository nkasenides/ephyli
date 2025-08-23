import 'dart:math';

import 'package:ephyli/screen/onboard_avatar_screen.dart';
import 'package:ephyli/theme/themes.dart';
import 'package:ephyli/utils/text_utils.dart';
import 'package:ephyli/utils/ui_utils.dart';
import 'package:ephyli/widgets/ephyli_gradient.dart';
import 'package:flutter/material.dart';
import '../../l10n/app_localizations.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttermoji/fluttermoji.dart';
import 'package:fluttermoji/fluttermojiFunctions.dart';
import 'package:gap/gap.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/constants.dart';
import '../utils/pref_utils.dart';

class OnboardNameScreen extends StatefulWidget {

  const OnboardNameScreen({super.key});

  @override
  State<OnboardNameScreen> createState() => _OnboardNameScreenState();
}

class _OnboardNameScreenState extends State<OnboardNameScreen> {

  TextEditingController nameController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  String avatarData = defaultAvatarData;

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: EphyliGradient(
        child: Padding(
          padding: const EdgeInsets.only(
              left: 15,
              right: 15
          ),
          child: Form(
            key: _formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
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

                // //Avatar
                // SizedBox(
                //     child: CircleAvatar(
                //       backgroundColor: Colors.grey.shade100,
                //       radius: 70,
                //       child: ClipRRect(
                //         borderRadius: const BorderRadius.all(
                //           Radius.circular(
                //             90,
                //           ),
                //         ),
                //         child: SvgPicture.string(
                //           FluttermojiFunctions().decodeFluttermojifromString(avatarData),
                //           width: 300,
                //           height: 300,
                //         ),
                //       ),
                //     )
                // ),

                CircleAvatar(
                  backgroundColor: Colors.grey.shade200,
                  radius: 70,
                  child: const ClipRRect(
                    borderRadius: BorderRadius.all(
                      Radius.circular(90,),
                    ),
                    child: Icon(Icons.person, size: 90, color: Themes.primaryColorDark,),
                  ),
                ),

                const Gap(20),

                //Name
                SizedBox(
                  width: min(500, MediaQuery.of(context).size.width),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: AppLocalizations.of(context)!.whatIsYourName,
                    ),
                    controller: nameController,
                    autofocus: true,
                    textCapitalization: TextCapitalization.words,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return AppLocalizations.of(context)!.pleaseProvideAValue;
                      }

                      if (!value.isValidPersonName) {
                        return AppLocalizations.of(context)!.invalidPersonName;
                      }

                      return null;

                    },
                  ),
                ),

                const Gap(40),

                //Proceed button:
                SizedBox(
                  height: 50,
                  width: MediaQuery.of(context).size.width * 2/3,
                  child: ElevatedButton(
                    child: Text(TextUtils.removeGreekAccents(AppLocalizations.of(context)!.proceed.toUpperCase())),
                    onPressed: () async {

                      if (_formKey.currentState!.validate()) {

                        var prefs = await SharedPreferences.getInstance();
                        prefs.setString(PrefUtils.username, nameController.text).then((value) {

                          debugPrint("Saved username in prefs: ${nameController.text}");

                          Navigator.push(
                            context,
                            PageRouteBuilder(
                              pageBuilder: (_, __, ___) => const OnboardAvatarScreen(),
                              transitionDuration: const Duration(milliseconds: 200),
                              transitionsBuilder: (_, a, __, c) => FadeTransition(opacity: a, child: c),
                            ),
                          );
                        },);

                      }

                    },
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
