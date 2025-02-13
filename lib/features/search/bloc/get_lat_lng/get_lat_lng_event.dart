part of 'get_lat_lng_bloc.dart';

@freezed
class GetLatLngEvent with _$GetLatLngEvent {
  const factory GetLatLngEvent.started() = _Started;
  const factory GetLatLngEvent.getLatLng() = _GetLatLng;
}
