import 'package:bloc_tut/bloc/weather_bloc.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class CityInputField extends StatelessWidget {
  const CityInputField({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: TextField(
        onSubmitted: (value) => submitCityName(context, value),
        textInputAction: TextInputAction.search,
        decoration: InputDecoration(
          hintText: "Enter a city",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
          suffixIcon: const Icon(Icons.search),
        ),
      ),
    );
  }
}

void submitCityName(BuildContext context, String cityName) {
  WeatherBloc weatherBloc = BlocProvider.of<WeatherBloc>(context);
  weatherBloc.add(GetWeather(cityName));
}
