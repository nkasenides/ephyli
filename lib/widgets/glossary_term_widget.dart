import 'package:ephyli/model/game_badge.dart';
import 'package:ephyli/screen/glossary_screen.dart';
import 'package:ephyli/theme/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class GlossaryTermWidget extends StatelessWidget {

  String term;
  bool glossaryBadgeEarned;

  GlossaryTermWidget(this.term, this.glossaryBadgeEarned, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        child: Padding(
          padding: Themes.standardPadding,
          child: Text(term),
        ),
        onTap: () {

          showDialog(context: context, builder: (context) => AlertDialog(
            title: Text(term),
            content: SingleChildScrollView(child: Text(GlossaryScreen.glossary[term]!)),
            actions: [
              TextButton(
                child: Text(AppLocalizations.of(context)!.ok),
                onPressed: () {
                  if (!glossaryBadgeEarned) {
                    GameBadge.glossaryBadge.earn(context);
                  }
                  Navigator.pop(context);
                },
              )
            ],
          ),
          barrierDismissible: false);

        },
      ),
    );
  }

}
