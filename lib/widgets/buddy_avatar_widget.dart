import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttermoji/fluttermojiFunctions.dart';

class PersonalizedAvatar extends StatelessWidget {

  final String avatarData;
  final double backgroundRadius;
  final double avatarSize;

  const PersonalizedAvatar(this.avatarData, {super.key, this.backgroundRadius = 75, this.avatarSize = 100});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: backgroundRadius,
          backgroundColor: Colors.grey.shade100,
          child: ClipRRect(
            child: SvgPicture.string(
              FluttermojiFunctions().decodeFluttermojifromString(avatarData),
              height: avatarSize,
              width: avatarSize
            ),
          ),
        ),
      ],
    );
  }
}
