import 'package:flutter/services.dart';
import 'package:geocoding/geocoding.dart' as geo;
import 'package:http/http.dart' as http;

import 'package:location/location.dart';
import 'package:weather_app/core/variables/variable.dart';

import 'package:weather_app/data/model/response/location_response_model.dart';

import '../../core/exception/api_error_handler.dart';
import '../model/response/location_search_response_model.dart';

abstract class LocationDatasource {
  Future<LocationResponseModel> getCurrentPosition();
  Future<String> getAddressFromLatLng(double lat, double lng);
  Future<LocationSearchResponseModel> searchAddress(String input, String token);
}

class LocationDatasourceImpl implements LocationDatasource {
  double? latitude;
  double? longitude;
  String? myLocation;

  final http.Client _client;

  LocationDatasourceImpl({required http.Client client}) : _client = client;

  @override
  Future<String> getAddressFromLatLng(double lat, double lng) async {
    try {
      List<geo.Placemark> placemarks =
          await geo.placemarkFromCoordinates(lat, lng);

      geo.Placemark place = placemarks[0];
      myLocation = place.subLocality;
      // print('1${place.administrativeArea}');
      // print('2${place.country}');
      // print('3${place.locality}');
      // print('4${place.name}');
      // print('5${place.postalCode}');
      // print('6${place.street}');
      // print('7${place.subAdministrativeArea}');
      // print('8${place.subLocality}');
      // print('9${place.subThoroughfare}');
      // print('10${place.thoroughfare}');

      return myLocation ?? '';
    } catch (e) {
      throw e.toString();
    }
  }

  @override
  Future<LocationResponseModel> getCurrentPosition() async {
    Location location = Location();
    bool serviceEnabled;
    PermissionStatus permissionStatus;
    LocationData locationData;

    try {
      serviceEnabled = await location.serviceEnabled();
      if (!serviceEnabled) {
        serviceEnabled = await location.requestService();
        if (!serviceEnabled) {
          throw Exception("Location service is not enabled");
        }
      }

      permissionStatus = await location.hasPermission();
      if (permissionStatus == PermissionStatus.denied) {
        permissionStatus = await location.requestPermission();
        if (permissionStatus == PermissionStatus.granted) {
          throw Exception("Location permission denied");
        }
      }

      locationData = await location.getLocation();
      latitude = locationData.latitude;
      longitude = locationData.longitude;

      if (latitude != null && longitude != null) {
        myLocation = await getAddressFromLatLng(latitude!, longitude!);
      }

      return LocationResponseModel(
        latitude: latitude,
        longitude: longitude,
        location: myLocation,
      );
    } on PlatformException catch (e) {
      if (e.code == 'IO_ERROR') {
        throw 'Network error occurred while looking up coordinates: ${e.message}';
      } else {
        throw 'Failed to lookup coordinates: ${e.message}';
      }
    } catch (e) {
      throw 'An unknown error occurred: $e';
    }
  }

  @override
  Future<LocationSearchResponseModel> searchAddress(
      String input, String token) async {
    try {
      final baseUrl =
          'https://maps.gomaps.pro/maps/api/place/autocomplete/json';
      final request =
          '$baseUrl?input=$input&key=${Variable.googleApiKey}&sessiontoken=$token';

      var response = await _client.get(Uri.parse(request));

      if (response.statusCode == 200) {
        return LocationSearchResponseModel.fromJson(response.body);
      } else {
        throw ApiErrorHandler.handleError(
          statusCode: response.statusCode,
          error: 'Error From API',
        );
      }
    } catch (e) {
      throw e.toString();
    }
  }

  factory LocationDatasourceImpl.create() {
    return LocationDatasourceImpl(client: http.Client());
  }
}
