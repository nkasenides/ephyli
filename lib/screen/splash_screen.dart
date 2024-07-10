import 'package:ephyli/theme/app_images.dart';
import 'package:ephyli/theme/themes.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            Image.asset(
              AppImages.logo,
              height: 200,
            ),

            const Gap(30),

            const CircularProgressIndicator(
              color: Themes.primaryColorDark,
            ),

          ],
        ),
      ),
    );
  }
}
