import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:weather_repository/weather_repository.dart';

part 'maps_cubit.g.dart';

part 'maps_state.dart';

class MapsCubit extends HydratedCubit<MapsState> {
  MapsCubit(this._weatherRepository)
      : super(MapsState(
          latitude: 37.42796133580664,
          longitude: -122.085749655962,
        ));

  final WeatherRepository _weatherRepository;

  @override
  MapsState fromJson(Map<String, dynamic> json) => MapsState.fromJson(json);

  @override
  Map<String, dynamic> toJson(MapsState state) => state.toJson();
}
