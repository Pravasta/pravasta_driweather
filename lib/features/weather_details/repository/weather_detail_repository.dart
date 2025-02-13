import 'package:dartz/dartz.dart';
import 'package:weather_app/data/datasources/weather_datasource.dart';
import 'package:weather_app/data/model/response/weather_forecast_hourly_response_model.dart';

import '../../../data/model/response/weather_forecast_daily_response_model.dart';

abstract class WeatherDetailRepository {
  Future<Either<String, List<Daily>>> getWeatherDailyForecast(String location);
  Future<Either<String, List<Hourly>>> getWeatherHourlyForecast(
      String location);
}

class WeatherDetailRepositoryImpl implements WeatherDetailRepository {
  final WeatherDatasource _datasource;

  WeatherDetailRepositoryImpl({required WeatherDatasource datasource})
      : _datasource = datasource;

  @override
  Future<Either<String, List<Daily>>> getWeatherDailyForecast(
      String location) async {
    try {
      final result = await _datasource.getForecastDailyWeather(location);
      return Right(result.timelines?.daily ?? []);
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, List<Hourly>>> getWeatherHourlyForecast(
      String location) async {
    try {
      final result = await _datasource.getForecastHourlyWeather(location);
      return Right(result.timelines?.hourly ?? []);
    } catch (e) {
      return Left(e.toString());
    }
  }

  factory WeatherDetailRepositoryImpl.create() {
    return WeatherDetailRepositoryImpl(
      datasource: WeatherDatasourceImpl.create(),
    );
  }
}
