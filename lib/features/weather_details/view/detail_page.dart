import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/core/common/routes/navigation.dart';
import 'package:weather_app/core/components/background/background_page.dart';
import 'package:weather_app/core/constant/style/app_colors.dart';
import 'package:weather_app/core/constant/style/app_text.dart';
import 'package:weather_app/core/extensions/build_context_ext.dart';
import 'package:weather_app/core/extensions/date_time_ext.dart';
import 'package:weather_app/features/weather_details/bloc/weather_forecast_daily/weather_forecast_daily_bloc.dart';
import 'package:weather_app/features/weather_details/bloc/weather_forecast_hourly/weather_forecast_hourly_bloc.dart';
import 'package:weather_app/features/weather_details/view/widget/next_forecast_card.dart';
import 'package:weather_app/features/weather_details/view/widget/today_weather_card.dart';

import '../../../core/constant/other/assets.gen.dart';
import '../../../data/model/response/weather_forecast_hourly_response_model.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key, required this.location});

  final String location;

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  void initState() {
    super.initState();

    context.read<WeatherForecastHourlyBloc>().add(
        WeatherForecastHourlyEvent.getWeatherForecastHourly(widget.location));
    context.read<WeatherForecastDailyBloc>().add(
        WeatherForecastDailyEvent.getWeatherForecastDaily(widget.location));
  }

  @override
  Widget build(BuildContext context) {
    Widget appBar() {
      return Row(
        children: [
          GestureDetector(
            onTap: () {
              Navigation.pop();
            },
            child: Icon(
              Icons.arrow_back_ios_new_outlined,
              color: AppColors.whiteColor,
            ),
          ),
          SizedBox(width: 20),
          Text(
            'Back',
            style: AppText.text24,
          )
        ],
      );
    }

    Widget titleNextForecast() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Next Forecast',
            style: AppText.text24.copyWith(fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
        ],
      );
    }

    Widget weatherToday() {
      return BlocBuilder<WeatherForecastHourlyBloc, WeatherForecastHourlyState>(
        builder: (context, state) {
          return state.maybeWhen(
            orElse: () => SizedBox(),
            loading: () => Center(child: CircularProgressIndicator()),
            error: (error) => Center(
              child: Text(error, style: AppText.text18),
            ),
            loaded: (hourly) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Today',
                        style: AppText.text24
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        DateTime.now().toShortMonth(),
                        style: AppText.text18,
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: hourly.asMap().entries.map((entry) {
                      int index = entry.key;
                      Hourly hourlyData = entry.value;

                      return TodayWeatherCard(hourly: hourlyData, index: index);
                    }).toList(),
                  ),
                  SizedBox(height: 30),
                ],
              );
            },
          );
        },
      );
    }

    Widget nextForecast() {
      return BlocBuilder<WeatherForecastDailyBloc, WeatherForecastDailyState>(
        builder: (context, state) {
          return state.maybeWhen(
            orElse: () => SizedBox(),
            loading: () => Center(child: CircularProgressIndicator()),
            error: (error) => Center(
              child: Text(error, style: AppText.text18),
            ),
            loaded: (daily) {
              return Padding(
                padding: EdgeInsets.only(right: 20, top: 20, bottom: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  spacing: 30,
                  children: daily
                      .map(
                        (data) => NextForecastCard(daily: data),
                      )
                      .toList(),
                ),
              );
            },
          );
        },
      );
    }

    Widget footer() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            Assets.icons.sun.path,
            scale: 4,
            color: AppColors.whiteColor,
          ),
          SizedBox(width: 20),
          Text('DRI Weather', style: AppText.text18),
        ],
      );
    }

    return BackgroundPage(
      child: Container(
        width: context.deviceWidth,
        height: context.deviceHeight,
        padding: EdgeInsets.symmetric(vertical: 40, horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            appBar(),
            weatherToday(),
            titleNextForecast(),
            Expanded(
              child: Scrollbar(
                trackVisibility: true,
                thumbVisibility: true,
                radius: Radius.circular(15),
                thickness: 7,
                interactive: true,
                child: SingleChildScrollView(
                  child: nextForecast(),
                ),
              ),
            ),
            SizedBox(height: 20),
            footer(),
          ],
        ),
      ),
    );
  }
}
