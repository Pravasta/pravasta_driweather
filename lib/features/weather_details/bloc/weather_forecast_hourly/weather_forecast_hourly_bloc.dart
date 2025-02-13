import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:weather_app/data/model/response/weather_forecast_hourly_response_model.dart';
import 'package:weather_app/features/weather_details/repository/weather_detail_repository.dart';

part 'weather_forecast_hourly_event.dart';
part 'weather_forecast_hourly_state.dart';
part 'weather_forecast_hourly_bloc.freezed.dart';

class WeatherForecastHourlyBloc
    extends Bloc<WeatherForecastHourlyEvent, WeatherForecastHourlyState> {
  final WeatherDetailRepository _repository;

  WeatherForecastHourlyBloc(this._repository) : super(_Initial()) {
    on<_GetWeatherForecastHourly>((event, emit) async {
      try {
        emit(_Loading());

        final result =
            await _repository.getWeatherHourlyForecast(event.location);

        result.fold(
          (l) => emit(_Error(l)),
          (r) {
            r.map((e) => e.time!.toLocal()).toList();

            r.sort((a, b) => a.time!.compareTo(b.time!));

            DateTime now = DateTime.now();

            int closestIndex = r.indexWhere((data) {
              return data.time!.hour == now.hour;
            });

            if (closestIndex == -1) {
              closestIndex = r.indexWhere((data) => data.time!.isAfter(now));

              if (closestIndex == -1) {
                closestIndex = r.length - 1;
              }
            }

            int start = (closestIndex - 2).clamp(0, r.length - 1);
            int end = (closestIndex + 2).clamp(0, r.length - 1);
            List<Hourly> filteredData = r.sublist(start, end + 1);

            while (filteredData.length < 5) {
              if (start > 0) {
                start--;
                filteredData.insert(0, r[start]);
              } else if (end < r.length - 1) {
                end++;
                filteredData.add(r[end]);
              } else {
                break;
              }
            }

            emit(_Loaded(filteredData));
          },
        );
      } catch (e) {
        emit(_Error(e.toString()));
      }
    });
  }
}
