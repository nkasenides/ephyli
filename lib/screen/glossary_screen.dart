import 'package:ephyli/theme/themes.dart';
import 'package:ephyli/widgets/glossary_term_widget.dart';
import 'package:ephyli/widgets/instructions_widget.dart';
import 'package:ephyli/widgets/rotate_device_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/game_badge.dart';

class GlossaryScreen extends StatefulWidget {
  const GlossaryScreen({super.key});

  static Map<String, String> glossary = {};

  @override
  State<GlossaryScreen> createState() => _GlossaryScreenState();
}

class _GlossaryScreenState extends State<GlossaryScreen> {

  late SharedPreferences prefs;
  late Future<void> future;
  bool glossaryBadgeEarned = false;

  Future<void> loadData() async {
    prefs = await SharedPreferences.getInstance();
    glossaryBadgeEarned = await GameBadge.glossaryBadge.isEarned();
  }

  @override
  void initState() {
    future = loadData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    if (GlossaryScreen.glossary.isEmpty) {
      GlossaryScreen.glossary = {
        AppLocalizations.of(context)!.glossary_Attributes: AppLocalizations.of(context)!.glossary_Attributes_desc,
        AppLocalizations.of(context)!.glossary_AffectiveDomain: AppLocalizations.of(context)!.glossary_AffectiveDomain_desc,
        AppLocalizations.of(context)!.glossary_CognitiveDomain: AppLocalizations.of(context)!.glossary_CognitiveDomain_desc,
        AppLocalizations.of(context)!.glossary_Confidence: AppLocalizations.of(context)!.glossary_Confidence_desc,
        AppLocalizations.of(context)!.glossary_Domains: AppLocalizations.of(context)!.glossary_Domains_desc,
        AppLocalizations.of(context)!.glossary_Dualism: AppLocalizations.of(context)!.glossary_Dualism_desc,
        AppLocalizations.of(context)!.glossary_Embodied: AppLocalizations.of(context)!.glossary_Embodied_desc,
        AppLocalizations.of(context)!.glossary_Existentialism: AppLocalizations.of(context)!.glossary_Existentialism_desc,
        AppLocalizations.of(context)!.glossary_HealthLiteracy: AppLocalizations.of(context)!.glossary_HealthLiteracy_desc,
        AppLocalizations.of(context)!.glossary_HumanDimension: AppLocalizations.of(context)!.glossary_HumanDimension_desc,
        AppLocalizations.of(context)!.glossary_KnowledgeAndUnderstanding: AppLocalizations.of(context)!.glossary_KnowledgeAndUnderstanding_desc,
        AppLocalizations.of(context)!.glossary_Literacy: AppLocalizations.of(context)!.glossary_Literacy_desc,
        AppLocalizations.of(context)!.glossary_Monism: AppLocalizations.of(context)!.glossary_Monism_desc,
        AppLocalizations.of(context)!.glossary_Motivation: AppLocalizations.of(context)!.glossary_Motivation_desc,
        AppLocalizations.of(context)!.glossary_MovementCapacities: AppLocalizations.of(context)!.glossary_MovementCapacities_desc,
        AppLocalizations.of(context)!.glossary_MovementPatterns: AppLocalizations.of(context)!.glossary_MovementPatterns_desc,
        AppLocalizations.of(context)!.glossary_MovementVocabulary: AppLocalizations.of(context)!.glossary_MovementVocabulary_desc,
        AppLocalizations.of(context)!.glossary_Phenomenology: AppLocalizations.of(context)!.glossary_Phenomenology_desc,
        AppLocalizations.of(context)!.glossary_PhysicalActivity: AppLocalizations.of(context)!.glossary_PhysicalActivity_desc,
        AppLocalizations.of(context)!.glossary_PhysicalCompetence: AppLocalizations.of(context)!.glossary_PhysicalCompetence_desc,
        AppLocalizations.of(context)!.glossary_PhysicalDomain: AppLocalizations.of(context)!.glossary_PhysicalDomain_desc,
        AppLocalizations.of(context)!.glossary_PhysicalEducation: AppLocalizations.of(context)!.glossary_PhysicalEducation_desc,
        AppLocalizations.of(context)!.glossary_PhysicalLiteracy: AppLocalizations.of(context)!.glossary_PhysicalLiteracy,
        AppLocalizations.of(context)!.glossary_Sport: AppLocalizations.of(context)!.glossary_Sport_desc,
      };
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Themes.primaryColorDark,
        iconTheme: const IconThemeData(color: Colors.white),
        titleTextStyle: Theme.of(context).appBarTheme.titleTextStyle,
        title: Text(AppLocalizations.of(context)!.glossary, style: const TextStyle(color: Colors.white),),
      ),
      body: FutureBuilder(
        future: future,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {

            return OrientationBuilder(builder: (context, orientation) {
              if (orientation == Orientation.portrait) {
                return Column(
                  children: [

                    Expanded(
                      flex: 1,
                      child: InstructionsWidget(
                          prefs,
                          AppLocalizations.of(context)!.glossary_instructions,
                          "",
                          null
                      ),
                    ),

                    Expanded(
                      flex: 2,
                      child: Padding(
                        padding: Themes.standardPadding,
                        child: ListView.builder(
                          itemBuilder: (context, index) {
                            return GlossaryTermWidget(GlossaryScreen.glossary.keys.elementAt(index), glossaryBadgeEarned);
                          },
                          itemCount: GlossaryScreen.glossary.keys.length,
                        ),
                      ),
                    ),
                  ],
                );
              }
              else {
                return Center(child: RotateDeviceWidget(Orientation.portrait),);
              }
            },);
          }
          return const Center(child: CircularProgressIndicator(),);
        },
      )
    );
  }
}
