import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttermoji/fluttermojiFunctions.dart';

class BuddyAvatar extends StatelessWidget {

  final String avatarData;

  const BuddyAvatar(this.avatarData, {super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 75,
          backgroundColor: Colors.grey.shade100,
          child: ClipRRect(
            child: SvgPicture.string(
              FluttermojiFunctions().decodeFluttermojifromString(avatarData),
              height: 100,
              width: 100,
            ),
          ),
        ),
      ],
    );
  }
}
