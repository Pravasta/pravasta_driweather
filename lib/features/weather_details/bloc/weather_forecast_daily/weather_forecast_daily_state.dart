part of 'weather_forecast_daily_bloc.dart';

@freezed
class WeatherForecastDailyState with _$WeatherForecastDailyState {
  const factory WeatherForecastDailyState.initial() = _Initial;
  const factory WeatherForecastDailyState.loading() = _Loading;
  const factory WeatherForecastDailyState.error(String error) = _Error;
  const factory WeatherForecastDailyState.loaded(List<Daily> daily) = _Loaded;
}
