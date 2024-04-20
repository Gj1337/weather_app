import 'package:freezed_annotation/freezed_annotation.dart';

part 'location.freezed.dart';
part 'location.g.dart';

@freezed
class Location with _$Location {
  factory Location({
    required int id,
    required String name,
    required double latitude,
    required double longitude,
    double? elevation,
    @JsonKey(name: 'admin1') String? administrativeLevel1,
    @JsonKey(name: 'admin2') String? administrativeLevel2,
    @JsonKey(name: 'admin3') String? administrativeLevel3,
    @JsonKey(name: 'country_code') required String countryCode,
    String? country,
  }) = _Location;

  factory Location.fromJson(Map<String, Object?> json) =>
      _$LocationFromJson(json);
}
