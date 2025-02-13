part of 'get_lat_lng_bloc.dart';

@freezed
class GetLatLngState with _$GetLatLngState {
  const factory GetLatLngState.initial() = _Initial;
  const factory GetLatLngState.loading() = _Loading;
  const factory GetLatLngState.error(String error) = _Error;
  const factory GetLatLngState.success(LocationResponseModel data) = _Success;
}
