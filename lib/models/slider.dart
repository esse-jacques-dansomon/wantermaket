
import 'dart:convert';

Slider sliderFromJson(String str) => Slider.fromJson(json.decode(str));

String sliderToJson(Slider data) => json.encode(data.toJson());

class Slider {
  Slider({
    required this.id,
    required this.backgroudPath,
    required this.title,
    required this.subtile,
    required this.status,
  });

  int id;
  String backgroudPath;
  String title;
  String subtile;
  bool status;

  factory Slider.fromJson(Map<String, dynamic> json) => Slider(
    id: json["id"],
    backgroudPath: json["backgroud_path"],
    title: json["title"],
    subtile: json["subtile"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "backgroud_path": backgroudPath,
    "title": title,
    "subtile": subtile,
    "status": status,
  };
}
