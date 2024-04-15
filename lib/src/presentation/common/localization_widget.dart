import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

const _supportedLocales = [Locale('en')];

class LocalizationWidget extends StatelessWidget {
  const LocalizationWidget({super.key, required this.builder});

  final Widget Function(BuildContext) builder;

  // Future<void> localizationSetup() async {
  //   await EasyLocalization.ensureInitialized();
  // }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: EasyLocalization.ensureInitialized(),
      builder: (_, snapshot) {
        return switch (snapshot.connectionState) {
          ConnectionState.done => EasyLocalization(
              supportedLocales: const [Locale('en')],
              path: 'assets/translations',
              fallbackLocale: _supportedLocales.first,
              child: Builder(builder: builder),
            ),
          //TODO: add splash screen
          _ => const SizedBox(),
        };
      },
    );
  }
}
