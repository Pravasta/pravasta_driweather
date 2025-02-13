import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:weather_app/data/model/response/location_search_response_model.dart';
import 'package:weather_app/features/search/repository/search_repository.dart';

part 'search_address_event.dart';
part 'search_address_state.dart';
part 'search_address_bloc.freezed.dart';

class SearchAddressBloc extends Bloc<SearchAddressEvent, SearchAddressState> {
  final SearchRepository _repository;

  SearchAddressBloc(this._repository) : super(_Initial()) {
    on<_SearchAddress>((event, emit) async {
      try {
        emit(_Loading());

        final result = await _repository.searchAddress(event.input);

        result.fold(
          (l) => emit(_Error(l)),
          (r) => emit(_Loaded(r)),
        );
      } catch (e) {
        emit(_Error(e.toString()));
      }
    });
  }
}
