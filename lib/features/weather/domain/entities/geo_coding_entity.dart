import 'package:flutter/foundation.dart';
import 'package:geocoding/geocoding.dart';

@immutable
class GeoCodingEntity {
  final List<Placemark> placeMarks;
  final double latitude;
  final double longitude;
  const GeoCodingEntity({
    required this.placeMarks,
    required this.latitude,
    required this.longitude,
  });
}
