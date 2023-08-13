// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: implicit_dynamic_parameter

part of 'weather_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherEntity _$WeatherEntityFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'WeatherEntity',
      json,
      ($checkedConvert) {
        final val = WeatherEntity(
          latitude: $checkedConvert('latitude', (v) => (v as num).toDouble()),
          longitude: $checkedConvert('longitude', (v) => (v as num).toDouble()),
          generationtime_ms: $checkedConvert(
              'generationtime_ms', (v) => (v as num).toDouble()),
          utc_offset_seconds:
              $checkedConvert('utc_offset_seconds', (v) => v as int),
          timezone: $checkedConvert('timezone', (v) => v as String),
          timezone_abbreviation:
              $checkedConvert('timezone_abbreviation', (v) => v as String),
          elevation: $checkedConvert('elevation', (v) => (v as num).toDouble()),
          current_weather: $checkedConvert('current_weather',
              (v) => CurrentWeather.fromJson(v as Map<String, dynamic>)),
        );
        return val;
      },
    );

CurrentWeather _$CurrentWeatherFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'CurrentWeather',
      json,
      ($checkedConvert) {
        final val = CurrentWeather(
          temperature:
              $checkedConvert('temperature', (v) => (v as num).toDouble()),
          windspeed: $checkedConvert('windspeed', (v) => (v as num).toDouble()),
          winddirection: $checkedConvert('winddirection', (v) => v as int),
          weathercode: $checkedConvert('weathercode', (v) => v as int),
          is_day: $checkedConvert('is_day', (v) => v as int),
          time: $checkedConvert('time', (v) => v as String),
        );
        return val;
      },
    );
