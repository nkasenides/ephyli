import 'package:ephyli/theme/themes.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import '../../l10n/app_localizations.dart';

class HealthBar extends StatelessWidget {
  final int lives; // Total number of lives (0-20)

  HealthBar({required this.lives});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: Themes.standardPadding,
      decoration: BoxDecoration(
        color: Themes.secondaryColorLight,
        border: Border.all(color: Themes.secondaryColorDark, width: 1),
        borderRadius: const BorderRadius.all(Radius.circular(5)),
      ),
      child: Column(
        children: [

          // Display Lives Left
          Text(
            "${AppLocalizations.of(context)!.c13_lives_remaining}: $lives",
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),

          const Gap(10),

          FittedBox(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(10, (index) {
                int heartIndex = index * 2; // Each heart represents 2 lives
            
                if (lives > heartIndex + 1) {
                  return const Icon(Icons.favorite, color: Colors.red, size: 30); // Full heart (2 lives)
                } else if (lives > heartIndex) {
                  return Icon(Icons.favorite, color: Colors.red[100], size: 30); // Half heart (1 life)
                } else {
                  return const Icon(Icons.favorite_border, color: Colors.grey, size: 30); // Empty heart (0 lives)
                }
              }),
            ),
          ),
        ],
      ),
    );
  }
}