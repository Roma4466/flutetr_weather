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
          name: $checkedConvert('name', (v) => v as String),
          latitude: $checkedConvert('latitude', (v) => (v as num).toDouble()),
          longitude: $checkedConvert('longitude', (v) => (v as num).toDouble()),
        );
        return val;
      },
    );
