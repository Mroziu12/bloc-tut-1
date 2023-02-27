import 'package:flutter/cupertino.dart';

import '../../data/model/weather.dart';

Column buildColumnWithDataDetail(BuildContext context, Weather weather) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: <Widget>[
      Text(
        weather.cityName,
        style: const TextStyle(
          fontSize: 40,
          fontWeight: FontWeight.w700,
        ),
      ),
      Text(
        // Display the Celsius temperature with 1 decimal place
        "${weather.temperatureCelcius.toStringAsFixed(1)} °C",
        style: const TextStyle(fontSize: 80),
      ),
      Text(
        // Display the Fahrenheit temperature with 1 decimal place
        "${weather.temperatureFahrenheit.toStringAsFixed(1)} °F",
        style: const TextStyle(fontSize: 80),
      ),
    ],
  );
}
