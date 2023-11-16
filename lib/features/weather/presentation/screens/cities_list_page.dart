import 'package:flutter/material.dart';
import 'package:weather_app/features/weather/presentation/providers/current_weather_forcast_provider.dart';
import 'package:weather_app/utils/enums/weathertype_enums.dart';
import 'package:weather_app/extension/context_extension.dart';
import 'package:weather_app/models/weather_type_model.dart';
import 'package:weather_app/features/weather/presentation/widgets/cities_content.dart';
import 'package:weather_app/widgets/transparent_card.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CitiesListPage extends ConsumerStatefulWidget {
  static const routeAddress = "/citiesListPage";
  const CitiesListPage({super.key});

  @override
  ConsumerState<CitiesListPage> createState() => _CitiesListPageState();
}

class _CitiesListPageState extends ConsumerState<CitiesListPage> {
  late List<WeatherTypeDModel> weatherInfoData;

  @override
  void initState() {
    super.initState();

    Future(() async {
      try {
        ref.read(currentWeatherForcastPProvider.notifier).getCurrentWeather();
      } catch (e) {
        if (mounted) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text("$e")));
        }
      }
    });

    weatherInfoData = [
      WeatherTypeDModel(
          icon: "assets/heavy_clouds.png",
          weatherType: "Clouds",
          weatherTypeEnum: WeatherType.mostlycloudy,
          location: "Kurthoul"),
      WeatherTypeDModel(
          icon: "assets/rainy.svg",
          weatherType: "Rainy",
          weatherTypeEnum: WeatherType.rainy,
          location: "New Delhi"),
      WeatherTypeDModel(
          icon: "assets/thunderstorm.png",
          weatherType: "Thunderstorm",
          weatherTypeEnum: WeatherType.thunderstorm,
          location: "Kolkata"),
      WeatherTypeDModel(
          weatherTypeEnum: WeatherType.sunny,
          icon: "assets/sunny.png",
          weatherType: "Sunny",
          location: "Mumbai"),
      WeatherTypeDModel(
          weatherTypeEnum: WeatherType.Clouds,
          icon: "assets/mostly_cloudy.svg",
          weatherType: "Partly Cloudy",
          location: "Odhisha"),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
      body: Container(
        color: Theme.of(context).canvasColor,
        child: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                    Color(0xff391A49),
                    Color(0xff301D5C),
                    Color(0xff262171),
                    Color(0xff301D5C),
                    Color(0xff391A49)

                    // Color.fromARGB(255, 115, 136, 255),
                    // Color.fromARGB(255, 130, 190, 238)
                  ])),
            ),
            SafeArea(
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(
                        horizontal: context.width * .03,
                        vertical: context.height * .005),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Saved Locations",
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                        IconButton(
                            style: IconButton.styleFrom(
                                foregroundColor: Colors.white),
                            onPressed: () {},
                            icon: const Icon(Icons.search))
                      ],
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                        padding: EdgeInsets.symmetric(
                            vertical: context.height * .02),
                        itemCount: weatherInfoData.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (context) =>
                              //             IndividualWeatherInfo(
                              //               weatherInfoData:
                              //                   weatherInfoData[index],
                              //             )));
                            },
                            child: TransparentCard(
                                color: const Color(0xAAA5A5B2),
                                margin: EdgeInsets.symmetric(
                                    horizontal: context.width * .02,
                                    vertical: context.height * .01),
                                child: CitiesContent(
                                  weatherInfoData: weatherInfoData[index],
                                )),
                          );
                        }),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
