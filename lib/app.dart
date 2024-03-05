import 'package:flutter/material.dart';

import 'home_screen.dart';

class EPhyLiApp extends StatelessWidget {
  const EPhyLiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "ePhyLi app",
      home: HomeScreen(),
    );
  }
}
