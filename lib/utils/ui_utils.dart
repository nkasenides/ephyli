import 'dart:math';

import 'package:confetti/confetti.dart';
import 'package:ephyli/model/game_badge.dart';
import 'package:ephyli/theme/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:gap/gap.dart';
import 'package:url_launcher/url_launcher.dart';

import '../widgets/badge_widget.dart';

class UIUtils {

  static AlertDialog createBadgeDialog(GameBadge badge, BuildContext context) {

    final ConfettiController confettiController = ConfettiController(
        duration: const Duration(seconds: 1)
    );

    confettiController.play();

    return AlertDialog(
      title: Text(badge.nameRes, textAlign: TextAlign.center,),
      content: Column(
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

          Text(badge.descriptionRes, textAlign: TextAlign.center,),


        ],
      ),
      actions: [

        //view badges
        TextButton(
          child: Text(AppLocalizations.of(context)!.viewBadges),
          onPressed: () {
            //TODO
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

  static landscapeOrientation() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
  }

  static portraitOrientation() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  static restoreAllOrientations() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  static enableFullScreen() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
  }

  static disableFullscreen() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: SystemUiOverlay.values);
  }

  static visitLink(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri)) {
      throw Exception('Could not launch $uri');
    }
  }

}