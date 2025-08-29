// Lesson box widget to display each lesson
import 'package:flutter/material.dart';

class LessonBox extends StatelessWidget {

  final String lessonText;
  final bool isDragging;

  const LessonBox({super.key, required this.lessonText, this.isDragging = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 100,
      height: 120,
      // padding: const EdgeInsets.all(5),
      // decoration: BoxDecoration(
      //   color: isDragging ? Colors.blue.withOpacity(0.7) : Colors.blueAccent,
      //   borderRadius: BorderRadius.circular(8),
      //   boxShadow: [
      //     if (!isDragging)
      //       const BoxShadow(
      //         color: Colors.black26,
      //         offset: Offset(2, 2),
      //         blurRadius: 4,
      //       ),
      //   ],
      // ),
      alignment: Alignment.center,
      child: Material(
        color: Colors.transparent,
        child: Text(
          lessonText,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}