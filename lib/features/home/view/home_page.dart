import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/core/common/routes/navigation.dart';
import 'package:weather_app/core/common/routes/routes_name.dart';
import 'package:weather_app/core/components/background/background_page.dart';
import 'package:weather_app/core/components/button/default_button.dart';
import 'package:weather_app/core/components/weather/weather_condition.dart';
import 'package:weather_app/core/components/weather/weather_icon.dart';
import 'package:weather_app/core/constant/other/assets.gen.dart';
import 'package:weather_app/core/constant/style/app_colors.dart';
import 'package:weather_app/core/constant/style/app_text.dart';
import 'package:weather_app/core/extensions/build_context_ext.dart';
import 'package:weather_app/core/extensions/date_time_ext.dart';
import 'package:weather_app/features/home/bloc/get_weather_realtime/get_weather_realtime_bloc.dart';
import 'package:weather_app/features/onboard/bloc/location_bloc/location_bloc_bloc.dart';

import '../../../data/model/response/weather_response_model.dart';
import 'components/notification.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String location = '';

  @override
  void initState() {
    location = context.read<LocationBlocBloc>().state.maybeWhen(
          orElse: () => '',
          loaded: (location) => location,
        );
    context
        .read<GetWeatherRealtimeBloc>()
        .add(GetWeatherRealtimeEvent.getRealtimeWeather(location));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget appBar() {
      return Row(
        spacing: 15,
        children: [
          Image.asset(
            Assets.icons.map.path,
            scale: 4,
          ),
          Expanded(
            child: Text(
              location,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: AppText.text22.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigation.pushName(RoutesName.search);
            },
            child: Icon(
              Icons.keyboard_arrow_down_outlined,
              color: AppColors.whiteColor,
              size: 24,
            ),
          ),
          Spacer(),
          GestureDetector(
            onTap: () {
              notification(context);
            },
            child: Image.asset(
              Assets.icons.notif.path,
              scale: 4,
            ),
          ),
        ],
      );
    }

    Widget iconCloud(Data data) {
      final image = getWeatherIcons(data.values?.weatherCode ?? 0);

      return Image.asset(
        image,
        fit: BoxFit.cover,
        width: 149,
        height: 149,
      );
    }

    Widget detailContent(Data data) {
      final String weatherCondition = getWeatherCondition(
        temperature: data.values?.temperature ?? 0.0,
        humidity: data.values?.humidity ?? 0,
        cloudCover: data.values?.cloudCover ?? 0.0,
        precipitationProbability: data.values?.precipitationProbability ?? 0.0,
      );

      return Material(
        elevation: 3,
        borderRadius: BorderRadius.circular(15),
        child: Container(
          width: context.deviceWidth,
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: Border.all(
              width: 0.8,
              strokeAlign: BorderSide.strokeAlignCenter,
              color: AppColors.whiteColor,
            ),
            color: Color(0xff80bff7),
          ),
          child: Column(
            children: [
              Text(
                'Today, ${DateTime.now().toShortDate()}',
                style: AppText.text16.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text.rich(
                TextSpan(
                  text: '${data.values?.temperature!.round() ?? ''}',
                  style: AppText.text16.copyWith(
                    fontWeight: FontWeight.w500,
                    fontSize: 90,
                  ),
                  children: [
                    WidgetSpan(
                      child: Baseline(
                        baseline: -60,
                        baselineType: TextBaseline.alphabetic,
                        child: Text(
                          '\u00B0',
                          style: AppText.text16.copyWith(
                            fontWeight: FontWeight.w500,
                            fontSize: 60,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                weatherCondition,
                style: AppText.text22.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    spacing: 15,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                        Assets.icons.windy.path,
                        scale: 4,
                      ),
                      Image.asset(
                        Assets.icons.water.path,
                        scale: 4,
                      ),
                    ],
                  ),
                  Column(
                    spacing: 15,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Wind',
                        style: AppText.text16.copyWith(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        'Hum',
                        style: AppText.text16.copyWith(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    spacing: 15,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '|',
                        style: AppText.text16.copyWith(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        '|',
                        style: AppText.text16.copyWith(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    spacing: 15,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${data.values?.windSpeed ?? ''} km/h',
                        style: AppText.text18.copyWith(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        '${data.values?.humidity ?? ''} %',
                        style: AppText.text18.copyWith(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    }

    Widget buttonDetails() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(),
          DefaultButton(
            title: 'Weather Details',
            height: 64,
            iconUrl: Icons.arrow_forward_ios,
            elevation: 3,
            onTap: () {
              Navigation.pushName(
                RoutesName.detail,
                arguments: location,
              );
            },
          ),
          SizedBox(),
        ],
      );
    }

    return BackgroundPage(
      child: BlocBuilder<GetWeatherRealtimeBloc, GetWeatherRealtimeState>(
        builder: (context, state) {
          return state.maybeWhen(
            orElse: () {
              return SizedBox();
            },
            loading: () => Center(child: CircularProgressIndicator()),
            error: (error) => Center(
              child: Text(error, style: AppText.text18),
            ),
            loaded: (data) {
              return Padding(
                padding: EdgeInsets.only(
                  bottom: 30,
                  left: 30,
                  right: 30,
                  top: 50,
                ),
                child: Column(
                  spacing: 30,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    appBar(),
                    iconCloud(data),
                    detailContent(data),
                    buttonDetails(),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
