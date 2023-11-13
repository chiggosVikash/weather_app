import 'package:flutter/foundation.dart';

@immutable
class WindEntity {
  final double speed;
  final int deg;
  final double? gust;
  const WindEntity(
      {required this.deg, required this.gust, required this.speed});
}
