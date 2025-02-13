part of 'get_address_bloc.dart';

@freezed
class GetAddressState with _$GetAddressState {
  const factory GetAddressState.initial() = _Initial;
  const factory GetAddressState.loading() = _Loading;
  const factory GetAddressState.error(String error) = _Error;
  const factory GetAddressState.loaded(String address) = _Loaded;
}
