import 'package:flutter/material.dart';
import 'package:weather_app/core/constant/other/assets.gen.dart';
import 'package:weather_app/core/constant/style/app_colors.dart';
import 'package:weather_app/core/extensions/build_context_ext.dart';

class BackgroundPage extends StatelessWidget {
  const BackgroundPage({super.key, required this.child});

  final Widget child;

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
                  AppColors.backgroundColor,
                  AppColors.backgroundColorMid,
                  AppColors.backgroundColorLast,
                ],
              ),
            ),
          ),
          Positioned(
            right: 0,
            top: 0,
            child: Image.asset(
              Assets.icons.vector2.path,
              scale: 4,
            ),
          ),
          Positioned(
            left: 0,
            top: context.deviceHeight * 1 / 8,
            child: Image.asset(
              Assets.icons.vector1.path,
              scale: 4,
            ),
          ),
          SizedBox(
            width: context.deviceWidth,
            height: context.deviceHeight,
            child: child,
          ),
        ],
      ),
    );
  }
}
