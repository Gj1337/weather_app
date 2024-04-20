import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:weather_app/src/presentation/screens/list_screen/list_screen.dart';
import 'package:weather_app/src/presentation/screens/main_screen/widgets/narrow_main_screen_widget.dart';
import 'package:weather_app/src/weather_app.dart';

class WideMainScreenWidget extends StatelessWidget {
  const WideMainScreenWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const Row(
          children: [
            Placeholder(child: ListScreen()),
            Expanded(child: NarrowMainScreen()),
          ],
        ),
        Align(
          alignment: Alignment.topRight,
          child: IconButton(
            onPressed: () => context.goNamed(Routes.settingsScreen.name),
            icon: const Icon(Icons.settings),
          ),
        ),
      ],
    );
  }
}
