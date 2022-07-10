// To parse this JSON data, do
//
//     final plan = planFromJson(jsonString);

import 'dart:convert';

Plan planFromJson(String str) => Plan.fromJson(json.decode(str));

String planToJson(Plan data) => json.encode(data.toJson());

class Plan {
  Plan({
    this.id,
    this.name,
    this.validite,
    this.sidebar,
    this.banner,
    this.nbrDeal,
    this.nbrProduit,
  });

  int? id;
  String? name;
  int? validite;
  int? sidebar;
  int? banner;
  int? nbrDeal;
  int? nbrProduit;

  factory Plan.fromJson(Map<String, dynamic> json) => Plan(
    id: json["id"],
    name: json["name"],
    validite: json["validite"],
    sidebar: json["sidebar"],
    banner: json["banner"],
    nbrDeal: json["nbr_deal"],
    nbrProduit: json["nbr_produit"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "validite": validite,
    "sidebar": sidebar,
    "banner": banner,
    "nbr_deal": nbrDeal,
    "nbr_produit": nbrProduit,
  };
}
