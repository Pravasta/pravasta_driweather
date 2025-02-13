part of 'weather_forecast_hourly_bloc.dart';

@freezed
class WeatherForecastHourlyEvent with _$WeatherForecastHourlyEvent {
  const factory WeatherForecastHourlyEvent.started() = _Started;
  const factory WeatherForecastHourlyEvent.getWeatherForecastHourly(
      String location) = _GetWeatherForecastHourly;
}
