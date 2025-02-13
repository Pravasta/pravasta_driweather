part of 'search_address_bloc.dart';

@freezed
class SearchAddressEvent with _$SearchAddressEvent {
  const factory SearchAddressEvent.started() = _Started;
  const factory SearchAddressEvent.searchAddress(String input) = _SearchAddress;
}
