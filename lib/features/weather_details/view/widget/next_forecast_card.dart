import 'package:flutter/material.dart';
import 'package:weather_app/core/components/weather/weather_icon.dart';
import 'package:weather_app/core/extensions/date_time_ext.dart';
import 'package:weather_app/data/model/response/weather_forecast_daily_response_model.dart';

import '../../../../core/constant/style/app_text.dart';

class NextForecastCard extends StatelessWidget {
  const NextForecastCard({super.key, required this.daily});

  final Daily daily;

  @override
  Widget build(BuildContext context) {
    final iconsTemp = getWeatherIcons(daily.values!.weatherCodeMax ?? 0);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          daily.time!.toShortMonth(),
          style: AppText.text18.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        Image.asset(
          iconsTemp,
          scale: 1.5,
        ),
        Text(
          '${daily.values!.temperatureAvg ?? 0.0}\u00B0',
          style: AppText.text18.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
