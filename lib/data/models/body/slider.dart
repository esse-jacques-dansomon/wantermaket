import 'dart:convert';

SliderItem sliderItemFromJson(String str) => SliderItem.fromJson(json.decode(str));

String sliderItemToJson(SliderItem data) => json.encode(data.toJson());

class SliderItem {
  SliderItem({
    this.id,
    this.backgroundPath,
    this.backgroundPathMobile,
    this.title,
    this.subTitle,
    this.buttonTxt,
    this.buttonLink,
    this.buttonCapTxt,
    this.buttonCapLink,
    this.status,
    this.country,
  });

  final int? id;
  final String? backgroundPath;
  final String? backgroundPathMobile;
  final String? title;
  final String? subTitle;
  final String? buttonTxt;
  final String? buttonLink;
  final String? buttonCapTxt;
  final String? buttonCapLink;
  final String? status;
  final String? country;

  factory SliderItem.fromJson(Map<String, dynamic> json) => SliderItem(
    id: json["id"],
    backgroundPath: json["background_path"],
    backgroundPathMobile: json["background_path_mobile"],
    title: json["title"],
    subTitle: json["sub_title"],
    buttonTxt: json["button_txt"],
    buttonLink: json["button_link"],
    buttonCapTxt: json["button_cap_txt"],
    buttonCapLink: json["button_cap_link"],
    status: json["status"],
    country: json["country"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "background_path": backgroundPath,
    "background_path_mobile": backgroundPathMobile,
    "title": title,
    "sub_title": subTitle,
    "button_txt": buttonTxt,
    "button_link": buttonLink,
    "button_cap_txt": buttonCapTxt,
    "button_cap_link": buttonCapLink,
    "status": status,
    "country": country,
  };
}
