import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app/extension/context_extension.dart';

import '../providers/current_weather_forcast_provider.dart';

class LocationName extends ConsumerWidget {
  const LocationName({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(currentWeatherForcastPProvider);
    if (state.hasError) {
      return Center(
        child: Text(state.error.toString()),
      );
    }
    if (state.isLoading || state.value == null) {
      return Center(
        child: SizedBox(
          height: context.height * .3,
          width: context.width,
        ),
      );
    }
    return Container(
      height: context.height * .3,
      width: context.width,
      // decoration: BoxDecoration(color: Colors.white),
      padding: EdgeInsets.symmetric(horizontal: context.width * .02),
      margin: EdgeInsets.symmetric(horizontal: context.width * .02),
      child: LayoutBuilder(builder: (context, constraints) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              state.value!.coord.locationName(),
              style: GoogleFonts.radley(
                  color: Colors.grey.shade200,
                  fontSize: ((constraints.biggest.height +
                              constraints.biggest.width) *
                          context.aspectRatio) *
                      .16),
            ),
            Wrap(
              spacing: constraints.maxWidth * .005,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: List.generate(5, (index) {
                return index == 0
                    ? Icon(
                        Icons.location_pin,
                        color: Colors.grey.shade200,
                        size: constraints.biggest.height * .065,
                      )
                    : Icon(
                        Icons.circle,
                        color: Colors.white.withOpacity(.2),
                        size: constraints.biggest.height * .04,
                      );
              }),
            )
          ],
        );
      }),
    );
  }
}
