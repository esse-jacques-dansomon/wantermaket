import 'dart:convert';

BoutiqueUpdateModel boutiqueUpdateModelFromJson(String str) => BoutiqueUpdateModel.fromJson(json.decode(str));

String boutiqueUpdateModelToJson(BoutiqueUpdateModel data) => json.encode(data.toJson());

class BoutiqueUpdateModel {
  BoutiqueUpdateModel({
    required this.name,
    required this.latitude,
    required this.longitude,
    required this.bio,
    required this.secteursId,
    //Social medias
     this.facebook,
     this.instagram,
     this.linkedin,
      this.website,
  });

  String name;
  String latitude;
  String longitude;
  String bio;
  List<int> secteursId;
  //Social medias
   String? facebook;
   String? instagram;
   String? linkedin;
   String? website;

  factory BoutiqueUpdateModel.fromJson(Map<String, dynamic> json) => BoutiqueUpdateModel(
    name: json["name"],
    latitude: json["latitude"],
    longitude: json["longitude"],
    bio: json["bio"],
    secteursId: List<int>.from(json["secteurs_id"].map((x) => x)),
    facebook: json["facebook"],
    instagram: json["instagram"],
    linkedin: json["linkedin"],
    website: json["website"],

  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "latitude": latitude,
    "longitude": longitude,
    "bio": bio,
    "secteurs_id": List<dynamic>.from(secteursId.map((x) => x)),
    "facebook": facebook,
    "instagram": instagram,
    "linkedin": linkedin,
    "website": website,
  };
}
