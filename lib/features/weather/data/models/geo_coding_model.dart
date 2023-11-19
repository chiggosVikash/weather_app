import 'package:geocoding/geocoding.dart';
import 'package:weather_app/features/weather/domain/entities/geo_coding_entity.dart';

class GeocodingModel extends GeoCodingEntity {
  const GeocodingModel(
      {required super.placeMarks,
      required super.latitude,
      required super.longitude});

  GeocodingModel copyWith({
    List<Placemark>? placeMarks,
    double? latitude,
    double? longitude,
  }) {
    return GeocodingModel(
      placeMarks: placeMarks ?? super.placeMarks,
      latitude: latitude ?? super.latitude,
      longitude: longitude ?? super.longitude,
    );
  }
}
