
import 'dart:convert';

import '../../../config/app_constantes.dart';

SliderItem sliderFromJson(String str) => SliderItem.fromJson(json.decode(str));

String sliderToJson(SliderItem data) => json.encode(data.toJson());

class SliderItem {
  SliderItem({
    required this.id,
    required this.backgroudPath,
    // required this.title,
    // required this.subtile,
    // required this.status,
  });

  int id;
  String backgroudPath;
  // String title;
  // String subtile;
  // bool status;

  factory SliderItem.fromJson(Map<String, dynamic> json) => SliderItem(
    id: json["id"],
    backgroudPath: AppConstants.BASE_URL_IMAGE + json["background_path"],
    // title: json["title"],
    // subtile: json["subtile"],
    // status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "background_path": backgroudPath,
    // "title": title,
    // "subtile": subtile,
    // "status": status,
  };
}
