import 'package:flutter/widgets.dart';
import 'package:weather_app/src/domain/entity/location.dart';

class PosibleCityWidget extends StatelessWidget {
  const PosibleCityWidget({
    super.key,
    required this.location,
  });

  final Location location;

  @override
  Widget build(BuildContext context) {
    final Location(
      :name,
      :administrativeLevel1,
      :administrativeLevel2,
      :administrativeLevel3,
      :country,
    ) = location;

    final locationString = '$name'
        '${administrativeLevel1 != null ? ', $administrativeLevel1' : ''}'
        '${administrativeLevel2 != null ? ', $administrativeLevel1' : ''}'
        '${administrativeLevel3 != null ? ', $administrativeLevel1' : ''}'
        '${country != null ? ', $country' : ''}';

    return Container(
      padding: const EdgeInsets.all(10),
      alignment: Alignment.centerLeft,
      height: 40,
      child: Text(locationString),
    );
  }
}
