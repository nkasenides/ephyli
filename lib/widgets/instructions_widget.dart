import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../theme/themes.dart';
import '../utils/constants.dart';
import '../utils/pref_utils.dart';
import '../utils/tts_utils.dart';
import 'buddy_avatar_widget.dart';
import 'chat_bubble.dart';

class InstructionsWidget extends StatefulWidget {

  Key? key;
  SharedPreferences prefs;
  String instructionsText;
  String buttonText;
  Function()? onButtonPressed;
  Widget? middleWidget;

  InstructionsWidget(
      this.prefs, this.instructionsText, this.buttonText, this.onButtonPressed, {this.key, this.middleWidget});

  @override
  State<InstructionsWidget> createState() => _InstructionsWidgetState();
}

class _InstructionsWidgetState extends State<InstructionsWidget> {

  bool messageShown = false;

  @override
  void initState() {
    // TTS.speak(widget.instructionsText);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Themes.standardPadding,
      child: SingleChildScrollView(
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
                  child: Column(
                    children: [

                      AnimatedTextKit(
                        animatedTexts: [
                          TypewriterAnimatedText(
                            widget.instructionsText,
                            textStyle: const TextStyle(
                              color: Colors.white,
                            ),
                            speed: const Duration(milliseconds: 1),
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

                    ],
                  ),
                )
              ],
            ),

            messageShown ? widget.middleWidget != null ? const Gap(10) : Container() : Container(),

            messageShown ? widget.middleWidget ?? Container() : Container(),

            messageShown ? widget.middleWidget != null ? const Gap(10) : Container() : Container(),

            messageShown
                ? Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                widget.onButtonPressed != null ? ElevatedButton(
                  onPressed: widget.onButtonPressed,
                  child: Text(widget.buttonText),
                ) : Container(),
              ],
            )
                : Container(),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    TTS.stop();
    super.dispose();
  }

}
