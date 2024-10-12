import 'package:ephyli/theme/themes.dart';
import 'package:flutter/material.dart';

class TextBubble extends StatelessWidget {
  final String text;
  final Function() onTap;
  const TextBubble({super.key, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: GestureDetector(
        onTap: onTap, // Only last bubble is clickable
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          decoration: BoxDecoration(
            color: Themes.secondaryColor,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Text(
            text,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
