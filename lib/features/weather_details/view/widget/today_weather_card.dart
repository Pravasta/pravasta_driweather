import 'package:flutter/material.dart';
import 'package:weather_app/core/components/weather/weather_icon.dart';
import 'package:weather_app/core/constant/style/app_colors.dart';
import 'package:weather_app/core/constant/style/app_text.dart';
import 'package:weather_app/core/extensions/date_time_ext.dart';
import 'package:weather_app/data/model/response/weather_forecast_hourly_response_model.dart';

class TodayWeatherCard extends StatelessWidget {
  const TodayWeatherCard(
      {super.key, required this.hourly, required this.index});

  final Hourly hourly;
  final int index;

  @override
  Widget build(BuildContext context) {
    final icons = getWeatherIcons(hourly.values?.weatherCode ?? 0);

    return index == 2
        ? Material(
            borderRadius: BorderRadius.circular(15),
            elevation: 4,
            child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Color(0xff6bbdeb),
                  border: Border.all(width: 0.5, color: AppColors.whiteColor),
                ),
                child: Column(
                  spacing: 15,
                  children: [
                    Text('${hourly.values!.temperature}\u00B0C',
                        style: AppText.text16),
                    Image.asset(
                      icons,
                      scale: 1.7,
                    ),
                    Text(hourly.time!.toFormattedTime(), style: AppText.text16),
                  ],
                )),
          )
        : Column(
            spacing: 15,
            children: [
              Text('${hourly.values!.temperature}\u00B0C',
                  style: AppText.text16),
              Image.asset(
                icons,
                scale: 1.7,
              ),
              Text(hourly.time!.toFormattedTime(), style: AppText.text16),
            ],
          );
  }
}
