import 'dart:io';

import 'package:weather_app/core/common/endpoint/app_endpoint.dart';
import 'package:weather_app/data/model/response/weather_forecast_hourly_response_model.dart';
import 'package:weather_app/data/model/response/weather_response_model.dart';
import 'package:http/http.dart' as http;

import '../../core/exception/exception.dart';
import '../model/response/weather_forecast_daily_response_model.dart';

abstract class WeatherDatasource {
  Future<WeatherRealtimeResponseModel> getWeatherRealtime(String location);
  Future<WeatherForecastDailyResponseModel> getForecastDailyWeather(
      String location);
  Future<WeatherForecastHourlyResponseModel> getForecastHourlyWeather(
      String location);
}

class WeatherDatasourceImpl implements WeatherDatasource {
  final AppEndpoint _endpoint;
  final http.Client _client;

  WeatherDatasourceImpl({
    required AppEndpoint endpoint,
    required http.Client client,
  })  : _endpoint = endpoint,
        _client = client;

  @override
  Future<WeatherForecastDailyResponseModel> getForecastDailyWeather(
      String location) async {
    try {
      final url = _endpoint.getForecastDailyWeather(location);
      final headers = {
        'Content-Type': 'application/json',
        'accept': 'application/json',
        'accept-encoding': 'deflate, gzip, br'
      };

      final response = await _client.get(
        url,
        headers: headers,
      );

      if (response.statusCode == 200) {
        return WeatherForecastDailyResponseModel.fromJson(response.body);
      } else {
        throw ApiErrorHandler.handleError(
          statusCode: response.statusCode,
          error: 'Failed get Data',
        );
      }
    } catch (e) {
      if (e is SocketException) {
        throw 'Failed to connect to the network';
      } else {
        throw UnknownException(message: e.toString());
      }
    }
  }

  @override
  Future<WeatherForecastHourlyResponseModel> getForecastHourlyWeather(
      String location) async {
    try {
      final url = _endpoint.getForecastHourlyWeather(location);
      final headers = {
        'Content-Type': 'application/json',
        'accept': 'application/json',
        'accept-encoding': 'deflate, gzip, br'
      };

      final response = await _client.get(
        url,
        headers: headers,
      );

      if (response.statusCode == 200) {
        return WeatherForecastHourlyResponseModel.fromJson(response.body);
      } else {
        throw ApiErrorHandler.handleError(
          statusCode: response.statusCode,
          error: 'Failed get Data',
        );
      }
    } catch (e) {
      if (e is SocketException) {
        throw 'Failed to connect to the network';
      } else {
        throw UnknownException(message: e.toString());
      }
    }
  }

  @override
  Future<WeatherRealtimeResponseModel> getWeatherRealtime(
      String location) async {
    try {
      final url = _endpoint.getRealtimeWeather(location);
      final headers = {
        'Content-Type': 'application/json',
        'accept': 'application/json',
        'accept-encoding': 'deflate, gzip, br'
      };

      final response = await _client.get(
        url,
        headers: headers,
      );

      if (response.statusCode == 200) {
        return WeatherRealtimeResponseModel.fromJson(response.body);
      } else {
        throw ApiErrorHandler.handleError(
          statusCode: response.statusCode,
          error: 'Failed get Data',
        );
      }
    } catch (e) {
      if (e is SocketException) {
        throw 'Failed to connect to the network';
      } else {
        throw UnknownException(message: e.toString());
      }
    }
  }

  factory WeatherDatasourceImpl.create() {
    return WeatherDatasourceImpl(
      endpoint: AppEndpoint.create(),
      client: http.Client(),
    );
  }
}
