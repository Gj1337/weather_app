import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:weather_app/generated/locale_keys.g.dart';
import 'package:weather_app/src/weather_app.dart';

class PickFirstLocationWidget extends StatelessWidget {
  const PickFirstLocationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              LocaleKeys.emptyLocation.tr(),
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Theme.of(context).colorScheme.secondary, fontSize: 35),
            ),
            ElevatedButton(
              onPressed: () {
                context.goNamed(Routes.pickCityScreen.name);
              },
              child: Padding(
                padding: const EdgeInsets.all(25),
                child: Column(
                  children: [
                    Icon(
                      Icons.add_location_alt,
                      size: 200,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                    Text(LocaleKeys.addLocation.tr()),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
