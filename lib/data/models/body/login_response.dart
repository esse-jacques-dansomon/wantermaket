// To parse this JSON data, do
//
//     final loginReponse = loginReponseFromJson(jsonString);

import 'dart:convert';

LoginReponse loginReponseFromJson(String str) => LoginReponse.fromJson(json.decode(str));

String loginReponseToJson(LoginReponse data) => json.encode(data.toJson());

class LoginReponse {
  LoginReponse({
    this.etat, // null, true, false
    this.canAddProduct, //true,
    this.plan,
    this.profilImage,
    this.boutiqueName,
    this.vendeurId,
    this.boutiqueId,
    this.adresse,
    this.accessToken,
    this.tokenType,
    this.isExclusive,
  });

  final bool? etat;
  final bool? canAddProduct;
  final bool? isExclusive;
  final String? plan;
  final String? profilImage;
  final String? boutiqueName;
  final int ?vendeurId;
  final int ?boutiqueId;
  final String? adresse;
  final String? accessToken;
  final String? tokenType;

  // LoginReponse copyWith({
  //   bool etat,
  //   bool canAddProduct,
  //   String plan,
  //   String profilImage,
  //   String boutiqueName,
  //   int vendeurId,
  //   int boutiqueId,
  //   String adresse,
  //   String accessToken,
  //   String tokenType,
  // }) =>
  //     LoginReponse(
  //       etat: etat ?? this.etat,
  //       canAddProduct: canAddProduct ?? this.canAddProduct,
  //       plan: plan ?? this.plan,
  //       profilImage: profilImage ?? this.profilImage,
  //       boutiqueName: boutiqueName ?? this.boutiqueName,
  //       vendeurId: vendeurId ?? this.vendeurId,
  //       boutiqueId: boutiqueId ?? this.boutiqueId,
  //       adresse: adresse ?? this.adresse,
  //       accessToken: accessToken ?? this.accessToken,
  //       tokenType: tokenType ?? this.tokenType,
  //     );

  factory LoginReponse.fromJson(Map<String, dynamic> json) => LoginReponse(
    etat: json["etat"],
    canAddProduct: json["canAddProduct"],
    isExclusive: json["isExclusive"],
    plan: json["plan"],
    profilImage: json["profil_image"],
    boutiqueName: json["boutique_name"],
    vendeurId: json["vendeur_id"],
    boutiqueId: json["boutique_id"],
    adresse: json["adresse"],
    accessToken: json["access_token"],
    tokenType: json["token_type"],
  );

  Map<String, dynamic> toJson() => {
    "etat": etat,
    "canAddProduct": canAddProduct,
    "isExclusive": isExclusive,
    "plan": plan,
    "profil_image": profilImage,
    "boutique_name": boutiqueName,
    "vendeur_id": vendeurId,
    "boutique_id": boutiqueId,
    "adresse": adresse,
    "access_token": accessToken,
    "token_type": tokenType,
  };
}
