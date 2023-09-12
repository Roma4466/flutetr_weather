import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_weather/extensions/extensions.dart';
import 'package:flutter_weather/weather_pages/weather/weather.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_repository/weather_repository.dart'
    show WeatherRepository;

part 'weather_cubit.g.dart';

part 'weather_state.dart';

class WeatherCubit extends HydratedCubit<WeatherState> {
  WeatherCubit(this._weatherRepository) : super(WeatherState());

  final WeatherRepository _weatherRepository;

  Future<void> setWeather(Weather weather) async {
    final units = state.temperatureUnits;
    emit(
      state.copyWith(
        status: WeatherStatus.success,
        temperatureUnits: units,
        weather: weather.copyWith(
            temperature: Temperature(
          value: weather.temperature.value.formatted(units),
          minValue: weather.temperature.minValue.formatted(units),
          maxValue: weather.temperature.maxValue.formatted(units),
          feelsLike: weather.temperature.feelsLike.formatted(units),
        )),
      ),
    );
  }

  Future<void> fetchWeather(String? city) async {
    if (city == null || city.isEmpty) return;

    emit(state.copyWith(status: WeatherStatus.loading));

    try {
      final weather = Weather.fromDb(
        await _weatherRepository.getWeatherByName(city),
      );
      final units = state.temperatureUnits;

      emit(
        state.copyWith(
          status: WeatherStatus.success,
          temperatureUnits: units,
          weather: weather.copyWith(
              temperature: Temperature(
            value: weather.temperature.value.formatted(units),
            minValue: weather.temperature.minValue.formatted(units),
            maxValue: weather.temperature.maxValue.formatted(units),
            feelsLike: weather.temperature.feelsLike.formatted(units),
          )),
        ),
      );
    } on Exception catch (e) {
      print('Exception from weather: $e');
      emit(state.copyWith(
          status: WeatherStatus.failure, errorMessage: e.toString()));
    }
  }

  Future<void> refreshWeather() async {
    if (!state.status.isSuccess) return;
    if (state.weather == Weather.empty) return;
    try {
      final weather = Weather.fromDb(
        await _weatherRepository.getWeatherByName(state.weather.location),
      );
      final units = state.temperatureUnits;

      emit(
        state.copyWith(
          temperatureUnits: units,
          weather: weather.copyWith(
              temperature: Temperature(
            value: weather.temperature.value.formatted(units),
            minValue: weather.temperature.minValue.formatted(units),
            maxValue: weather.temperature.maxValue.formatted(units),
            feelsLike: weather.temperature.feelsLike.formatted(units),
          )),
        ),
      );
    } on Exception {
      emit(state);
    }
  }

  void toggleUnits(bool isFahrenheit) async {
    final units =
        isFahrenheit ? TemperatureUnits.fahrenheit : TemperatureUnits.celsius;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(UNITS_KEY, units.index);
    emit(state.copyWith(temperatureUnits: units));
  }

  void refreshUnits() async {
    final prefs = await SharedPreferences.getInstance();
    final unitsIndex = prefs.getInt(UNITS_KEY);
    TemperatureUnits units;
    if (unitsIndex != null) {
      units = TemperatureUnits.values[unitsIndex];
    } else {
      units = TemperatureUnits.celsius;
    }
    if (units != state.temperatureUnits) {
      if (!state.status.isSuccess) {
        emit(state.copyWith(temperatureUnits: units));
        return;
      }
      final weather = state.weather;
      emit(state.copyWith(
        temperatureUnits: units,
        weather: weather.copyWith(
            temperature: Temperature(
          value: weather.temperature.value.toggle(units),
          minValue: weather.temperature.minValue.toggle(units),
          maxValue: weather.temperature.maxValue.toggle(units),
          feelsLike: weather.temperature.feelsLike.toggle(units),
        )),
      ));
    }
  }

  @override
  WeatherState fromJson(Map<String, dynamic> json) =>
      WeatherState.fromJson(json);

  @override
  Map<String, dynamic> toJson(WeatherState state) => state.toJson();

  static const UNITS_KEY = "temperature-units";
}
