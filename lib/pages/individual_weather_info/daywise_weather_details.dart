import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app/extension/context_extension.dart';

class DayWiseWeatherDetails extends StatelessWidget {
  const DayWiseWeatherDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: context.height * .02),
      child: Column(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Wrap(
              spacing: context.width * .07,
              children: List.generate(10, (index) {
                return Column(
                  children: [
                    const Text(
                      "SUN",
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
                              .033),
                    ),
                    Text(
                      " 1-5 \nkm/h",
                      style: GoogleFonts.openSans(
                          fontSize: ((context.height + context.width) *
                                  context.aspectRatio) *
                              .018),
                    )
                  ],
                );
              }),
            ),
          )
        ],
      ),
    );
  }
}
