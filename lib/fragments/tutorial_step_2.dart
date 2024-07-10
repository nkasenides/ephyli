import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'fragments.dart';

class TutorialStep2 extends StatefulWidget {

  const TutorialStep2({super.key});

  @override
  State<TutorialStep2> createState() => _TutorialStep2State();
}

class _TutorialStep2State extends State<TutorialStep2> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        ElevatedButton(
          child: Text("Go to 1"),
          onPressed: () {
            Fragments.navigator.putPosit(key: Fragments.TUTORIAL_STEP_1_KEY);
          },
        ),

      ],
    );
  }

}
