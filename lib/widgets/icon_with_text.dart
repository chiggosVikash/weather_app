import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app/extension/context_extension.dart';

class IconWithText extends StatelessWidget {
  final double width;
  final String title;
  final Icon icon;
  final String value;
  const IconWithText(
      {super.key,
      required this.width,
      required this.icon,
      required this.title,
      required this.value});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: LayoutBuilder(builder: (context, constraints) {
        return Column(
          children: [
            icon,
            SizedBox(
              height: context.height * .01,
            ),
            Text(
              title,
              style: GoogleFonts.alegreyaSansSc(
                  fontSize: ((constraints.biggest.width + context.height) *
                          context.aspectRatio) *
                      .036),
            ),
            Text(value)
          ],
        );
      }),
    );
  }
}
