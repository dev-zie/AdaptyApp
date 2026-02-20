import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  const TextWidget({
    super.key,
    required this.text,
    required this.fontsize,
    this.color = Colors.white,
    this.textAlign = TextAlign.start,
  });

  final TextAlign textAlign;
  final String text;
  final double fontsize;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: TextStyle(color: color, fontSize: fontsize),
    );
  }
}
