import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:weather_app/generated/locale_keys.g.dart';
import 'package:weather_app/src/weather_app.dart';

class PageNotFoundWidget extends StatelessWidget {
  const PageNotFoundWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              LocaleKeys.pageNotFound.tr(),
              style: TextStyle(
                color: Theme.of(context).colorScheme.secondary,
                fontSize: 35,
              ),
            ),
            Icon(
              Icons.error,
              size: 200,
              color: Theme.of(context).colorScheme.secondary,
            ),
            ElevatedButton(
                onPressed: () {
                  context.goNamed(Routes.mainScreen.name);
                },
                child: Text(LocaleKeys.goHome.tr()))
          ],
        ),
      ),
    );
  }
}
