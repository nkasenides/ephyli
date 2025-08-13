import 'package:ephyli/theme/themes.dart';
import 'package:flutter/material.dart';
import '../../l10n/app_localizations.dart';
import 'package:gap/gap.dart';

class RotateDeviceWidget extends StatelessWidget {

  Orientation orientation;

  RotateDeviceWidget(this.orientation, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              orientation == Orientation.landscape ?
              Icons.stay_current_landscape_rounded : Icons.stay_current_portrait_rounded,
              size: 80,
            ),

            const Icon(
              Icons.rotate_right,
              size: 80,
            ),
          ],
        ),

        const Gap(20),

        Text(AppLocalizations.of(context)!.pleaseTurnDevice)

      ],
    );
  }

}
