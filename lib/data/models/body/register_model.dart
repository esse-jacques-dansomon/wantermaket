// To parse this JSON data, do
//
//     final registerModel = registerModelFromJson(jsonString);

import 'dart:convert';

RegisterModel registerModelFromJson(String str) => RegisterModel.fromJson(json.decode(str));

String registerModelToJson(RegisterModel data) => json.encode(data.toJson());

class RegisterModel {
  RegisterModel({
    this.name,
    this.firstName,
    this.email,
    this.phone,
    this.address,
    this.boutiqueName,
    this.password,
  });

  String? name;
  String? firstName;
  String? email;
  String? phone;
  String? address;
  String? boutiqueName;
  String? password;

  factory RegisterModel.fromJson(Map<String, dynamic> json) => RegisterModel(
    name: json["name"],
    firstName: json["first_name"],
    email: json["email"],
    phone: json["phone"],
    address: json["address"],
    boutiqueName: json["boutique_name"],
    password: json["password"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "first_name": firstName,
    "email": email,
    "phone": phone,
    "address": address,
    "boutique_name": boutiqueName,
    "password": password,
  };
}
