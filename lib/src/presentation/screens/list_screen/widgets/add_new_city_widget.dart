import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:weather_app/src/weather_app.dart';

class AddNewCityWidget extends StatelessWidget {
  const AddNewCityWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.all(4),
      height: 120,
      width: 400,
      child: TextButton(
        onPressed: () {
          context.goNamed(Routes.pickCityScreen.name);
        },
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: const BorderRadius.all(Radius.circular(
                      15.0) //                 <--- border radius here
                  ),
              side: BorderSide(
                width: 1.5,
                color: theme.colorScheme.primary,
              ),
            ),
          ),
        ),
        child: const Center(
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
