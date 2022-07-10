// To parse this JSON data, do
//
//     final userBaseInfo = userBaseInfoFromJson(jsonString);

import 'dart:convert';

import 'package:wantermarket/config/app_constantes.dart';

List<UserBaseInfo> userBaseInfoFromJson(String str) => List<UserBaseInfo>.from(json.decode(str).map((x) => UserBaseInfo.fromJson(x)));

String userBaseInfoToJson(List<UserBaseInfo> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UserBaseInfo {
  UserBaseInfo({
    required this.etat,
    required this.canAddProduct,
    required this.plan,
    required this.profilImage,
    required this.boutiqueName,
    required this.adresse,
  });

  final bool etat;
  final bool canAddProduct;
  final String plan;
  final String profilImage;
  final String boutiqueName;
  final String adresse;

  UserBaseInfo copyWith({
    required bool etat,
    required bool canAddProduct,
    required String plan,
    required String profilImage,
    required String boutiqueName,
    required String adresse,
  }) =>
      UserBaseInfo(
        etat: etat ,
        canAddProduct: canAddProduct ,
        plan: plan,
        profilImage: profilImage ,
        boutiqueName: boutiqueName ,
        adresse: adresse,
      );

  factory UserBaseInfo.fromJson(Map<String, dynamic> json) => UserBaseInfo(
    etat: json["etat"],
    canAddProduct: json["canAddProduct"],
    plan: json["plan"],
    profilImage: AppConstants.BASE_URL_IMAGE + json["profil_image"],
    boutiqueName: json["boutique_name"],
    adresse: json["adresse"],
  );

  Map<String, dynamic> toJson() => {
    "etat": etat,
    "can_add_product": canAddProduct,
    "plan": plan,
    "profil_image": profilImage,
    "boutique_name": boutiqueName,
    "adresse": adresse,
  };
}
