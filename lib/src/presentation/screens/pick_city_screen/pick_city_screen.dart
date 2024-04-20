import 'package:flutter/material.dart';
import 'package:weather_app/src/presentation/common/back_arrow_button.dart';
import 'package:weather_app/src/presentation/screens/pick_city_screen/widgets/city_name_text_field.dart';
import 'package:weather_app/src/presentation/screens/pick_city_screen/widgets/posible_cities_widget.dart';

class PickCityScreen extends StatelessWidget {
  const PickCityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.only(
            top: 20,
            right: 10,
            left: 10,
          ),
          child: Column(
            children: [
              Row(
                children: [
                  BackArrowButton(),
                  SizedBox(width: 10),
                  Expanded(
                    child: CityNameTextField(),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Expanded(child: PosibleCitiesWidget()),
            ],
          ),
        ),
      ),
    );
  }
}
