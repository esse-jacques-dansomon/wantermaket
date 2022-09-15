// To parse this JSON data, do
//
//     final country = countryFromJson(jsonString);

import 'dart:convert';

AppCountry countryFromJson(String str) => AppCountry.fromJson(json.decode(str));

String countryToJson(AppCountry data) => json.encode(data.toJson());

class AppCountry {
  AppCountry({
    required this.id,
    required this.nom,
    required this.code,
    required this.drapeau,
    required this.indicatif,
    required this.latitude,
    required this.longitude,

  });

  int id;
  String nom;
  String code;
  String drapeau;
  String indicatif;
  String latitude;
  String longitude;


  factory AppCountry.fromJson(Map<String, dynamic> json) => AppCountry(
    id: json["id"],
    nom: json["nom"],
    code: json["code"],
    drapeau: json["drapeau"],
    indicatif: json["indicatif"],
    latitude: json["latitude"],
    longitude: json["longitude"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "nom": nom,
    "code": code,
    "drapeau": drapeau,
    "indicatif": indicatif,
    "latitude": latitude,
    "longitude": longitude,
  };
}
