import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:weather_app/generated/locale_keys.g.dart';
import 'package:weather_app/src/di/providers.dart';
import 'package:weather_app/src/utils/debouncer.dart';

class CityNameTextField extends HookConsumerWidget {
  const CityNameTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final stateNotifier =
        ref.watch(pickCityScreenStateNotifierProvider.notifier);

    final debouncer = useRef(
      Debouncer<String>(
        action: (values) => stateNotifier.updatePosibleCities(values.last),
      ),
    );

    return TextField(
      onChanged: debouncer.value.replaceAll,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.add_location),
        border: const OutlineInputBorder(),
        labelText: LocaleKeys.enterCityName.tr(),
      ),
    );
  }
}
