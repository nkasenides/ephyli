import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../theme/themes.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Themes.primaryColorDark,
        iconTheme: const IconThemeData(color: Colors.white),
        titleTextStyle: Theme.of(context).appBarTheme.titleTextStyle,
        title: Text(AppLocalizations.of(context)!.news, style: const TextStyle(color: Colors.white),),
      ),
      body: Container(
        child: Center(child: Text("News screen")),
      ),
    );
  }
}
