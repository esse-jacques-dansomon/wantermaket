// /// errors : [{"code":"l_name","message":"The last name field is required."},{"code":"password","message":"The password field is required."}]
//
// class ErrorResponse {
//   List<Errors> _errors = [];
//
//   List<Errors> get errors => _errors;
//
//   ErrorResponse({
//     required List<Errors> errors}){
//     _errors = errors;
//   }
//
//   ErrorResponse.fromJson(dynamic json) {
//     print("errors jsocn $json");
//     if (json != null &&  json["errors"] ) {
//       _errors = [];
//       json["errors"].forEach((v) {
//         _errors.add(Errors.fromJson(v));
//       });
//     }else if (json["message"]){
//       _errors.add(Errors.fromJson(json));
//     }
//   }
//
//   Map<String, dynamic> toJson() {
//     var map = <String, dynamic>{};
//     if (_errors != null) {
//       map["errors"] = _errors.map((v) => v.toJson()).toList();
//     }
//     return map;
//   }
//
// }
//
// /// code : "l_name"
// /// message : "The last name field is required."
//
// class Errors {
//   String _code = "";
//   String _message = '';
//
//   String get code => _code;
//   String get message => _message;
//
//   Errors({
//     required String code,
//     required String message}){
//     _code = code;
//     _message = message;
//   }
//
//   Errors.fromJson(dynamic json) {
//     _code = json["code"];
//     _message = json["message"];
//   }
//
//   Map<String, dynamic> toJson() {
//     var map = <String, dynamic>{};
//     map["code"] = _code;
//     map["message"] = _message;
//     return map;
//   }
//
// }

// To parse this JSON data, do
//
//     final errorResponse = errorResponseFromJson(jsonString);

// ignore_for_file: unnecessary_null_comparison

import 'dart:convert';

ErrorResponse errorResponseFromJson(String str) => ErrorResponse.fromJson(json.decode(str));

String errorResponseToJson(ErrorResponse data) => json.encode(data.toJson());

class ErrorResponse {
  ErrorResponse({
    required this.success,
    required this.message,
    required this.code,
    this.data,
  });

  bool success;
  String message;
  int code;
  List<dynamic>? data;

  factory ErrorResponse.fromJson(Map<String, dynamic> json) => ErrorResponse(
    success: json["success"] == null ? null : json["success"],
    message: json["message"] == null ? null : json["message"],
    code: json["code"] == null ? null : json["code"],
    data: json["data"] == null ? null : List<dynamic>.from(json["data"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "success": success == null ? null : success,
    "message": message == null ? null : message,
    "code": code == null ? null : code,
    "data": (data == null || data == [] ) ? null : List<dynamic>.from(data!.map((x) => x)),
  };
}
