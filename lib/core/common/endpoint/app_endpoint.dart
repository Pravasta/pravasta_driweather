import '../../variables/variable.dart';
import 'uri_helper.dart';

class AppEndpoint {
  final String _baseUrl;
  final String _apiKey;

  AppEndpoint({
    required String baseUrl,
    required String apiKey,
  })  : _baseUrl = baseUrl,
        _apiKey = apiKey;

  Uri getRealtimeWeather(String location) {
    return UriHelper.createUrl(
      host: _baseUrl,
      path: 'v4/weather/realtime',
      queryParameters: {
        'location': location,
        'apikey': _apiKey,
      },
    );
  }

  Uri getForecastDailyWeather(String location) {
    return UriHelper.createUrl(
      host: _baseUrl,
      path: 'v4/weather/forecast',
      queryParameters: {
        'location': location,
        'timesteps': '1d',
        'apikey': _apiKey,
      },
    );
  }

  Uri getForecastHourlyWeather(String location) {
    return UriHelper.createUrl(
      host: _baseUrl,
      path: 'v4/weather/forecast',
      queryParameters: {
        'location': location,
        'timesteps': '1h',
        'apikey': _apiKey,
      },
    );
  }

  factory AppEndpoint.create() {
    return AppEndpoint(
      baseUrl: Variable.baseUrl,
      apiKey: Variable.apiKey,
    );
  }
}
