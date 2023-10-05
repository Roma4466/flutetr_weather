// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'maps_cubit.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MapsState _$MapsStateFromJson(Map<String, dynamic> json) => $checkedCreate(
      'MapsState',
      json,
      ($checkedConvert) {
        final val = MapsState(
          latitude: $checkedConvert('latitude', (v) => (v as num).toDouble()),
          longitude: $checkedConvert('longitude', (v) => (v as num).toDouble()),
        );
        return val;
      },
    );

Map<String, dynamic> _$MapsStateToJson(MapsState instance) => <String, dynamic>{
      'latitude': instance.latitude,
      'longitude': instance.longitude,
    };
