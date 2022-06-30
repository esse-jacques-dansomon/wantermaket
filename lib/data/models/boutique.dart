class Boutique {
  int? id;
  String? name;
  String? bio;
  String? latitude;
  String? longitude;
  String? profilImage;
  String? coverImage;
  int? idVendor;

  Boutique(
      {this.id,
      this.name,
      this.bio,
      this.latitude,
      this.longitude,
      this.profilImage,
      this.coverImage,
      this.idVendor});

  Boutique.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    bio = json['bio'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    profilImage = json['profil_image'];
    coverImage = json['cover_image'];
    idVendor = json['id_vendor'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['bio'] = bio;
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    data['profil_image'] = profilImage;
    data['cover_image'] = coverImage;
    data['id_vendor'] = idVendor;
    return data;
  }
}