import 'package:freezed_annotation/freezed_annotation.dart';

class IsDayConverter implements JsonConverter<bool, int> {
  const IsDayConverter();

  @override
  bool fromJson(int json) => switch (json) {
        0 => false,
        1 => true,
        _ => throw Exception(
            'Unknown value',
          )
      };

  @override
  int toJson(bool isDay) => isDay ? 1 : 0;
}
