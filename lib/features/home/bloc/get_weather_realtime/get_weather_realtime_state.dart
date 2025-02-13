part of 'get_weather_realtime_bloc.dart';

@freezed
class GetWeatherRealtimeState with _$GetWeatherRealtimeState {
  const factory GetWeatherRealtimeState.initial() = _Initial;
  const factory GetWeatherRealtimeState.loading() = _Loading;
  const factory GetWeatherRealtimeState.error(String error) = _Error;
  const factory GetWeatherRealtimeState.loaded(Data data) = _Loaded;
}
