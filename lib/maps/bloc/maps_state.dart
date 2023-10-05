part of 'maps_cubit.dart';

@JsonSerializable()
final class MapsState extends Equatable {
  MapsState({
    required this.latitude,
    required this.longitude,
  });

  final double latitude;
  final double longitude;

  @override
  List<Object?> get props => [latitude, longitude];

  Map<String, dynamic> toJson() => _$MapsStateToJson(this);

  factory MapsState.fromJson(Map<String, dynamic> json) =>
      _$MapsStateFromJson(json);
}
