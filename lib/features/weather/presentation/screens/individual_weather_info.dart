import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/extension/context_extension.dart';
import 'package:weather_app/features/permission_handler/domain/use_cases/permission_handler_user_case.dart';
import 'package:weather_app/models/weather_type_model.dart';
import 'package:weather_app/features/weather/presentation/widgets/location_name.dart';
import 'package:weather_app/features/weather/presentation/widgets/weather_details.dart';
import 'package:weather_app/utils/constants/constant.dart';

class IndividualWeatherInfo extends ConsumerStatefulWidget {
  static const routeAddress = "/individualWeatherInfo";
  final WeatherTypeDModel weatherInfoData;
  const IndividualWeatherInfo({super.key, required this.weatherInfoData});

  @override
  ConsumerState<IndividualWeatherInfo> createState() =>
      IndividualWeatherInfoState();
}

class IndividualWeatherInfoState extends ConsumerState<IndividualWeatherInfo> {
  final _permissionHandler = PermissionHandlerUseCase();
  @override
  void initState() {
    super.initState();
    Future(() async {
      final status = await _permissionHandler.checkLocationPermissionStatus();
      if (status == false) {
        _permissionHandler.requestLocationPermission();
      }
    });
  }

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
