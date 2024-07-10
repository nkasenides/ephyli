import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'fragments.dart';

class TutorialStep1 extends StatefulWidget {

  const TutorialStep1({super.key});

  @override
  State<TutorialStep1> createState() => _TutorialStep1State();
}

class _TutorialStep1State extends State<TutorialStep1> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        ElevatedButton(
          child: Text("Go to 2"),
          onPressed: () {
            Fragments.navigator.putPosit(key: Fragments.TUTORIAL_STEP_2_KEY);
          },
        ),

      ],
    );
  }

}
