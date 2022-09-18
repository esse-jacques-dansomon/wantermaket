// To parse this JSON data, do
//
//     final vendorStat = vendorStatFromJson(jsonString);

// ignore_for_file: unused_import

import 'package:meta/meta.dart';
import 'dart:convert';

VendorStat vendorStatFromJson(String str) => VendorStat.fromJson(json.decode(str));

String vendorStatToJson(VendorStat data) => json.encode(data.toJson());

class VendorStat {
  VendorStat({
     this.id,
     this.idBoutique,
     this.nombreVisites,
     this.nombreAbonnes,
     this.produitsTotal,
     this.produitsRestant,
  });

  int ?id;
  int ?idBoutique;
  int ?nombreVisites;
  int ?nombreAbonnes;
  int ?produitsTotal;
  int ?produitsRestant;

  factory VendorStat.fromJson(Map<String, dynamic> json) => VendorStat(
    id: json["id"],
    idBoutique: json["id_boutique"],
    nombreVisites: json["nombre_visites"],
    nombreAbonnes: json["nombre_abonnes"],
    produitsTotal: json["produits_total"],
    produitsRestant: json["produits_restant"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "id_boutique": idBoutique,
    "nombre_visites": nombreVisites,
    "nombre_abonnes": nombreAbonnes,
    "produits_total": produitsTotal,
    "produits_restant": produitsRestant,
  };
}
