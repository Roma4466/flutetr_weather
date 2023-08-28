// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'temperature.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Temperature _$TemperatureFromJson(Map<String, dynamic> json) => $checkedCreate(
      'Temperature',
      json,
      ($checkedConvert) {
        final val = Temperature(
          value: $checkedConvert('value', (v) => (v as num).toDouble()),
          minValue: $checkedConvert('min_value', (v) => (v as num).toDouble()),
          maxValue: $checkedConvert('max_value', (v) => (v as num).toDouble()),
          feelsLike:
              $checkedConvert('feels_like', (v) => (v as num).toDouble()),
        );
        return val;
      },
      fieldKeyMap: const {
        'minValue': 'min_value',
        'maxValue': 'max_value',
        'feelsLike': 'feels_like'
      },
    );

Map<String, dynamic> _$TemperatureToJson(Temperature instance) =>
    <String, dynamic>{
      'value': instance.value,
      'min_value': instance.minValue,
      'max_value': instance.maxValue,
      'feels_like': instance.feelsLike,
    };
