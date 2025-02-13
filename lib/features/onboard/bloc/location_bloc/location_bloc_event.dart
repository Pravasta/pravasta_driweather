part of 'location_bloc_bloc.dart';

@freezed
class LocationBlocEvent with _$LocationBlocEvent {
  const factory LocationBlocEvent.started() = _Started;
  const factory LocationBlocEvent.getCurrentPosition() = _GetCurrentPosition;
}
