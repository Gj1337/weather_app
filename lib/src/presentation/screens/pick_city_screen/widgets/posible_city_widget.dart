import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:weather_app/src/domain/entity/location.dart';

class PosibleCityWidget extends HookWidget {
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

    final flagImage =
        'assets/image/flags/${location.countryCode.toLowerCase()}.png';

    useEffect(() {
      Future(
        () => precacheImage(AssetImage(flagImage), context),
      );

      return null;
    }, []);

    return Container(
      padding: const EdgeInsets.all(10),
      alignment: Alignment.centerLeft,
      height: 40,
      child: Row(
        children: [
          Image.asset(
            width: 25,
            height: 25,
            flagImage,
          ),
          const SizedBox(width: 10),
          Text(locationString),
        ],
      ),
    );
  }
}
