// To parse this JSON data, do
//
//     final image = imageFromJson(jsonString);

import 'dart:convert';

import 'package:wantermarket/config/app_constantes.dart';

Image imageFromJson(String str) => Image.fromJson(json.decode(str));

String imageToJson(Image data) => json.encode(data.toJson());

class Image {
  Image({
    required this.path,
  });

  String path;

  Image copyWith({
    required String path,
  }) =>
      Image(
        path: path ,
      );

  factory Image.fromJson(Map<String, dynamic> json) => Image(
    path: AppConstants.BASE_URL_IMAGE + json["path"],
  );

  Map<String, dynamic> toJson() => {
    "path": path,
  };
}
