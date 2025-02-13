part of 'weather_forecast_hourly_bloc.dart';

@freezed
class WeatherForecastHourlyState with _$WeatherForecastHourlyState {
  const factory WeatherForecastHourlyState.initial() = _Initial;
  const factory WeatherForecastHourlyState.loading() = _Loading;
  const factory WeatherForecastHourlyState.error(String error) = _Error;
  const factory WeatherForecastHourlyState.loaded(List<Hourly> hourly) =
      _Loaded;
}
