// To parse this JSON data, do
//
//     final registerModel = registerModelFromJson(jsonString);

import 'dart:convert';

RegisterModel registerModelFromJson(String str) => RegisterModel.fromJson(json.decode(str));

String registerModelToJson(RegisterModel data) => json.encode(data.toJson());

class RegisterModel {
  RegisterModel({
    required this.name,
    required this.firstName,
    required this.email,
    required this.phone,
    required this.address,
    required this.boutiqueName,
    required this.password,
    required this.country,
  });

  String name;
  String firstName;
  String email;
  String phone;
  String address;
  String boutiqueName;
  String password;
  String country;

  factory RegisterModel.fromJson(Map<String, dynamic> json) => RegisterModel(
    name: json["name"],
    firstName: json["first_name"],
    email: json["email"],
    phone: json["phone"],
    address: json["address"],
    country: json["country"],
    boutiqueName: json["boutique_name"],
    password: json["password"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "first_name": firstName,
    "email": email,
    "phone": phone,
    "address": address,
    "country": country,
    "boutique_name": boutiqueName,
    "password": password,
  };
}
