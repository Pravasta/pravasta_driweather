part of 'weather_forecast_daily_bloc.dart';

@freezed
class WeatherForecastDailyEvent with _$WeatherForecastDailyEvent {
  const factory WeatherForecastDailyEvent.started() = _Started;
  const factory WeatherForecastDailyEvent.getWeatherForecastDaily(
      String location) = _GetWeatherForecastDaily;
}
