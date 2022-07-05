import 'package:wantermarket/data/models/body/vendor.dart';

import '../../../config/app_constantes.dart';

class Boutique {
  int? id;
  String? name;
  String? bio;
  String? latitude;
  String? longitude;
  String? profilImage;
  String? coverImage;
  int? idVendor;
  Vendor? vendor;


  Boutique(
      {this.id,
      this.name,
      this.bio,
      this.latitude,
      this.longitude,
      this.profilImage,
      this.coverImage,
        this.vendor,
        this.idVendor});

  Boutique.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name']??'null';
    bio = json['bio']??'null';
    latitude = json['latitude']??'null';
    longitude = json['longitude']??'null';
    profilImage = AppConstants.BASE_URL_IMAGE + (json['profil_image']?? '');
    coverImage = AppConstants.BASE_URL_IMAGE + (json['cover_image']?? '');
    idVendor = json['id_vendor'];
    vendor = json['vendeur'] != null ? Vendor.fromJson(json['vendeur']) : null;



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
    data['vendeur'] = vendor?.toJson();

    return data;
  }
}