import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app/extension/context_extension.dart';
import 'package:weather_app/models/weather_type_model.dart';
import 'package:weather_app/pages/individual_weather_info/location_name.dart';
import 'package:weather_app/pages/individual_weather_info/weather_details.dart';
import 'package:weather_app/utils/theme/constants/constant.dart';

class IndividualWeatherInfo extends StatefulWidget {
  final WeatherTypeDModel weatherInfoData;
  const IndividualWeatherInfo({super.key, required this.weatherInfoData});

  @override
  State<IndividualWeatherInfo> createState() => IndividualWeatherInfoState();
}

class IndividualWeatherInfoState extends State<IndividualWeatherInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                gradient: Constant.backgroundWeatherGradient(
                    widget.weatherInfoData.weatherTypeEnum)),
          ),
          CustomScrollView(slivers: [
            // SliverAppBar(
            //   automaticallyImplyLeading: false,
            //   forceMaterialTransparency: false,
            //   backgroundColor: Colors.transparent,
            //   expandedHeight: context.height * .2,
            //   pinned: true,
            //   floating: true,
            // ),
            SliverToBoxAdapter(
                child: SafeArea(
                    child: Column(
              children: [
                LocationName(
                  locationName: widget.weatherInfoData.location,
                ),
                SizedBox(
                  height: context.height,
                  width: context.width,
                  child: LayoutBuilder(builder: (context, constraints) {
                    return PageView.builder(itemBuilder: (context, index) {
                      return WeatherDetails(
                        constraints: constraints,
                      );
                    });
                  }),
                )
              ],
            ))),
          ])
        ],
      ),
    );
  }
}
