
import 'dart:convert';

Plan planFromJson(String str) => Plan.fromJson(json.decode(str));

class Plan {
  Plan({
    this.id,
    this.name,
    this.validite,
    this.sidebar,
    this.banner,
    this.nbrDeal,
    this.nbrProduit,
    this.price,
    this.description,
    this.isFree,
  });

  int? id;
  String? name;
  int? validite;
  int? sidebar;
  int? banner;
  int? nbrDeal;
  int? nbrProduit;
  int? price;
  String ? description;
  bool ? isFree;

  factory Plan.fromJson(Map<String, dynamic> json) => Plan(
    id: json["id"],
    name: json["name"],
    validite: json["validite"],
    sidebar: json["sidebar"],
    banner: json["banner"],
    nbrDeal: json["nbr_deal"],
    nbrProduit: json["nbr_produit"],
    price: json["prix"],
    description: json["description"],
    isFree: json["is_free"],
  );

}
