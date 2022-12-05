import 'dart:convert';

SignalerModel signalerModelFromJson(String str) => SignalerModel.fromJson(json.decode(str));

String signalerModelToJson(SignalerModel data) => json.encode(data.toJson());

class SignalerModel {
  SignalerModel({
    required this.texte,
    required this.id,
  });

  final String texte;
  final int id;

  factory SignalerModel.fromJson(Map<String, dynamic> json) => SignalerModel(
    texte: json["texte"],
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "texte": texte,
    "id": id,
  };
}
