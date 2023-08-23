import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'temperature.g.dart';

@JsonSerializable()
class Temperature extends Equatable {
  const Temperature({
    required this.value,
    required this.minValue,
    required this.maxValue,
    required this.feelsLike,
  });

  factory Temperature.fromJson(Map<String, dynamic> json) =>
      _$TemperatureFromJson(json);

  final double value;
  final double minValue;
  final double maxValue;
  final double feelsLike;

  Map<String, dynamic> toJson() => _$TemperatureToJson(this);

  @override
  List<Object> get props => [value];
}
