import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:weather_app/data/model/response/location_response_model.dart';
import 'package:weather_app/features/search/repository/search_repository.dart';

part 'get_lat_lng_event.dart';
part 'get_lat_lng_state.dart';
part 'get_lat_lng_bloc.freezed.dart';

class GetLatLngBloc extends Bloc<GetLatLngEvent, GetLatLngState> {
  final SearchRepository _repository;

  GetLatLngBloc(this._repository) : super(_Initial()) {
    on<_GetLatLng>((event, emit) async {
      try {
        emit(_Loading());

        final result = await _repository.getLatLng();
        result.fold(
          (l) => emit(_Error(l)),
          (r) => emit(_Success(r)),
        );
      } catch (e) {
        emit(_Error(e.toString()));
      }
    });
  }
}
