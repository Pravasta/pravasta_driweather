import 'dart:convert';

class LocationSearchResponseModel {
  final List<Feature>? features;
  final String? type;

  LocationSearchResponseModel({
    this.features,
    this.type,
  });

  LocationSearchResponseModel copyWith({
    List<Feature>? features,
    String? type,
  }) =>
      LocationSearchResponseModel(
        features: features ?? this.features,
        type: type ?? this.type,
      );

  factory LocationSearchResponseModel.fromJson(String str) =>
      LocationSearchResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory LocationSearchResponseModel.fromMap(Map<String, dynamic> json) =>
      LocationSearchResponseModel(
        features: json["features"] == null
            ? []
            : List<Feature>.from(
                json["features"]!.map((x) => Feature.fromMap(x))),
        type: json["type"],
      );

  Map<String, dynamic> toMap() => {
        "features": features == null
            ? []
            : List<dynamic>.from(features!.map((x) => x.toMap())),
        "type": type,
      };
}

class Feature {
  final Geometry? geometry;
  final String? type;
  final Properties? properties;

  Feature({
    this.geometry,
    this.type,
    this.properties,
  });

  Feature copyWith({
    Geometry? geometry,
    String? type,
    Properties? properties,
  }) =>
      Feature(
        geometry: geometry ?? this.geometry,
        type: type ?? this.type,
        properties: properties ?? this.properties,
      );

  factory Feature.fromJson(String str) => Feature.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Feature.fromMap(Map<String, dynamic> json) => Feature(
        geometry: json["geometry"] == null
            ? null
            : Geometry.fromMap(json["geometry"]),
        type: json["type"],
        properties: json["properties"] == null
            ? null
            : Properties.fromMap(json["properties"]),
      );

  Map<String, dynamic> toMap() => {
        "geometry": geometry?.toMap(),
        "type": type,
        "properties": properties?.toMap(),
      };
}

class Geometry {
  final List<double>? coordinates;
  final String? type;

  Geometry({
    this.coordinates,
    this.type,
  });

  Geometry copyWith({
    List<double>? coordinates,
    String? type,
  }) =>
      Geometry(
        coordinates: coordinates ?? this.coordinates,
        type: type ?? this.type,
      );

  factory Geometry.fromJson(String str) => Geometry.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Geometry.fromMap(Map<String, dynamic> json) => Geometry(
        coordinates: json["coordinates"] == null
            ? []
            : List<double>.from(json["coordinates"]!.map((x) => x?.toDouble())),
        type: json["type"],
      );

  Map<String, dynamic> toMap() => {
        "coordinates": coordinates == null
            ? []
            : List<dynamic>.from(coordinates!.map((x) => x)),
        "type": type,
      };
}

class Properties {
  final String? osmType;
  final int? osmId;
  final List<double>? extent;
  final String? country;
  final String? osmKey;
  final String? countrycode;
  final String? osmValue;
  final String? name;
  final String? state;
  final String? type;
  final String? city;
  final String? postcode;
  final String? locality;
  final String? street;
  final String? district;
  final String? housenumber;

  Properties({
    this.osmType,
    this.osmId,
    this.extent,
    this.country,
    this.osmKey,
    this.countrycode,
    this.osmValue,
    this.name,
    this.state,
    this.type,
    this.city,
    this.postcode,
    this.locality,
    this.street,
    this.district,
    this.housenumber,
  });

  Properties copyWith({
    String? osmType,
    int? osmId,
    List<double>? extent,
    String? country,
    String? osmKey,
    String? countrycode,
    String? osmValue,
    String? name,
    String? state,
    String? type,
    String? city,
    String? postcode,
    String? locality,
    String? street,
    String? district,
    String? housenumber,
  }) =>
      Properties(
        osmType: osmType ?? this.osmType,
        osmId: osmId ?? this.osmId,
        extent: extent ?? this.extent,
        country: country ?? this.country,
        osmKey: osmKey ?? this.osmKey,
        countrycode: countrycode ?? this.countrycode,
        osmValue: osmValue ?? this.osmValue,
        name: name ?? this.name,
        state: state ?? this.state,
        type: type ?? this.type,
        city: city ?? this.city,
        postcode: postcode ?? this.postcode,
        locality: locality ?? this.locality,
        street: street ?? this.street,
        district: district ?? this.district,
        housenumber: housenumber ?? this.housenumber,
      );

  factory Properties.fromJson(String str) =>
      Properties.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Properties.fromMap(Map<String, dynamic> json) => Properties(
        osmType: json["osm_type"],
        osmId: json["osm_id"],
        extent: json["extent"] == null
            ? []
            : List<double>.from(json["extent"]!.map((x) => x?.toDouble())),
        country: json["country"],
        osmKey: json["osm_key"],
        countrycode: json["countrycode"],
        osmValue: json["osm_value"],
        name: json["name"],
        state: json["state"],
        type: json["type"],
        city: json["city"],
        postcode: json["postcode"],
        locality: json["locality"],
        street: json["street"],
        district: json["district"],
        housenumber: json["housenumber"],
      );

  Map<String, dynamic> toMap() => {
        "osm_type": osmType,
        "osm_id": osmId,
        "extent":
            extent == null ? [] : List<dynamic>.from(extent!.map((x) => x)),
        "country": country,
        "osm_key": osmKey,
        "countrycode": countrycode,
        "osm_value": osmValue,
        "name": name,
        "state": state,
        "type": type,
        "city": city,
        "postcode": postcode,
        "locality": locality,
        "street": street,
        "district": district,
        "housenumber": housenumber,
      };
}
