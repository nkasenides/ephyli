import 'package:ephyli/app.dart';
import 'package:flutter/material.dart';

import '../theme/themes.dart';
import '../utils/language.dart';

class LanguageSelectionWidget extends StatefulWidget {

  final Function refreshParentCallback;

  const LanguageSelectionWidget({required this.refreshParentCallback, super.key});

  @override
  State<LanguageSelectionWidget> createState() => _LanguageSelectionWidgetState();
}

class _LanguageSelectionWidgetState extends State<LanguageSelectionWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: Language.allLocales.map((e) {
        return IconButton(
          padding: EdgeInsets.zero,
          style: IconButton.styleFrom(
            backgroundColor: Language.getCurrentLocale() == e ? Themes.secondaryColor : null,
          ),
          icon: Image.asset(Language.getFlagResourceForLocale(e), height: 35,),
          onPressed: () {
            Language.changeLocale(e).then((_) => setState(() {
              widget.refreshParentCallback();
              EPhyLiApp.of(context)!.update();
            }));
          },
        );
      }).toList(),
    );
  }
}
