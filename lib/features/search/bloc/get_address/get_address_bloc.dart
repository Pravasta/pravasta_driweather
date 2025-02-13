import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:weather_app/features/search/repository/search_repository.dart';

part 'get_address_event.dart';
part 'get_address_state.dart';
part 'get_address_bloc.freezed.dart';

class GetAddressBloc extends Bloc<GetAddressEvent, GetAddressState> {
  final SearchRepository _repository;

  GetAddressBloc(this._repository) : super(_Initial()) {
    on<_GetAddress>((event, emit) async {
      try {
        emit(_Loading());

        final result =
            await _repository.getAddressFromLatLng(event.lat, event.lng);
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
