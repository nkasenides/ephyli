import 'dart:math';

import 'package:confetti/confetti.dart';
import 'package:ephyli/model/game_badge.dart';
import 'package:ephyli/screen/profile_screen.dart';
import 'package:ephyli/theme/themes.dart';
import 'package:ephyli/utils/i10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:gap/gap.dart';
import 'package:url_launcher/url_launcher.dart';

import '../widgets/badge_widget.dart';

class UIUtils {

  static bool snackbarIsShowing = false;

  static AlertDialog createBadgeDialog(GameBadge badge, BuildContext context) {

    final ConfettiController confettiController = ConfettiController(
        duration: const Duration(seconds: 1)
    );

    confettiController.play();

    return AlertDialog(
      title: Text(I10N.getI10nString(badge.nameRes)!, textAlign: TextAlign.center,),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [

            ConfettiWidget(
              confettiController: confettiController,
              blastDirectionality: BlastDirectionality.explosive,
              colors: const [ Themes.primaryColor, Themes.primaryColorDark, Themes.secondaryColor ],
              blastDirection: pi,
              numberOfParticles: 5,
              createParticlePath: _drawStarAnimation,
            ),

            const Divider(),

            const Gap(20),

            Text(AppLocalizations.of(context)!.newBadgeText, textAlign: TextAlign.center,),

            const Gap(20),

            BadgeWidget(badge),

            const Gap(20),

            Text(I10N.getI10nString(badge.descriptionRes)!, textAlign: TextAlign.center,),


          ],
        ),
      ),
      actions: [

        //view badges
        TextButton(
          child: Text(AppLocalizations.of(context)!.viewBadges),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const ProfileScreen(),));
          },
        ),

        //ok
        TextButton(
          child: Text(AppLocalizations.of(context)!.ok),
          onPressed: () {
            Navigator.pop(context);
          },
        ),

      ],
    );
  }

  static Path _drawStarAnimation(Size size) {
    // Method to convert degree to radians
    double degToRad(double deg) => deg * (pi / 180.0);

    const numberOfPoints = 5;
    final halfWidth = size.width / 2;
    final externalRadius = halfWidth;
    final internalRadius = halfWidth / 2.5;
    final degreesPerStep = degToRad(360 / numberOfPoints);
    final halfDegreesPerStep = degreesPerStep / 2;
    final path = Path();
    final fullAngle = degToRad(360);
    path.moveTo(size.width, halfWidth);

    for (double step = 0; step < fullAngle; step += degreesPerStep) {
      path.lineTo(halfWidth + externalRadius * cos(step),
          halfWidth + externalRadius * sin(step));
      path.lineTo(halfWidth + internalRadius * cos(step + halfDegreesPerStep),
          halfWidth + internalRadius * sin(step + halfDegreesPerStep));
    }
    path.close();
    return path;
  }

  // static Future<void> landscapeOrientation() async {
  //   await SystemChrome.setPreferredOrientations([
  //     DeviceOrientation.landscapeRight,
  //     DeviceOrientation.landscapeLeft,
  //   ]);
  // }
  //
  // static Future<void> portraitOrientation() async {
  //   await SystemChrome.setPreferredOrientations([
  //     DeviceOrientation.portraitUp,
  //     DeviceOrientation.portraitDown,
  //   ]);
  // }
  //
  // static Future<void> restoreAllOrientations() async {
  //   await SystemChrome.setPreferredOrientations([
  //     DeviceOrientation.landscapeRight,
  //     DeviceOrientation.landscapeLeft,
  //     DeviceOrientation.portraitUp,
  //     DeviceOrientation.portraitDown,
  //   ]);
  // }

  static Future<void> enableFullScreen() async {
    await SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
  }

  static Future<void> disableFullscreen() async {
    await SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: SystemUiOverlay.values);
  }

  static visitLink(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri)) {
      throw Exception('Could not launch $uri');
    }
  }

  static showFeedbackBar(BuildContext context, bool rightAnswer, {String text = ""}) {
    if (!snackbarIsShowing) {
      snackbarIsShowing = true;
      ScaffoldMessenger
          .of(context)
          .showSnackBar(
          SnackBar(
            duration: Duration(seconds: (text == "") ? 1 : 3),
            padding: Themes.standardPadding,
            backgroundColor: rightAnswer ? Colors.green : Colors.red,
            content: text == "" ? Icon(
              rightAnswer ? Icons.check : Icons.close, color: Colors.white,
            ) : Wrap(
              direction: Axis.horizontal,
              alignment: WrapAlignment.center,
              children: [
                Icon(rightAnswer ? Icons.check : Icons.close, color: Colors.white,),
                Text(text, textAlign: TextAlign.center,),
              ],
            ),
          )
      )
          .closed
          .then((value) {
        snackbarIsShowing = false;
      },);
    }
  }

}