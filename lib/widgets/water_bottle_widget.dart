import 'package:flutter/material.dart';

class WaterBottleWidget extends StatelessWidget {
  final double level; // Water level as a percentage (0.0 to 1.0)

  const WaterBottleWidget({super.key, required this.level});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        // Cap of the bottle
        Container(
          width: 40,
          height: 15,
          decoration: BoxDecoration(
            color: Colors.blue[800],
            borderRadius: BorderRadius.circular(5),
          ),
        ),
        Stack(
          alignment: Alignment.bottomCenter,
          children: [
            // Bottle Shape
            Container(
              width: 70,
              height: 170,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.blue, width: 3),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
            ),

            // Animated Water Level
            Positioned(
              bottom: 0,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeInOut,
                width: 70,
                height: 170 * level, // Adjust height based on level
                decoration: BoxDecoration(
                  color: Colors.blue.withOpacity(0.5),
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Text('${(level * 100).toInt()}%'),
      ],
    );
  }
}