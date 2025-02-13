import 'package:flutter/material.dart';
import 'package:weather_app/features/home/view/home_page.dart';
import 'package:weather_app/features/search/view/search_page.dart';

import '../../../features/onboard/view/onboard_page.dart';
import '../../../features/weather_details/view/detail_page.dart';
import '../../constant/style/app_text.dart';
import 'routes_name.dart';

class RoutesHandler {
  final String initialRoutes = RoutesName.initial;
  static const initialNavbarVisibility = true;

  static MaterialPageRoute get _emptyPage {
    return MaterialPageRoute(
      builder: (context) {
        return Scaffold(
          body: Center(
            child: Text(
              'Not Found',
              style: AppText.text24.copyWith(fontWeight: FontWeight.bold),
            ),
          ),
        );
      },
    );
  }

  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.initial:
        return MaterialPageRoute(
          builder: (context) => OnboardPage(),
          settings: settings,
        );
      case RoutesName.home:
        return MaterialPageRoute(
          builder: (context) => HomePage(),
          settings: settings,
        );
      case RoutesName.search:
        return MaterialPageRoute(
          builder: (context) => SearchPage(),
          settings: settings,
        );
      case RoutesName.detail:
        final location = settings.arguments;
        if (location == null || location is! String) return _emptyPage;
        return MaterialPageRoute(
          builder: (context) => DetailPage(location: location),
          settings: settings,
        );

      default:
        return _emptyPage;
    }
  }
}
