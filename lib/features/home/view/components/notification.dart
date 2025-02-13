import 'package:flutter/material.dart';

import 'package:weather_app/core/constant/style/app_colors.dart';
import 'package:weather_app/core/constant/style/app_text.dart';
import 'package:weather_app/core/extensions/build_context_ext.dart';
import 'package:weather_app/features/home/model/dummy_notification.dart';

Future<dynamic> notification(BuildContext context) {
  return showModalBottomSheet(
    context: context,
    builder: (context) {
      return Container(
        width: context.deviceWidth,
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 40),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Your notification',
                style: AppText.text24.copyWith(
                  color: AppColors.blackColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              Column(
                children: DummyNotification.listNotification
                    .map(
                      (e) => Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            e['status'],
                            style: AppText.text14.copyWith(
                              color: AppColors.blackColor,
                            ),
                          ),
                          SizedBox(height: 10),
                          Column(
                            children: (e['data'] as List<Map<String, dynamic>>)
                                .map(
                                  (e) => Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 0, vertical: 10),
                                    child: Row(
                                      children: [
                                        Image.asset(e['image'], scale: 4),
                                        SizedBox(width: 20),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                e['time'],
                                                style: AppText.text12.copyWith(
                                                  color: AppColors.blackColor,
                                                ),
                                              ),
                                              SizedBox(height: 5),
                                              Text(
                                                e['text'],
                                                style: AppText.text14.copyWith(
                                                  color: AppColors.blackColor,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(width: 10),
                                        Icon(
                                            Icons.keyboard_arrow_down_outlined),
                                      ],
                                    ),
                                  ),
                                )
                                .toList(),
                          ),
                          SizedBox(height: 10),
                        ],
                      ),
                    )
                    .toList(),
              ),
            ],
          ),
        ),
      );
    },
  );
}
