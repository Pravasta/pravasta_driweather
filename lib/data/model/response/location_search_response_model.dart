import 'dart:convert';

class LocationSearchResponseModel {
  final List<Prediction>? predictions;
  final String? status;

  LocationSearchResponseModel({
    this.predictions,
    this.status,
  });

  LocationSearchResponseModel copyWith({
    List<Prediction>? predictions,
    String? status,
  }) =>
      LocationSearchResponseModel(
        predictions: predictions ?? this.predictions,
        status: status ?? this.status,
      );

  factory LocationSearchResponseModel.fromJson(String str) =>
      LocationSearchResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory LocationSearchResponseModel.fromMap(Map<String, dynamic> json) =>
      LocationSearchResponseModel(
        predictions: json["predictions"] == null
            ? []
            : List<Prediction>.from(
                json["predictions"]!.map((x) => Prediction.fromMap(x))),
        status: json["status"],
      );

  Map<String, dynamic> toMap() => {
        "predictions": predictions == null
            ? []
            : List<dynamic>.from(predictions!.map((x) => x.toMap())),
        "status": status,
      };
}

class Prediction {
  final String? description;
  final List<MatchedSubstring>? matchedSubstrings;
  final String? placeId;
  final String? reference;
  final StructuredFormatting? structuredFormatting;
  final List<Term>? terms;
  final List<String>? types;

  Prediction({
    this.description,
    this.matchedSubstrings,
    this.placeId,
    this.reference,
    this.structuredFormatting,
    this.terms,
    this.types,
  });

  Prediction copyWith({
    String? description,
    List<MatchedSubstring>? matchedSubstrings,
    String? placeId,
    String? reference,
    StructuredFormatting? structuredFormatting,
    List<Term>? terms,
    List<String>? types,
  }) =>
      Prediction(
        description: description ?? this.description,
        matchedSubstrings: matchedSubstrings ?? this.matchedSubstrings,
        placeId: placeId ?? this.placeId,
        reference: reference ?? this.reference,
        structuredFormatting: structuredFormatting ?? this.structuredFormatting,
        terms: terms ?? this.terms,
        types: types ?? this.types,
      );

  factory Prediction.fromJson(String str) =>
      Prediction.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Prediction.fromMap(Map<String, dynamic> json) => Prediction(
        description: json["description"],
        matchedSubstrings: json["matched_substrings"] == null
            ? []
            : List<MatchedSubstring>.from(json["matched_substrings"]!
                .map((x) => MatchedSubstring.fromMap(x))),
        placeId: json["place_id"],
        reference: json["reference"],
        structuredFormatting: json["structured_formatting"] == null
            ? null
            : StructuredFormatting.fromMap(json["structured_formatting"]),
        terms: json["terms"] == null
            ? []
            : List<Term>.from(json["terms"]!.map((x) => Term.fromMap(x))),
        types: json["types"] == null
            ? []
            : List<String>.from(json["types"]!.map((x) => x)),
      );

  Map<String, dynamic> toMap() => {
        "description": description,
        "matched_substrings": matchedSubstrings == null
            ? []
            : List<dynamic>.from(matchedSubstrings!.map((x) => x.toMap())),
        "place_id": placeId,
        "reference": reference,
        "structured_formatting": structuredFormatting?.toMap(),
        "terms": terms == null
            ? []
            : List<dynamic>.from(terms!.map((x) => x.toMap())),
        "types": types == null ? [] : List<dynamic>.from(types!.map((x) => x)),
      };
}

class MatchedSubstring {
  final int? length;
  final int? offset;

  MatchedSubstring({
    this.length,
    this.offset,
  });

  MatchedSubstring copyWith({
    int? length,
    int? offset,
  }) =>
      MatchedSubstring(
        length: length ?? this.length,
        offset: offset ?? this.offset,
      );

  factory MatchedSubstring.fromJson(String str) =>
      MatchedSubstring.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory MatchedSubstring.fromMap(Map<String, dynamic> json) =>
      MatchedSubstring(
        length: json["length"],
        offset: json["offset"],
      );

  Map<String, dynamic> toMap() => {
        "length": length,
        "offset": offset,
      };
}

class StructuredFormatting {
  final String? mainText;
  final List<MatchedSubstring>? mainTextMatchedSubstrings;
  final String? secondaryText;

  StructuredFormatting({
    this.mainText,
    this.mainTextMatchedSubstrings,
    this.secondaryText,
  });

  StructuredFormatting copyWith({
    String? mainText,
    List<MatchedSubstring>? mainTextMatchedSubstrings,
    String? secondaryText,
  }) =>
      StructuredFormatting(
        mainText: mainText ?? this.mainText,
        mainTextMatchedSubstrings:
            mainTextMatchedSubstrings ?? this.mainTextMatchedSubstrings,
        secondaryText: secondaryText ?? this.secondaryText,
      );

  factory StructuredFormatting.fromJson(String str) =>
      StructuredFormatting.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory StructuredFormatting.fromMap(Map<String, dynamic> json) =>
      StructuredFormatting(
        mainText: json["main_text"],
        mainTextMatchedSubstrings: json["main_text_matched_substrings"] == null
            ? []
            : List<MatchedSubstring>.from(json["main_text_matched_substrings"]!
                .map((x) => MatchedSubstring.fromMap(x))),
        secondaryText: json["secondary_text"],
      );

  Map<String, dynamic> toMap() => {
        "main_text": mainText,
        "main_text_matched_substrings": mainTextMatchedSubstrings == null
            ? []
            : List<dynamic>.from(
                mainTextMatchedSubstrings!.map((x) => x.toMap())),
        "secondary_text": secondaryText,
      };
}

class Term {
  final int? offset;
  final String? value;

  Term({
    this.offset,
    this.value,
  });

  Term copyWith({
    int? offset,
    String? value,
  }) =>
      Term(
        offset: offset ?? this.offset,
        value: value ?? this.value,
      );

  factory Term.fromJson(String str) => Term.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Term.fromMap(Map<String, dynamic> json) => Term(
        offset: json["offset"],
        value: json["value"],
      );

  Map<String, dynamic> toMap() => {
        "offset": offset,
        "value": value,
      };
}
