import 'package:flutter/material.dart';
import 'package:jibika_flex_task/components/dimention_extention.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final String ?secondText;
  final String? thirdText;
  final VoidCallback? onPressed;
  final Widget? child;

  const CustomButton({
    super.key,
    required this.title,
     this.secondText,
     this.thirdText,
     this.onPressed,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      hoverColor: Colors.transparent,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      focusColor: Colors.transparent,
      onTap: onPressed,
      child: child != null
          ? Column(
            mainAxisAlignment: MainAxisAlignment.center,
              children: [
                child!,
                SizedBox(height: context.width(5)),
                Text(
                  title,
                  style: TextStyle(fontSize: context.width(12)),
                ),
              ],
            )
          : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 5),
                Text(
                  secondText!,
                  style: TextStyle(fontSize: context.width(20), fontWeight: FontWeight.bold),
                ),
                SizedBox(height: context.width(5)),
                Text(
                  thirdText!,
                  style: TextStyle(fontSize: context.width(12)),
                ),
              ],
            ),
    );
  }
}

// Example usage:
// CustomButton(
//   firstText: 'Payble',
//   secondText: '50000',
//   thirdText: 'manpower',
//   onPressed: () {
//     // Your onPressed callback logic here
//   },
// ),
