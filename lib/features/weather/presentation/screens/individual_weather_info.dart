import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geocoding/geocoding.dart';
import 'package:weather_app/extension/context_extension.dart';
import 'package:weather_app/features/weather/presentation/providers/current_weather_forcast_provider.dart';
import 'package:weather_app/features/weather/presentation/screens/cities_list_page.dart';
import 'package:weather_app/features/weather/presentation/widgets/background.dart';
import 'package:weather_app/features/weather/presentation/widgets/current_weather_details.dart';
import 'package:weather_app/features/weather/presentation/widgets/location_name.dart';
import 'package:weather_app/features/weather/presentation/widgets/weather_details.dart';
import 'package:weather_app/utils/services/location_service/models/location_model.dart';

@immutable
class IndividualWeatherInfoArgs {
  final List<Placemark>? placeMarks;
  final double? latitude;
  final double? longitude;
  const IndividualWeatherInfoArgs(
      {this.placeMarks, this.latitude, this.longitude});
}

class IndividualWeatherInfo extends ConsumerStatefulWidget {
  static const routeAddress = "/individualWeatherInfo";

  final IndividualWeatherInfoArgs args;

  // final List<Placemark>? _placeMarks;

  const IndividualWeatherInfo({
    required this.args,
    super.key,
  });

  @override
  ConsumerState<IndividualWeatherInfo> createState() =>
      IndividualWeatherInfoState();
}

class IndividualWeatherInfoState extends ConsumerState<IndividualWeatherInfo> {
  @override
  void initState() {
    super.initState();
    // for (var p in widget.args.placeMarks ?? <Placemark>[]) {
    //   print(p.locality);
    //   print(p.subLocality);
    // }
    Future(() async {
      final currentWeatherModel = await ref
          .read(currentWeatherForcastPProvider.notifier)
          .getCurrentWeather(
              placeMarks: widget.args.placeMarks,
              location:
                  widget.args.latitude == null || widget.args.longitude == null
                      ? null
                      : LocationModel(
                          latitude: widget.args.latitude!,
                          longitude: widget.args.longitude!));
      ref
          .read(currentWeatherForcastPProvider.notifier)
          .saveWheatherInLocalDB(currentWeatherModel);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Consumer(
            builder: (context, ref, child) {
              final currentWeatherData =
                  ref.watch(currentWeatherForcastPProvider);
              if (currentWeatherData is AsyncLoading ||
                  currentWeatherData.value == null) {
                return const SizedBox();
              }
              return const Background();
            },
          ),
          RefreshIndicator(
            onRefresh: () => ref
                .read(currentWeatherForcastPProvider.notifier)
                .getCurrentWeather(isRefresh: true),
            child: CustomScrollView(slivers: [
              SliverAppBar(
                actions: [
                  IconButton(
                      onPressed: () {
                        Navigator.pushNamed(
                            context, CitiesListPage.routeAddress);
                      },
                      icon: const Icon(Icons.location_city))
                ],
                backgroundColor: Colors.transparent,
              ),

              /// data
              SliverToBoxAdapter(
                  child: SafeArea(
                      child: Column(
                children: [
                  const LocationName(),
                  SizedBox(
                    height: context.height,
                    width: context.width,
                    child: LayoutBuilder(builder: (context, constraints) {
                      return PageView.builder(
                          itemCount: 1,
                          itemBuilder: (context, index) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CurrentWeatherDetails(
                                  constraints: constraints,
                                ),
                                Consumer(
                                  builder: (context, ref, child) {
                                    final currentWeatherStatus = ref
                                        .watch(currentWeatherForcastPProvider);
                                    if (currentWeatherStatus is AsyncLoading ||
                                        currentWeatherStatus.value == null) {
                                      return const Center(
                                        child: SizedBox(),
                                      );
                                    }

                                    return WeatherDetails(
                                      locationModel:
                                          currentWeatherStatus.value!.coord,
                                      constraints: constraints,
                                    );
                                  },
                                ),
                              ],
                            );
                          });
                    }),
                  )
                ],
              ))),
            ]),
          )
        ],
      ),
    );
  }
}
