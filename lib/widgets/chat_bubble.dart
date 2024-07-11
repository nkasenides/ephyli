import 'package:ephyli/theme/themes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatBubble extends StatelessWidget {

  const ChatBubble({
    required this.child,
    this.backgroundColor = Themes.primaryColor,
    this.padding = const EdgeInsets.all(10),
    this.margin = const EdgeInsets.all(0),
    super.key
  });

  final Widget child;
  final Color backgroundColor;
  final EdgeInsets padding;
  final EdgeInsets margin;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(5),
          bottomRight: Radius.circular(5),
          topLeft: Radius.zero,
          topRight: Radius.circular(5),
        )
      ),
      width: double.infinity,
      padding: padding,
      margin: margin,
      child: child,
    );
  }

}
