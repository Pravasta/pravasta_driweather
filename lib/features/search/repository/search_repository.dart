import 'package:dartz/dartz.dart';
import 'package:weather_app/data/datasources/location_datasource.dart';
import 'package:weather_app/data/model/response/location_response_model.dart';
import 'package:weather_app/data/model/response/location_search_response_model.dart';

abstract class SearchRepository {
  Future<Either<String, LocationResponseModel>> getLatLng();
  Future<Either<String, String>> getAddressFromLatLng(double lat, double lng);
  Future<Either<String, List<Feature>>> searchAddress(String input);
}

class SearchRepositoryImpl implements SearchRepository {
  final LocationDatasource _datasource;

  SearchRepositoryImpl({
    required LocationDatasource datasource,
  }) : _datasource = datasource;

  @override
  Future<Either<String, LocationResponseModel>> getLatLng() async {
    try {
      final execute = await _datasource.getCurrentPosition();
      return Right(execute);
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, String>> getAddressFromLatLng(
      double lat, double lng) async {
    try {
      final execute = await _datasource.getAddressFromLatLng(lat, lng);
      return Right(execute);
    } catch (e) {
      return Left("Location not found");
    }
  }

  @override
  Future<Either<String, List<Feature>>> searchAddress(String input) async {
    try {
      final execute = await _datasource.searchAddress(input);
      return Right(execute.features ?? []);
    } catch (e) {
      return Left(e.toString());
    }
  }

  factory SearchRepositoryImpl.create() {
    return SearchRepositoryImpl(
      datasource: LocationDatasourceImpl.create(),
    );
  }
}
