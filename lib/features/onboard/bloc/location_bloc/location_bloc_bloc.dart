import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:weather_app/features/onboard/repository/onboard_repository.dart';

part 'location_bloc_event.dart';
part 'location_bloc_state.dart';
part 'location_bloc_bloc.freezed.dart';

class LocationBlocBloc extends Bloc<LocationBlocEvent, LocationBlocState> {
  final OnboardRepository _repository;

  LocationBlocBloc(this._repository) : super(_Initial()) {
    on<_GetCurrentPosition>((event, emit) async {
      try {
        emit(_Loading());

        final result = await _repository.getCurrentLocation();

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
