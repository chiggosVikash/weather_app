import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/extension/context_extension.dart';
import 'package:weather_app/features/weather/presentation/providers/current_weather_forcast_provider.dart';
import 'package:weather_app/features/weather/presentation/screens/cities_list_page.dart';
import 'package:weather_app/features/weather/presentation/widgets/background.dart';
import 'package:weather_app/features/weather/presentation/widgets/current_weather_details.dart';
import 'package:weather_app/features/weather/presentation/widgets/location_name.dart';
import 'package:weather_app/features/weather/presentation/widgets/weather_details.dart';

class IndividualWeatherInfo extends ConsumerStatefulWidget {
  static const routeAddress = "/individualWeatherInfo";

  const IndividualWeatherInfo({
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
    Future(() async {
      final currentWeatherModel = await ref
          .read(currentWeatherForcastPProvider.notifier)
          .getCurrentWeather();
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
