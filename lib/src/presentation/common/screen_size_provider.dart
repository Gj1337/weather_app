import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:weather_app/src/presentation/domain/screen_size.dart';

ScreenSize _screenSize = ScreenSize.big;

class ScreenSizeProviderWidget extends HookConsumerWidget {
  const ScreenSizeProviderWidget({
    required this.child,
    super.key,
  });

  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    useEffect(
      () {
        Future(
          () {
            final width = MediaQuery.of(context).size.width;

            ref.read(screenSizeProvider.notifier).state =
                width > ScreenSize.small.maxWidth
                    ? ScreenSize.big
                    : ScreenSize.small;
          },
        );

        return null;
      },
    );

    return child;
  }
}

final screenSizeProvider = StateProvider<ScreenSize>((ref) => _screenSize);
