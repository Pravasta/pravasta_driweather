import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:weather_app/features/weather_details/repository/weather_detail_repository.dart';

import '../../../../data/model/response/weather_forecast_daily_response_model.dart';

part 'weather_forecast_daily_event.dart';
part 'weather_forecast_daily_state.dart';
part 'weather_forecast_daily_bloc.freezed.dart';

class WeatherForecastDailyBloc
    extends Bloc<WeatherForecastDailyEvent, WeatherForecastDailyState> {
  final WeatherDetailRepository _repository;

  WeatherForecastDailyBloc(this._repository) : super(_Initial()) {
    final List<Daily> listDate = [];

    on<_GetWeatherForecastDaily>(
      (event, emit) async {
        try {
          emit(_Loading());

          final result =
              await _repository.getWeatherDailyForecast(event.location);

          result.fold(
            (l) => emit(_Error(l)),
            (r) {
              r.map((e) {
                e.time!.toLocal();
                if (e.time!.day > DateTime.now().day) {
                  listDate.add(e);
                }
              }).toList();

              emit(_Loaded(listDate));
            },
          );
        } catch (e) {
          emit(_Error(e.toString()));
        }
      },
    );
  }
}
