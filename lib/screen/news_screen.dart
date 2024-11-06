import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:gap/gap.dart';
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
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Gap(50),
              const Icon(Icons.construction, color: Colors.grey, size: 60,),
              Gap(20),
              Text(AppLocalizations.of(context)!.under_construction),
              Gap(20),
              OutlinedButton(
                onPressed: () => Navigator.pop(context),
                child: Text(AppLocalizations.of(context)!.back),
              )

            ],
          ),
        ],
      ),
    );
  }
}
