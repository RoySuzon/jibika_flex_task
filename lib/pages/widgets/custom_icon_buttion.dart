import 'package:flutter/material.dart';
import 'package:jibika_flex_task/components/dimention_extention.dart';

class CustomIconButtonWithBadge extends StatelessWidget {
  final IconData icon;
  final int badgeCount;
  final String title;
  final VoidCallback onPressed;

  const CustomIconButtonWithBadge({
    super.key,
    required this.icon,
    required this.badgeCount,
    required this.title,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      hoverColor: Colors.transparent,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      focusColor: Colors.transparent,
      onTap: onPressed,
      child: Center(
        child: SizedBox(
          width: context.width(60),
          height: context.width(70),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                children: [
                  Padding(
                    padding: EdgeInsets.all(context.width(8)),
                    child: Icon(
                      icon,
                      size: context.width(30),
                      color: const Color(0xff267862),
                    ),
                  ), // Adjust the size of the icon as needed
                  if (badgeCount > 0)
                    Positioned(
                      right: 0,
                      top: 0,
                      child: Container(
                        padding: EdgeInsets.all(context.width(2)),
                        decoration: BoxDecoration(
                            color: Colors.grey.shade300,
                            // borderRadius: BorderRadius.circular(context.width(20)),
                            shape: BoxShape.circle),
                        constraints: BoxConstraints(
                          minWidth: context.width(20),
                          minHeight: context.width(20),
                        ),
                        child: Center(
                          child: Text(
                            '$badgeCount',
                            style: const TextStyle(
                              color: Colors.red,
                              fontSize: 12,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
              Text(
                title,
                style: TextStyle(
                    fontSize: context.width(10),
                    color: const Color(0xff267862),
                    fontWeight: FontWeight.w400),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
