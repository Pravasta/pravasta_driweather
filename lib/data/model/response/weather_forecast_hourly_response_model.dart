import 'dart:convert';

import 'weather_response_model.dart';

class WeatherForecastHourlyResponseModel {
  final TimelinesHourly? timelines;
  final Location? location;

  WeatherForecastHourlyResponseModel({
    this.timelines,
    this.location,
  });

  factory WeatherForecastHourlyResponseModel.fromJson(String str) =>
      WeatherForecastHourlyResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory WeatherForecastHourlyResponseModel.fromMap(
          Map<String, dynamic> json) =>
      WeatherForecastHourlyResponseModel(
        timelines: json["timelines"] == null
            ? null
            : TimelinesHourly.fromMap(json["timelines"]),
        location: json["location"] == null
            ? null
            : Location.fromMap(json["location"]),
      );

  Map<String, dynamic> toMap() => {
        "timelines": timelines?.toMap(),
        "location": location?.toMap(),
      };
}

class TimelinesHourly {
  final List<Hourly>? hourly;

  TimelinesHourly({
    this.hourly,
  });

  factory TimelinesHourly.fromJson(String str) =>
      TimelinesHourly.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory TimelinesHourly.fromMap(Map<String, dynamic> json) => TimelinesHourly(
        hourly: json["hourly"] == null
            ? []
            : List<Hourly>.from(json["hourly"]!.map((x) => Hourly.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "hourly": hourly == null
            ? []
            : List<dynamic>.from(hourly!.map((x) => x.toMap())),
      };
}

class Hourly {
  final DateTime? time;
  final ValuesHourly? values;

  Hourly({
    this.time,
    this.values,
  });

  factory Hourly.fromJson(String str) => Hourly.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Hourly.fromMap(Map<String, dynamic> json) => Hourly(
        time: json["time"] == null ? null : DateTime.parse(json["time"]),
        values: json["values"] == null
            ? null
            : ValuesHourly.fromMap(json["values"]),
      );

  Map<String, dynamic> toMap() => {
        "time": time?.toIso8601String(),
        "values": values?.toMap(),
      };
}

class ValuesHourly {
  final double? cloudBase;
  final double? cloudCeiling;
  final double? cloudCover;
  final double? dewPoint;
  final double? evapotranspiration;
  final double? freezingRainIntensity;
  final double? hailProbability;
  final double? hailSize;
  final double? humidity;
  final double? iceAccumulation;
  final double? iceAccumulationLwe;
  final double? precipitationProbability;
  final double? pressureSeaLevel;
  final double? pressureSurfaceLevel;
  final double? rainAccumulation;
  final double? rainAccumulationLwe;
  final double? rainIntensity;
  final double? sleetAccumulation;
  final double? sleetAccumulationLwe;
  final double? sleetIntensity;
  final double? snowAccumulation;
  final double? snowAccumulationLwe;
  final double? snowIntensity;
  final double? temperature;
  final double? temperatureApparent;
  final double? uvHealthConcern;
  final double? uvIndex;
  final double? visibility;
  final int? weatherCode;
  final double? windDirection;
  final double? windGust;
  final double? windSpeed;

  ValuesHourly({
    this.cloudBase,
    this.cloudCeiling,
    this.cloudCover,
    this.dewPoint,
    this.evapotranspiration,
    this.freezingRainIntensity,
    this.hailProbability,
    this.hailSize,
    this.humidity,
    this.iceAccumulation,
    this.iceAccumulationLwe,
    this.precipitationProbability,
    this.pressureSeaLevel,
    this.pressureSurfaceLevel,
    this.rainAccumulation,
    this.rainAccumulationLwe,
    this.rainIntensity,
    this.sleetAccumulation,
    this.sleetAccumulationLwe,
    this.sleetIntensity,
    this.snowAccumulation,
    this.snowAccumulationLwe,
    this.snowIntensity,
    this.temperature,
    this.temperatureApparent,
    this.uvHealthConcern,
    this.uvIndex,
    this.visibility,
    this.weatherCode,
    this.windDirection,
    this.windGust,
    this.windSpeed,
  });

  factory ValuesHourly.fromJson(String str) =>
      ValuesHourly.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ValuesHourly.fromMap(Map<String, dynamic> json) => ValuesHourly(
        cloudBase: json["cloudBase"]?.toDouble(),
        cloudCeiling: json["cloudCeiling"]?.toDouble(),
        cloudCover: json["cloudCover"]?.toDouble(),
        dewPoint: json["dewPoint"]?.toDouble(),
        evapotranspiration: json["evapotranspiration"]?.toDouble(),
        freezingRainIntensity: json["freezingRainIntensity"]?.toDouble(),
        hailProbability: json["hailProbability"]?.toDouble(),
        hailSize: json["hailSize"]?.toDouble(),
        humidity: json["humidity"]?.toDouble(),
        iceAccumulation: json["iceAccumulation"]?.toDouble(),
        iceAccumulationLwe: json["iceAccumulationLwe"]?.toDouble(),
        precipitationProbability: json["precipitationProbability"]?.toDouble(),
        pressureSeaLevel: json["pressureSeaLevel"]?.toDouble(),
        pressureSurfaceLevel: json["pressureSurfaceLevel"]?.toDouble(),
        rainAccumulation: json["rainAccumulation"]?.toDouble(),
        rainAccumulationLwe: json["rainAccumulationLwe"]?.toDouble(),
        rainIntensity: json["rainIntensity"]?.toDouble(),
        sleetAccumulation: json["sleetAccumulation"]?.toDouble(),
        sleetAccumulationLwe: json["sleetAccumulationLwe"]?.toDouble(),
        sleetIntensity: json["sleetIntensity"]?.toDouble(),
        snowAccumulation: json["snowAccumulation"]?.toDouble(),
        snowAccumulationLwe: json["snowAccumulationLwe"]?.toDouble(),
        snowIntensity: json["snowIntensity"]?.toDouble(),
        temperature: json["temperature"]?.toDouble(),
        temperatureApparent: json["temperatureApparent"]?.toDouble(),
        uvHealthConcern: json["uvHealthConcern"]?.toDouble(),
        uvIndex: json["uvIndex"]?.toDouble(),
        visibility: json["visibility"]?.toDouble(),
        weatherCode: json["weatherCode"],
        windDirection: json["windDirection"]?.toDouble(),
        windGust: json["windGust"]?.toDouble(),
        windSpeed: json["windSpeed"]?.toDouble(),
      );

  Map<String, dynamic> toMap() => {
        "cloudBase": cloudBase,
        "cloudCeiling": cloudCeiling,
        "cloudCover": cloudCover,
        "dewPoint": dewPoint,
        "evapotranspiration": evapotranspiration,
        "freezingRainIntensity": freezingRainIntensity,
        "hailProbability": hailProbability,
        "hailSize": hailSize,
        "humidity": humidity,
        "iceAccumulation": iceAccumulation,
        "iceAccumulationLwe": iceAccumulationLwe,
        "precipitationProbability": precipitationProbability,
        "pressureSeaLevel": pressureSeaLevel,
        "pressureSurfaceLevel": pressureSurfaceLevel,
        "rainAccumulation": rainAccumulation,
        "rainAccumulationLwe": rainAccumulationLwe,
        "rainIntensity": rainIntensity,
        "sleetAccumulation": sleetAccumulation,
        "sleetAccumulationLwe": sleetAccumulationLwe,
        "sleetIntensity": sleetIntensity,
        "snowAccumulation": snowAccumulation,
        "snowAccumulationLwe": snowAccumulationLwe,
        "snowIntensity": snowIntensity,
        "temperature": temperature,
        "temperatureApparent": temperatureApparent,
        "uvHealthConcern": uvHealthConcern,
        "uvIndex": uvIndex,
        "visibility": visibility,
        "weatherCode": weatherCode,
        "windDirection": windDirection,
        "windGust": windGust,
        "windSpeed": windSpeed,
      };
}
