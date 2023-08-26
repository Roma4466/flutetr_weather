// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Weather _$WeatherFromJson(Map<String, dynamic> json) => $checkedCreate(
      'Weather',
      json,
      ($checkedConvert) {
        final val = Weather(
          id: $checkedConvert('id', (v) => v as String),
          condition: $checkedConvert(
              'condition', (v) => $enumDecode(_$WeatherConditionEnumMap, v)),
          lastUpdated: $checkedConvert(
              'last_updated', (v) => DateTime.parse(v as String)),
          location: $checkedConvert('location', (v) => v as String),
          temperature: $checkedConvert('temperature',
              (v) => Temperature.fromJson(v as Map<String, dynamic>)),
          mainDescription:
              $checkedConvert('main_description', (v) => v as String),
          description: $checkedConvert('description', (v) => v as String),
          pressure: $checkedConvert('pressure', (v) => v as int),
          humidity: $checkedConvert('humidity', (v) => v as int),
          visibility: $checkedConvert('visibility', (v) => v as int),
          windSpeed:
              $checkedConvert('wind_speed', (v) => (v as num).toDouble()),
          sunrise:
              $checkedConvert('sunrise', (v) => DateTime.parse(v as String)),
          sunset: $checkedConvert('sunset', (v) => DateTime.parse(v as String)),
        );
        return val;
      },
      fieldKeyMap: const {
        'lastUpdated': 'last_updated',
        'mainDescription': 'main_description',
        'windSpeed': 'wind_speed'
      },
    );

Map<String, dynamic> _$WeatherToJson(Weather instance) => <String, dynamic>{
      'id': instance.id,
      'condition': _$WeatherConditionEnumMap[instance.condition]!,
      'last_updated': instance.lastUpdated.toIso8601String(),
      'location': instance.location,
      'temperature': instance.temperature.toJson(),
      'main_description': instance.mainDescription,
      'description': instance.description,
      'pressure': instance.pressure,
      'humidity': instance.humidity,
      'visibility': instance.visibility,
      'wind_speed': instance.windSpeed,
      'sunrise': instance.sunrise.toIso8601String(),
      'sunset': instance.sunset.toIso8601String(),
    };

const _$WeatherConditionEnumMap = {
  WeatherCondition.clear: 'clear',
  WeatherCondition.rainy: 'rainy',
  WeatherCondition.cloudy: 'cloudy',
  WeatherCondition.snowy: 'snowy',
  WeatherCondition.thunder: 'thunder',
  WeatherCondition.drizzle: 'drizzle',
  WeatherCondition.unknown: 'unknown',
};
