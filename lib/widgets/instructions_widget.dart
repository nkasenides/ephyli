import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../theme/themes.dart';
import '../utils/constants.dart';
import '../utils/pref_utils.dart';
import 'buddy_avatar_widget.dart';
import 'chat_bubble.dart';

class InstructionsWidget extends StatefulWidget {

  SharedPreferences prefs;
  String instructionsText;
  String buttonText;
  Function() onButtonPressed;

  InstructionsWidget(
      this.prefs, this.instructionsText, this.buttonText, this.onButtonPressed, {super.key});

  @override
  State<InstructionsWidget> createState() => _InstructionsWidgetState();
}

class _InstructionsWidgetState extends State<InstructionsWidget> {

  bool messageShown = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Themes.standardPadding,
      child: Column(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              PersonalizedAvatar(
                buddyAvatars[widget.prefs.getInt(PrefUtils.buddy_selection)!],
                backgroundRadius: 25,
                avatarSize: 35,
              ),
              ChatBubble(
                margin: const EdgeInsets.only(left: 50),
                child: AnimatedTextKit(
                  animatedTexts: [
                    TypewriterAnimatedText(
                      widget.instructionsText,
                      textStyle: const TextStyle(
                        color: Colors.white,
                      ),
                      speed: const Duration(milliseconds: 50),
                    ),
                  ],
                  displayFullTextOnTap: true,
                  isRepeatingAnimation: false,
                  onFinished: () {
                    setState(() {
                      messageShown = true;
                    });
                  },
                  onTap: () {
                    setState(() {
                      messageShown = true;
                    });
                  },
                ),
              )
            ],
          ),
          messageShown
              ? Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButton(
                onPressed: widget.onButtonPressed,
                child: Text(widget.buttonText),
              ),
            ],
          )
              : Container(),
        ],
      ),
    );
  }
}
