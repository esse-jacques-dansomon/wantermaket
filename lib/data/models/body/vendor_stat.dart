// To parse this JSON data, do
//
//     final vendorStat = vendorStatFromJson(jsonString);

import 'dart:convert';

VendorStat vendorStatFromJson(String str) => VendorStat.fromJson(json.decode(str));

String vendorStatToJson(VendorStat data) => json.encode(data.toJson());

class VendorStat {
  VendorStat({
    this.idBoutique,
    this.nombreVisites,
    this.nombreAbonnes,

  });

  int ?idBoutique;
  int ?nombreVisites;
  int ?nombreAbonnes;


  factory VendorStat.fromJson(Map<String, dynamic> json) => VendorStat(
    idBoutique: json["id_boutique"],
    nombreVisites: json["nombre_visites"],
    nombreAbonnes: json["nombre_abonnes"],

  );

  Map<String, dynamic> toJson() => {
    "id_boutique": idBoutique,
    "nombre_visites": nombreVisites,
    "nombre_abonnes": nombreAbonnes,

  };
}
