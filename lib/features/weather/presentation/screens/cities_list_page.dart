import 'package:flutter/material.dart';
import 'package:weather_app/features/weather/presentation/providers/geo_coding_provider.dart';
import 'package:weather_app/features/weather/presentation/providers/saved_weather_provider.dart';
import 'package:weather_app/extension/context_extension.dart';
import 'package:weather_app/features/weather/presentation/widgets/cities_content.dart';
import 'package:weather_app/widgets/transparent_card.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../widgets/add_location.dart';

class CitiesListPage extends ConsumerStatefulWidget {
  static const routeAddress = "/citiesListPage";
  const CitiesListPage({super.key});

  @override
  ConsumerState<CitiesListPage> createState() => _CitiesListPageState();
}

class _CitiesListPageState extends ConsumerState<CitiesListPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showAddLocationSheet();
        },
        child: const Icon(Icons.add),
      ),
      body: Consumer(
        builder: (context, ref, child) {
          final savedWeathers = ref.watch(getSavedWeatherProvider);
          if (savedWeathers is AsyncLoading || savedWeathers.value == null) {
            return const Center(
                child: RepaintBoundary(
              child: CircularProgressIndicator(),
            ));
          } else if (savedWeathers is AsyncError) {
            return Center(
              child: Text("Error ${savedWeathers.error}"),
            );
          }

          return Container(
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
                            itemCount: savedWeathers.value!.length,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () async {
                                  final placeMarks = await ref
                                      .read(geocodingProvider.notifier)
                                      .getAddressByCoordinates(
                                          latitude: savedWeathers
                                              .value![index].latitude,
                                          longitude: savedWeathers
                                              .value![index].longitude);

                                  if (context.mounted) {
                                    Navigator.pushNamedAndRemoveUntil(
                                        context,
                                        "/",
                                        arguments: placeMarks,
                                        (route) => false);
                                  }
                                },
                                child: TransparentCard(
                                    color: const Color(0xAAA5A5B2),
                                    margin: EdgeInsets.symmetric(
                                        horizontal: context.width * .02,
                                        vertical: context.height * .01),
                                    child: CitiesContent(
                                      dbWeatherModel:
                                          savedWeathers.value![index],
                                    )),
                              );
                            }),
                      )
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  void _showAddLocationSheet() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return AddLocation();
        });
  }
}
