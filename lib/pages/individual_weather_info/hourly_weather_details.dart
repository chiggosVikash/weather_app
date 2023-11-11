import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app/extension/context_extension.dart';

class HourlyWeatherDetails extends StatelessWidget {
  const HourlyWeatherDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Wrap(
        spacing: context.width * .04,
        children: List.generate(10, (index) {
          return Column(
            children: [
              const Text(
                "04:00 pm",
              ),
              Image.asset(
                "assets/heavy_clouds.png",
                width: context.width * .1,
              ),
              Text(
                "31°",
                style: GoogleFonts.abyssinicaSil(
                    fontSize: ((context.height + context.width) *
                            context.aspectRatio) *
                        .03),
              )
            ],
          );
        }),
      ),
    );
  }
}
