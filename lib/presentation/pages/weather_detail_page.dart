import 'package:bloc_tut/bloc/weather_bloc.dart';
import 'package:bloc_tut/presentation/widgets/column_with_data_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/model/weather.dart';
import '../widgets/init_and_loading.dart';

class WeatherDetailPage extends StatefulWidget {
  final Weather masterWeather;
  const WeatherDetailPage({super.key, required this.masterWeather});

  @override
  State<WeatherDetailPage> createState() => _WeatherDetailPageState();
}

class _WeatherDetailPageState extends State<WeatherDetailPage> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    BlocProvider.of<WeatherBloc>(context)
        .add(GetDetailedWeather(widget.masterWeather.cityName));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Fake Pogoda'),
        ),
        body: Container(
            padding: const EdgeInsets.symmetric(vertical: 16),
            alignment: Alignment.center,
            child: BlocBuilder<WeatherBloc, WeatherState>(
              builder: (context, state) {
                if (state is WeatherLoading) {
                  return buildLoading();
                } else if (state is WeatherLoaded) {
                  return buildColumnWithDataDetail(context, state.weather);
                } else if (state is WeatherError) {
                  return buildInitialInput();
                } else {
                  return const Text("Error w state builder");
                }
              },
            )));
  }
}
