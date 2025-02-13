import 'package:weather_app/core/constant/other/assets.gen.dart';

class DummyNotification {
  static final List<Map<String, dynamic>> listNotification = [
    {
      'status': 'new',
      'data': [
        {
          'image': Assets.icons.sun.path,
          'time': '10 minutes ago',
          'text':
              'A sunny day in your location, consider wearing your UV protection',
        }
      ],
    },
    {
      'status': 'earlier',
      'data': [
        {
          'image': Assets.icons.windy.path,
          'time': '1 day ago',
          'text':
              'A cloudy day will occur all day long, don\'t worry about the heat of the sun',
        },
        {
          'image': Assets.icons.raini.path,
          'time': '2 day ago',
          'text':
              'Potential for rain today is 84%, don\'t forget to bring your umbrella',
        }
      ],
    },
  ];
}
