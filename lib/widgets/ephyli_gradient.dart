import 'package:animate_gradient/animate_gradient.dart';
import 'package:flutter/material.dart';

import '../theme/themes.dart';

class EphyliGradient extends StatelessWidget {

  List<Color> gradientColors1;
  List<Color> gradientColors2;
  Widget child;

  EphyliGradient({super.key, required this.child, this.gradientColors1 = const [
    Color.fromARGB(255, 220, 220, 255),
    Colors.white,
  ], this.gradientColors2 = const [
    Colors.white,
    Color.fromARGB(255, 240, 235, 235),
  ]});

  @override
  Widget build(BuildContext context) {
    return AnimateGradient(
      primaryColors: gradientColors1,
      secondaryColors: gradientColors2,
      primaryBeginGeometry: const AlignmentDirectional(0, 1),
      primaryEndGeometry: const AlignmentDirectional(0, 2),
      secondaryBeginGeometry: const AlignmentDirectional(2, 0),
      secondaryEndGeometry: const AlignmentDirectional(0, -0.8),
      textDirectionForGeometry: TextDirection.rtl,
      child: child,
    );

  }

}
