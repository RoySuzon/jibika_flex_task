import 'package:flutter/material.dart';
import 'package:jibika_flex_task/components/dimention_extention.dart';

class CustomRichText extends StatelessWidget {
  const CustomRichText(
      {super.key,
      required this.text,
      this.fontSize,
      this.preTextColor,
      this.postTextColor});
  final String text;
  final double? fontSize;
  final Color? preTextColor;
  final Color? postTextColor;

  @override
  Widget build(BuildContext context) {
    return RichText(
        text: TextSpan(
            text: text == "" ? "" : text[0],
            style: TextStyle(
                color: preTextColor ?? Colors.red,
                fontWeight: FontWeight.bold,
                fontSize: fontSize != null
                    ? (fontSize! + context.width(6))
                    : context.width(18)),
            children: [
          TextSpan(
              text: text == "" ? "" : text.substring(1),
              style: TextStyle(
                  color: postTextColor ?? Colors.black,
                  fontWeight: FontWeight.bold,
                 
                  fontSize: fontSize != null ? fontSize! : context.width(12)))
        ]));
  }
}

class CustomeRichTextOnly extends StatelessWidget {
  const CustomeRichTextOnly(
      {super.key, required this.text, this.fontSize, this.color});
  final String text;
  final double? fontSize;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          color: color ?? Colors.red,
          fontWeight: FontWeight.bold,
          fontSize: fontSize != null
              ? (fontSize! + context.width(6))
              : context.width(18)),
    );
  }
}
