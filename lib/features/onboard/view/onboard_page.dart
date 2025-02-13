import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/core/common/routes/navigation.dart';
import 'package:weather_app/core/common/routes/routes_name.dart';
import 'package:weather_app/core/components/button/default_button.dart';
import 'package:weather_app/core/constant/other/assets.gen.dart';
import 'package:weather_app/core/constant/style/app_colors.dart';
import 'package:weather_app/core/constant/style/app_text.dart';
import 'package:weather_app/core/extensions/build_context_ext.dart';
import 'package:weather_app/features/onboard/bloc/location_bloc/location_bloc_bloc.dart';

class OnboardPage extends StatefulWidget {
  const OnboardPage({super.key});

  @override
  State<OnboardPage> createState() => _OnboardPageState();
}

class _OnboardPageState extends State<OnboardPage> {
  @override
  void initState() {
    context
        .read<LocationBlocBloc>()
        .add(LocationBlocEvent.getCurrentPosition());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: context.deviceWidth,
            height: context.deviceHeight,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
                  Color(0xffecf5ff),
                  Color(0xffd6e7f9),
                  Color(0xffa5d0fb),
                  Color(0xff93c6f9),
                  Color(0xff67aff6),
                  Color(0xff5daaf5),
                ],
              ),
            ),
          ),
          Positioned(
            child: Image.asset(
              Assets.icons.ellips.path,
              scale: 1,
            ),
          ),
          Positioned(
            top: context.deviceHeight * 1 / 9,
            child: Image.asset(
              Assets.icons.sunHome.path,
              scale: 4,
            ),
          ),
          Positioned(
            bottom: context.deviceHeight * 1 / 6,
            right: 0,
            child: Image.asset(
              Assets.icons.cloudHome.path,
              scale: 4,
            ),
          ),
          Positioned(
            bottom: context.deviceHeight * 1 / 14,
            child: Container(
              padding: EdgeInsets.all(30),
              width: context.deviceWidth,
              child: Column(
                spacing: 20,
                children: [
                  Text(
                    'Never get caught in the rain again',
                    style: AppText.text30.copyWith(
                      color: AppColors.blackColor,
                      fontSize: 36,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    'Stay ahead of the weather with our accurate forecasts',
                    style: AppText.text14.copyWith(
                      color: AppColors.blackColor,
                    ),
                  ),
                  DefaultButton(
                    title: 'Get Started',
                    width: context.deviceWidth,
                    onTap: () {
                      Navigation.pushReplacement(RoutesName.home);
                    },
                    height: 60,
                    elevation: 3,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
