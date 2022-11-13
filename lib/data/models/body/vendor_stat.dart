import 'dart:convert';

VendorStat vendorStatFromJson(String str) => VendorStat.fromJson(json.decode(str));

class VendorStat {
  VendorStat({
     this.id,
     this.idBoutique,
     this.nombreVisites,
     this.nombreAbonnes,
     this.produitsTotal,
     this.produitsRestant,
    this.nbreBoostRestant
  });

  int ?id;
  int ?idBoutique;
  int ?nombreVisites;
  int ?nombreAbonnes;
  int ?produitsTotal;
  int ?produitsRestant;
  int ?nbreBoostRestant;

  factory VendorStat.fromJson(Map<String, dynamic> json) => VendorStat(
    id: json["id"],
    idBoutique: json["id_boutique"],
    nombreVisites: json["nombre_visites"],
    nombreAbonnes: json["nombre_abonnes"],
    produitsTotal: json["produits_total"],
    produitsRestant: json["produits_restant"],
    nbreBoostRestant: json["nbre_boost_restant"] ?? 0,
  );
}
