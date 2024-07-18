import 'package:ephyli/theme/themes.dart';
import 'package:ephyli/widgets/badge_widget.dart';
import 'package:flutter/material.dart';

import '../model/challenge.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'challenge_image.dart';

class ChallengeWidget extends StatelessWidget {

  final Challenge challenge;

  const ChallengeWidget(this.challenge, {super.key});

  @override
  Widget build(BuildContext context) {

    return Container(
      margin: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          color: Colors.black12
        ),
        borderRadius: BorderRadius.circular(5)
      ),
      child: InkWell(
        onTap: () {

        },
        child: Padding(
          padding: Themes.standardPadding,
          child: Column(
            children: [

              ChallengeImage(challenge),

              Text(challenge.name, style: Theme.of(context).textTheme.titleMedium,),

              Text(
                challenge.description,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                style: TextStyle(color: Colors.grey.shade700),
              ),

            ],
          ),
        ),
      ),
    );
  }

}
