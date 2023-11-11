import 'package:flutter/material.dart';
import 'package:weather_app/extension/context_extension.dart';

class TransparentCard extends StatelessWidget {
  final Widget child;
  final Color color;
  final EdgeInsetsGeometry margin;
  const TransparentCard(
      {super.key,
      required this.color,
      required this.child,
      required this.margin});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: context.width * .03, vertical: context.height * .01),
      margin: margin,
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(25), color: color
              // color: const Color(0xAAA5A5B2)
              ),
      child: child,
    );
  }
}
