part of 'get_weather_realtime_bloc.dart';

@freezed
class GetWeatherRealtimeEvent with _$GetWeatherRealtimeEvent {
  const factory GetWeatherRealtimeEvent.started() = _Started;
  const factory GetWeatherRealtimeEvent.getRealtimeWeather(String location) =
      _GetRealtimeWeather;
}
