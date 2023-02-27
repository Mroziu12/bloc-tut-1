import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:bloc_tut/data/model/weather.dart';
import 'package:bloc_tut/data/weather_repository.dart';
import 'package:equatable/equatable.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherRepository weatherRepository;
  WeatherBloc(this.weatherRepository) : super(const WeatherInitial()) {
    on<GetWeather>((event, emit) async {
      emit(const WeatherLoading());
      try {
        final weather = await weatherRepository.fetchWeather(event.cityName);
        emit(WeatherLoaded(weather));
      } on NetworkError catch (e) {
        log(e.toString());
        emit(const WeatherError("Nie udało się pobrać danych"));
      }
    });
    on<GetDetailedWeather>((event, emit) async {
      emit(const WeatherLoading());
      try {
        final weather =
            await weatherRepository.fetchDetailedWeather(event.cityName);
        emit(WeatherLoaded(weather));
      } on NetworkError catch (e) {
        log(e.toString());
        emit(const WeatherError("Nie udało się pobrać danych"));
      }
    });
  }
}
