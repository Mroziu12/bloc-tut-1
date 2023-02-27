import 'package:bloc_tut/bloc/weather_bloc.dart';
import 'package:bloc_tut/data/model/weather.dart';
import 'package:bloc_tut/presentation/pages/weather_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'city_input_field.dart';

Column buildColumnWithDataSearch(BuildContext context, Weather weather) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: <Widget>[
      Text(
        weather.cityName,
        style: const TextStyle(fontSize: 40, fontWeight: FontWeight.w700),
      ),
      Text(
        "${weather.temperatureCelcius.toStringAsFixed(1)} st. C",
        style: const TextStyle(fontSize: 80),
      ),
      ElevatedButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (_) => BlocProvider.value(
                      value: BlocProvider.of<WeatherBloc>(context),
                      child: WeatherDetailPage(
                        masterWeather: weather,
                      ),
                    )));
          },
          child: const Text("Pokaż Więcej")),
      const CityInputField(),
    ],
  );
}
