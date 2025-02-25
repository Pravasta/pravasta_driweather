part of 'get_address_bloc.dart';

@freezed
class GetAddressEvent with _$GetAddressEvent {
  const factory GetAddressEvent.started() = _Started;
  const factory GetAddressEvent.getAddress(double lat, double lng) =
      _GetAddress;
}
