import 'package:animate_gradient/animate_gradient.dart';
import 'package:ephyli/utils/constants.dart';
import 'package:ephyli/utils/ui_utils.dart';
import 'package:ephyli/widgets/ephyli_gradient.dart';
import 'package:ephyli/widgets/language_selection_widget.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../theme/app_images.dart';
import '../theme/themes.dart';
import 'onboard_name_screen.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {

  @override
  void dispose() {
    UIUtils.disableFullscreen();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    UIUtils.enableFullScreen();

    return Scaffold(
      body: EphyliGradient(
        child: Center(
          child: Padding(
            padding: Themes.standardPadding,
            child: Column(
              children: [

                //Ephyli logo
                Image.asset(
                  AppImages.logo,
                  width: MediaQuery.of(context).size.width * 2/3,
                  height: 200,
                ),

                const Gap(30),

                //Tagline
                Text(
                  AppLocalizations.of(context)!.tagline,
                  style: Theme.of(context).textTheme.headlineMedium,
                ),

                const Gap(40),

                //Text info:
                Text(
                  AppLocalizations.of(context)!.welcomeText,
                ),

                const Gap(30),

                LanguageSelectionWidget(
                  refreshParentCallback: () {
                    setState(() {});
                  },
                ),

                const Gap(30),

                //Start button
                SizedBox(
                  height: 50,
                  width: MediaQuery.of(context).size.width * 2/3,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const OnboardNameScreen(),)
                      );
                    },
                    child: Text(AppLocalizations.of(context)!.start.toUpperCase()),
                  ),
                ),


              ],
            ),
          )
        ),
      ),

    );
  }
}
