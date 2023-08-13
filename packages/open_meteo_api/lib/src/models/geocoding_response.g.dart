// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: implicit_dynamic_parameter

part of 'geocoding_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GeocodingResponse _$GeocodingResponseFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'GeocodingResponse',
      json,
      ($checkedConvert) {
        final val = GeocodingResponse(
          results: $checkedConvert(
              'results',
              (v) => (v as List<dynamic>)
                  .map((e) =>
                      GeocodingResult.fromJson(e as Map<String, dynamic>))
                  .toList()),
          generationtime_ms: $checkedConvert(
              'generationtime_ms', (v) => (v as num).toDouble()),
        );
        return val;
      },
    );

GeocodingResult _$GeocodingResultFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'GeocodingResult',
      json,
      ($checkedConvert) {
        final val = GeocodingResult(
          id: $checkedConvert('id', (v) => v as int),
          name: $checkedConvert('name', (v) => v as String),
          latitude: $checkedConvert('latitude', (v) => (v as num).toDouble()),
          longitude: $checkedConvert('longitude', (v) => (v as num).toDouble()),
          elevation: $checkedConvert('elevation', (v) => (v as num).toDouble()),
          feature_code: $checkedConvert('feature_code', (v) => v as String),
          country_code: $checkedConvert('country_code', (v) => v as String),
          admin1_id: $checkedConvert('admin1_id', (v) => v as int),
          admin2_id: $checkedConvert('admin2_id', (v) => v as int),
          admin3_id: $checkedConvert('admin3_id', (v) => v as int),
          timezone: $checkedConvert('timezone', (v) => v as String),
          population: $checkedConvert('population', (v) => v as int),
          postcodes: $checkedConvert('postcodes',
              (v) => (v as List<dynamic>).map((e) => e as String).toList()),
          country_id: $checkedConvert('country_id', (v) => v as int),
          country: $checkedConvert('country', (v) => v as String),
          admin1: $checkedConvert('admin1', (v) => v as String),
          admin2: $checkedConvert('admin2', (v) => v as String),
          admin3: $checkedConvert('admin3', (v) => v as String),
        );
        return val;
      },
    );
