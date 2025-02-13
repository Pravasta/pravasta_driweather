part of 'search_address_bloc.dart';

@freezed
class SearchAddressState with _$SearchAddressState {
  const factory SearchAddressState.initial() = _Initial;
  const factory SearchAddressState.loading() = _Loading;
  const factory SearchAddressState.error(String error) = _Error;
  const factory SearchAddressState.loaded(List<Feature> data) = _Loaded;
}
