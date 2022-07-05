/*
import 'dart:convert';

Category CategoryFromJson(String str) => Category.fromJson(json.decode(str));

String CategoryToJson(Category data) => json.encode(data.toJson());

class Category {
  Category({
    required this.id,
    required this.name,
    required this.description,
    required this.icon,
    required this.imagePath,
  });

  int id;
  String name;
  String description;
  String icon;
  String imagePath;

  Category copyWith({
    required int id,
    required String name,
    required String description,
    required String icon,
    required String imagePath,
  }) =>
      Category(
        id: id ?? id,
        name: name ?? name,
        description: description ?? description,
        icon: icon ?? icon,
        imagePath: imagePath ?? imagePath,
      );

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    id: json["id"],
    name: json["name"],
    description: json["description"],
    icon: json["icon"],
    imagePath: json["image_path"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "description": description,
    "icon": icon,
    "image_path": imagePath,
  };
}
*/

import 'package:wantermarket/config/app_constantes.dart';

class Category {
  int? id;
  String? name;
  String? imagePath;

  Category({this.id, this.name, this.imagePath});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    imagePath = AppConstants.BASE_URL_IMAGE + json['image_path'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['image_path'] = imagePath;
    return data;
  }
}