import 'package:dartz/dartz.dart';
import 'package:weather_app/data/datasources/location_datasource.dart';

abstract class OnboardRepository {
  Future<Either<String, String>> getCurrentLocation();
}

class OnboardRepositoryImpl implements OnboardRepository {
  final LocationDatasource _locationDatasource;

  OnboardRepositoryImpl({
    required LocationDatasource locationDatasource,
  }) : _locationDatasource = locationDatasource;

  @override
  Future<Either<String, String>> getCurrentLocation() async {
    try {
      final execute = await _locationDatasource.getCurrentPosition();
      return Right(execute.location ?? '');
    } catch (e) {
      return Left(e.toString());
    }
  }

  factory OnboardRepositoryImpl.create() {
    return OnboardRepositoryImpl(
      locationDatasource: LocationDatasourceImpl.create(),
    );
  }
}
