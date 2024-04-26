import 'package:flutter/material.dart';
import 'package:jibika_flex_task/components/dimention_extention.dart';

class CustomCard extends StatelessWidget {
  const CustomCard(
      {super.key,
      required this.child,
      this.pLeft,
      this.pRight,
      this.pTop,
      this.pBottom});
  final Widget child;
  final double? pLeft;
  final double? pRight;
  final double? pTop;
  final double? pBottom;
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      shape: ContinuousRectangleBorder(
          borderRadius: BorderRadius.circular(context.width(20))),
      child: Padding(
        padding: EdgeInsets.only(
            left: pLeft ?? context.width(16),
            right: pRight ?? context.width(16),
            top: pTop ?? context.width(16),
            bottom: pBottom ?? context.width(16)),
        child: child,
      ),
    );
  }
}
