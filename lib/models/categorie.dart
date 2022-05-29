
import 'dart:convert';

Categorie categorieFromJson(String str) => Categorie.fromJson(json.decode(str));

String categorieToJson(Categorie data) => json.encode(data.toJson());

class Categorie {
  Categorie({
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

  Categorie copyWith({
    required int id,
    required String name,
    required String description,
    required String icon,
    required String imagePath,
  }) =>
      Categorie(
        id: id ?? this.id,
        name: name ?? this.name,
        description: description ?? this.description,
        icon: icon ?? this.icon,
        imagePath: imagePath ?? this.imagePath,
      );

  factory Categorie.fromJson(Map<String, dynamic> json) => Categorie(
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
