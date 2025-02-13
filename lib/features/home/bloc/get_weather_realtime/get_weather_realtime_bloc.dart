import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:weather_app/data/model/response/weather_response_model.dart';
import 'package:weather_app/features/home/repository/home_repository.dart';

part 'get_weather_realtime_event.dart';
part 'get_weather_realtime_state.dart';
part 'get_weather_realtime_bloc.freezed.dart';

class GetWeatherRealtimeBloc
    extends Bloc<GetWeatherRealtimeEvent, GetWeatherRealtimeState> {
  final HomeRepository _repository;

  GetWeatherRealtimeBloc(this._repository) : super(_Initial()) {
    on<_GetRealtimeWeather>((event, emit) async {
      emit(_Loading());

      final result = await _repository.getWeatherRealtime(event.location);

      result.fold(
        (l) => emit(_Error(l)),
        (r) => emit(_Loaded(r)),
      );
    });
  }
}
