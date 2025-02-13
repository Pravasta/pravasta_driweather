import 'dart:convert';

class WeatherRealtimeResponseModel {
  final Data? data;
  final Location? location;

  WeatherRealtimeResponseModel({
    this.data,
    this.location,
  });

  factory WeatherRealtimeResponseModel.fromJson(String str) =>
      WeatherRealtimeResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory WeatherRealtimeResponseModel.fromMap(Map<String, dynamic> json) =>
      WeatherRealtimeResponseModel(
        data: json["data"] == null ? null : Data.fromMap(json["data"]),
        location: json["location"] == null
            ? null
            : Location.fromMap(json["location"]),
      );

  Map<String, dynamic> toMap() => {
        "data": data?.toMap(),
        "location": location?.toMap(),
      };
}

class Data {
  final DateTime? time;
  final Values? values;

  Data({
    this.time,
    this.values,
  });

  factory Data.fromJson(String str) => Data.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Data.fromMap(Map<String, dynamic> json) => Data(
        time: json["time"] == null ? null : DateTime.parse(json["time"]),
        values: json["values"] == null ? null : Values.fromMap(json["values"]),
      );

  Map<String, dynamic> toMap() => {
        "time": time?.toIso8601String(),
        "values": values?.toMap(),
      };
}

class Values {
  final double? cloudBase;
  final double? cloudCeiling;
  final double? cloudCover;
  final double? dewPoint;
  final double? freezingRainIntensity;
  final double? hailProbability;
  final double? hailSize;
  final double? humidity;
  final double? precipitationProbability;
  final double? pressureSeaLevel;
  final double? pressureSurfaceLevel;
  final double? rainIntensity;
  final double? sleetIntensity;
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

  Values({
    this.cloudBase,
    this.cloudCeiling,
    this.cloudCover,
    this.dewPoint,
    this.freezingRainIntensity,
    this.hailProbability,
    this.hailSize,
    this.humidity,
    this.precipitationProbability,
    this.pressureSeaLevel,
    this.pressureSurfaceLevel,
    this.rainIntensity,
    this.sleetIntensity,
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

  factory Values.fromJson(String str) => Values.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Values.fromMap(Map<String, dynamic> json) => Values(
        cloudBase: json["cloudBase"]?.toDouble(),
        cloudCeiling: json["cloudCeiling"]?.toDouble(),
        cloudCover: json["cloudCover"]?.toDouble(),
        dewPoint: json["dewPoint"]?.toDouble(),
        freezingRainIntensity: json["freezingRainIntensity"]?.toDouble(),
        hailProbability: json["hailProbability"]?.toDouble(),
        hailSize: json["hailSize"]?.toDouble(),
        humidity: json["humidity"]?.toDouble(),
        precipitationProbability: json["precipitationProbability"]?.toDouble(),
        pressureSeaLevel: json["pressureSeaLevel"]?.toDouble(),
        pressureSurfaceLevel: json["pressureSurfaceLevel"]?.toDouble(),
        rainIntensity: json["rainIntensity"]?.toDouble(),
        sleetIntensity: json["sleetIntensity"]?.toDouble(),
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
        "freezingRainIntensity": freezingRainIntensity,
        "hailProbability": hailProbability,
        "hailSize": hailSize,
        "humidity": humidity,
        "precipitationProbability": precipitationProbability,
        "pressureSeaLevel": pressureSeaLevel,
        "pressureSurfaceLevel": pressureSurfaceLevel,
        "rainIntensity": rainIntensity,
        "sleetIntensity": sleetIntensity,
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

class Location {
  final double? lat;
  final double? lon;
  final String? name;
  final String? type;

  Location({
    this.lat,
    this.lon,
    this.name,
    this.type,
  });

  factory Location.fromJson(String str) => Location.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Location.fromMap(Map<String, dynamic> json) => Location(
        lat: json["lat"]?.toDouble(),
        lon: json["lon"]?.toDouble(),
        name: json["name"],
        type: json["type"],
      );

  Map<String, dynamic> toMap() => {
        "lat": lat,
        "lon": lon,
        "name": name,
        "type": type,
      };
}
