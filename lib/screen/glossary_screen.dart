import 'package:ephyli/theme/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class GlossaryScreen extends StatelessWidget {
  const GlossaryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Themes.primaryColorDark,
        iconTheme: const IconThemeData(color: Colors.white),
        titleTextStyle: Theme.of(context).appBarTheme.titleTextStyle,
        title: Text(AppLocalizations.of(context)!.glossary, style: const TextStyle(color: Colors.white),),
      ),
      body: Container(
        child: Center(child: Text("Glossary screen")),
      ),
    );
  }
}
