// To parse this JSON data, do
//
//     final resetPasswordModel = resetPasswordModelFromJson(jsonString);

import 'dart:convert';

ResetPasswordModel resetPasswordModelFromJson(String str) => ResetPasswordModel.fromJson(json.decode(str));

String resetPasswordModelToJson(ResetPasswordModel data) => json.encode(data.toJson());

class ResetPasswordModel {
  ResetPasswordModel({
    required this.oldPassword,
    required this.password,
  });

  String oldPassword;
  String password;

  factory ResetPasswordModel.fromJson(Map<String, dynamic> json) => ResetPasswordModel(
    oldPassword: json["old_password"],
    password: json["password"],
  );

  Map<String, dynamic> toJson() => {
    "old_password": oldPassword,
    "password": password,
  };
}
