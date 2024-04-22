import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_material_color_picker/flutter_material_color_picker.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:weather_app/generated/locale_keys.g.dart';
import 'package:weather_app/src/di/providers.dart';

const _possibleColors = [
  Colors.red,
  Colors.pink,
  Colors.blue,
  Colors.green,
  Colors.yellow,
  Colors.orange,
  Colors.grey,
  Colors.purple,
  Colors.deepPurple,
];

class ThemeMainColorWidget extends ConsumerWidget {
  const ThemeMainColorWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.watch(settingsStateNotifierProvider.notifier);
    final appThemeInfo = ref.watch(
        settingsStateNotifierProvider.select((state) => state.appThemeInfo));

    Future<Color?> pickNewColorDialog() async => showDialog(
          context: context,
          builder: (dialogContext) {
            return Dialog(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(height: 10),
                    MaterialColorPicker(
                      colors: _possibleColors,
                      selectedColor: appThemeInfo.colorSeed,
                      allowShades: false,
                      onMainColorChange: (colorSwatch) {
                        if (colorSwatch != null) {
                          notifier.onPrimaryColorChanged(colorSwatch);
                        }

                        context.pop();
                      },
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: context.pop,
                        child: Text(
                          LocaleKeys.cancel.tr(),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        );

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(LocaleKeys.primaryColor.tr()),
        OutlinedButton(
          onPressed: pickNewColorDialog,
          child: Row(
            children: [
              Text(LocaleKeys.colorPicker.tr()),
              const SizedBox(width: 10),
              CircleColor(
                color: appThemeInfo.colorSeed,
                circleSize: 20,
                elevation: 0,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
