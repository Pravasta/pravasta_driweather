import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/features/home/bloc/get_weather_realtime/get_weather_realtime_bloc.dart';
import 'package:weather_app/features/onboard/bloc/location_bloc/location_bloc_bloc.dart';
import 'package:weather_app/features/home/repository/home_repository.dart';
import 'package:weather_app/features/onboard/repository/onboard_repository.dart';
import 'package:weather_app/features/search/bloc/get_address/get_address_bloc.dart';
import 'package:weather_app/features/search/bloc/get_lat_lng/get_lat_lng_bloc.dart';
import 'package:weather_app/features/search/bloc/search_address/search_address_bloc.dart';
import 'package:weather_app/features/search/repository/search_repository.dart';
import 'package:weather_app/features/weather_details/bloc/weather_forecast_daily/weather_forecast_daily_bloc.dart';
import 'package:weather_app/features/weather_details/bloc/weather_forecast_hourly/weather_forecast_hourly_bloc.dart';
import 'package:weather_app/features/weather_details/repository/weather_detail_repository.dart';

import 'core/common/routes/navigation.dart';
import 'core/common/routes/routes_handler.dart';
import 'core/common/routes/routes_name.dart';
import 'core/utils/route_observer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => GetWeatherRealtimeBloc(HomeRepositoryImpl.create()),
        ),
        BlocProvider(
          create: (_) =>
              WeatherForecastDailyBloc(WeatherDetailRepositoryImpl.create()),
        ),
        BlocProvider(
          create: (_) =>
              WeatherForecastHourlyBloc(WeatherDetailRepositoryImpl.create()),
        ),
        BlocProvider(
          create: (_) => LocationBlocBloc(OnboardRepositoryImpl.create()),
        ),
        BlocProvider(
          create: (_) => GetLatLngBloc(SearchRepositoryImpl.create()),
        ),
        BlocProvider(
          create: (_) => GetAddressBloc(SearchRepositoryImpl.create()),
        ),
        BlocProvider(
          create: (_) => SearchAddressBloc(SearchRepositoryImpl.create()),
        ),
      ],
      child: MaterialApp(
        title: 'Pravasta_DRIWeather',
        navigatorKey: navigatorKey,
        initialRoute: RoutesName.initial,
        onGenerateRoute: RoutesHandler.onGenerateRoute,
        debugShowCheckedModeBanner: false,
        navigatorObservers: [routeObserver],
      ),
    );
  }
}
