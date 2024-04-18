import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:weather_app/src/presentation/common/bottom_navigation_bar_wrapper.dart';
import 'package:weather_app/src/presentation/common/screen_size_provider.dart';
import 'package:weather_app/src/presentation/domain/screen_size.dart';
import 'package:weather_app/src/presentation/screens/settings_screen/settings_screen.dart';

final _smallScreen = Size(ScreenSize.small.maxWidth, 400);
final _bigScreen = Size(ScreenSize.small.maxWidth + 1, 400);

void main() {
  EasyLocalization.logger.enableBuildModes = [];

  group(
    'Screen resizing test',
    () {
      testWidgets('Buttom bar', (tester) async {
        tester.view.physicalSize = _bigScreen;
        tester.view.devicePixelRatio = 1;

        await tester.pumpWidget(
          _BaseEvniromentSetup(
            child: MaterialApp(
              home: ButtonNavigationBarWrapper(
                path: '/',
                child: Container(),
              ),
            ),
          ),
        );

        await tester.pumpAndSettle();

        final animatedController = find.byType(AnimatedContainer);
        final animatedControllerSize = tester.getSize(animatedController);

        expect(animatedControllerSize.height, 0);

        tester.view.physicalSize = _smallScreen;

        //First for changing size, second for animation.
        await tester.pumpAndSettle();
        await tester.pumpAndSettle();

        final animatedControllerNewSize = tester.getSize(animatedController);

        expect(animatedControllerNewSize.height > 0, true);
      });

      testWidgets(
        'Back button it settings screen',
        (tester) async {
          tester.view.physicalSize = _bigScreen;
          tester.view.devicePixelRatio = 1;

          await tester.pumpWidget(
            const _BaseEvniromentSetup(
              child: SettingsScreen(),
            ),
          );

          await tester.pumpAndSettle();

          final backButton = find.descendant(
              of: find.byType(AppBar), matching: find.byType(IconButton));

          expect(backButton, findsOneWidget);

          tester.view.physicalSize = _smallScreen;

          //First for changing size, second for animation.
          await tester.pumpAndSettle();
          await tester.pumpAndSettle();

          expect(backButton, findsNothing);
        },
      );
    },
  );
}

class _BaseEvniromentSetup extends StatelessWidget {
  const _BaseEvniromentSetup({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) => ProviderScope(
        child: ScreenSizeProviderWidget(
          child: MaterialApp(home: child),
        ),
      );
}
