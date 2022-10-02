// To parse this JSON data, do
//
//     final filterModel = filterModelFromMap(jsonString);

import 'dart:convert';
//
// FilterModel filterModelFromMap(String str) => FilterModel.fromJson(json.decode(str));
//
// String filterModelToMap(FilterModel data) => json.encode(data.toJson());

FilterModel filterModelFromMap(String str) => FilterModel.fromMap(json.decode(str));

String filterModelToMap(FilterModel data) => json.encode(data.toMap());
class FilterModel {
  FilterModel({
    this.keyWorld,
    this.min,
    this.max,
    this.secteurs ,
    this.priceFilter ,
    this.isNew,
    this.isPopular,
    this.isPromo,
  });

  String? keyWorld;
  int? min;
  int? max;
  List<dynamic>? secteurs;
  int? priceFilter;
  int? isNew;
  int? isPopular;
  int? isPromo;

  factory FilterModel.fromJson(Map<String, dynamic> json) => FilterModel(
    keyWorld: json["keyWorld"],
    min: json["min"],
    max: json["max"],
    secteurs: json["secteurs"] == null ? null : List<int>.from(json["secteurs"].map((x) => x)),
    priceFilter: json["priceFilter"],
    isNew: json["isNew"],
    isPopular: json["isPopular"],
    isPromo: json["isPromo"],
  );

  Map<String, dynamic> toJson() => {
    "keyWorld": keyWorld,
    "min": min,
    "max": max,
    "secteurs": secteurs == null ? null : List<dynamic>.from(secteurs!.map((x) => x)),
    "priceFilter": priceFilter,
    "isNew": isNew,
    "isPopular": isPopular,
    "isPromo": isPromo,
  };

  factory FilterModel.fromMap(Map<String, dynamic> json) => FilterModel(
    keyWorld: json["keyWorld"] ,
    min: json["min"],
    max: json["max"],
    secteurs: json["secteurs"] == null ? null : List<int>.from(json["secteurs"].map((x) => x)),
    priceFilter: json["priceFilter"],
    isNew: json["isNew"],
    isPopular: json["isPopular"],
    isPromo: json["isPromo"],
  );

  Map<String, dynamic> toMap() => {
    "keyWorld": keyWorld,
    "min": min,
    "max": max,
    "secteurs": secteurs == null ? null : List<dynamic>.from(secteurs!.map((x) => x)),
    "priceFilter": priceFilter,
    "isNew": isNew,
    "isPopular": isPopular,
    "isPromo": isPromo,
  };
}


