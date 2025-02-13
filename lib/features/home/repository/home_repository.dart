import 'package:dartz/dartz.dart';
import 'package:weather_app/data/datasources/weather_datasource.dart';
import 'package:weather_app/data/model/response/weather_response_model.dart';

abstract class HomeRepository {
  Future<Either<String, Data>> getWeatherRealtime(String location);
}

class HomeRepositoryImpl implements HomeRepository {
  final WeatherDatasource _datasource;

  HomeRepositoryImpl({
    required WeatherDatasource datasource,
  }) : _datasource = datasource;

  @override
  Future<Either<String, Data>> getWeatherRealtime(String location) async {
    try {
      final execute = await _datasource.getWeatherRealtime(location);
      return Right(execute.data!);
    } catch (e) {
      return Left(e.toString());
    }
  }

  factory HomeRepositoryImpl.create() {
    return HomeRepositoryImpl(
      datasource: WeatherDatasourceImpl.create(),
    );
  }
}
