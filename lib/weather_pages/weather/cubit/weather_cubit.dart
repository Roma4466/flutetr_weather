import 'package:equatable/equatable.dart';
import 'package:flutter_weather/weather_pages/weather/weather.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:weather_repository/weather_repository.dart'
    show WeatherRepository;

part 'weather_cubit.g.dart';

part 'weather_state.dart';

class WeatherCubit extends HydratedCubit<WeatherState> {
  WeatherCubit(this._weatherRepository) : super(WeatherState());

  final WeatherRepository _weatherRepository;

  Future<void> fetchWeather(String? city) async {
    if (city == null || city.isEmpty) return;

    emit(state.copyWith(status: WeatherStatus.loading));

    try {
      final weather = Weather.fromDb(
        await _weatherRepository.getWeather(city),
      );
      final units = state.temperatureUnits;
      final value = units.isFahrenheit
          ? weather.temperature.value.toFahrenheit()
          : weather.temperature.value;
      final minTemp = units.isFahrenheit
          ? weather.temperature.value.toFahrenheit()
          : weather.temperature.minValue;
      final maxTemp = units.isFahrenheit
          ? weather.temperature.value.toFahrenheit()
          : weather.temperature.maxValue;
      final feelsLike = units.isFahrenheit
          ? weather.temperature.value.toFahrenheit()
          : weather.temperature.feelsLike;

      emit(
        state.copyWith(
          status: WeatherStatus.success,
          temperatureUnits: units,
          weather: weather.copyWith(
              temperature: Temperature(
            value: value,
            minValue: minTemp,
            maxValue: maxTemp,
            feelsLike: feelsLike,
          )),
        ),
      );
    } on Exception catch (e) {
      print('Exception from weather: $e');
      emit(state.copyWith(status: WeatherStatus.failure));
    }
  }

  Future<void> refreshWeather() async {
    if (!state.status.isSuccess) return;
    if (state.weather == Weather.empty) return;
    try {
      final weather = Weather.fromDb(
        await _weatherRepository.getWeather(state.weather.location),
      );
      final units = state.temperatureUnits;
      final value = units.isFahrenheit
          ? weather.temperature.value.toFahrenheit()
          : weather.temperature.value;
      final minTemp = units.isFahrenheit
          ? weather.temperature.value.toFahrenheit()
          : weather.temperature.minValue;
      final maxTemp = units.isFahrenheit
          ? weather.temperature.value.toFahrenheit()
          : weather.temperature.maxValue;
      final feelsLike = units.isFahrenheit
          ? weather.temperature.value.toFahrenheit()
          : weather.temperature.feelsLike;

      emit(
        state.copyWith(
          status: WeatherStatus.success,
          temperatureUnits: units,
          weather: weather.copyWith(
              temperature: Temperature(
            value: value,
            minValue: minTemp,
            maxValue: maxTemp,
            feelsLike: feelsLike,
          )),
        ),
      );
    } on Exception {
      emit(state);
    }
  }

  void toggleUnits() {
    final units = state.temperatureUnits.isFahrenheit
        ? TemperatureUnits.celsius
        : TemperatureUnits.fahrenheit;

    if (!state.status.isSuccess) {
      emit(state.copyWith(temperatureUnits: units));
      return;
    }

    final weather = state.weather;
    if (weather != Weather.empty) {
      final temperature = weather.temperature;
      final value = units.isCelsius
          ? temperature.value.toCelsius()
          : temperature.value.toFahrenheit();
      final minTemp = units.isCelsius
          ? weather.temperature.value.toCelsius()
          : weather.temperature.minValue.toFahrenheit();
      final maxTemp = units.isCelsius
          ? weather.temperature.value.toCelsius()
          : weather.temperature.maxValue.toFahrenheit();
      final feelsLike = units.isCelsius
          ? weather.temperature.value.toCelsius()
          : weather.temperature.feelsLike.toFahrenheit();
      emit(
        state.copyWith(
          temperatureUnits: units,
          weather: weather.copyWith(
              temperature: Temperature(
            value: value,
            minValue: minTemp,
            maxValue: maxTemp,
            feelsLike: feelsLike,
          )),
        ),
      );
    }
  }

  @override
  WeatherState fromJson(Map<String, dynamic> json) =>
      WeatherState.fromJson(json);

  @override
  Map<String, dynamic> toJson(WeatherState state) => state.toJson();
}

extension on double {
  double toFahrenheit() => (this * 9 / 5) + 32;

  double toCelsius() => (this - 32) * 5 / 9;
}
