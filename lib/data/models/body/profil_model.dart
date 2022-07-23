// To parse this JSON data, do
//
//     final editProfilModel = editProfilModelFromJson(jsonString);

import 'dart:convert';

EditProfileModel editProfileModelFromJson(String str) => EditProfileModel.fromJson(json.decode(str));

String editProfileModelToJson(EditProfileModel data) => json.encode(data.toJson());

class EditProfileModel {
  EditProfileModel({
    this.name,
    this.firstName,
    this.email,
    this.phone,
    this.nationality,
    this.address,
  });

  String? name;
  String? firstName;
  String? email;
  String? phone;
  String? nationality;
  String? address;

  factory EditProfileModel.fromJson(Map<String, dynamic> json) => EditProfileModel(
    name: json["name"],
    firstName: json["first_name"],
    email: json["email"],
    phone: json["phone"],
    nationality: json["nationality"],
    address: json["address"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "first_name": firstName,
    "email": email,
    "phone": phone,
    "nationality": nationality,
    "address": address,
  };
}
