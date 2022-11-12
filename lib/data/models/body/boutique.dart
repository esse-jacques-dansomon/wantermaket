import 'package:wantermarket/config/app_images.dart';
import 'package:wantermarket/data/models/body/vendor.dart';

import 'category.dart';

class Boutique {
  int? id;
  String? name;
  String? slug;
  String? bio;
  String? latitude;
  String? longitude;
  String? profilImage;
  String? coverImage;
  int? idVendor;
  Vendor? vendor;
  List<Category>? secteurs = [];
  String? website;
  String? facebook;
  String? instagram;
  String? linkedin;


  Boutique(
      {this.id,
        this.name,
        this.slug,
        this.bio,
        this.latitude,
        this.longitude,
        this.profilImage,
        this.coverImage,
        this.vendor,
        this.secteurs,
        this.idVendor,
        this.website,
        this.facebook,
        this.instagram,
        this.linkedin
      });

  Boutique.fromJson(Map<String, dynamic> json) {
    id = json['id'] != null ? json['id'] : 0;
    name = json['name'] != null ? json['name']  : '';
    slug = json['slug'] != null ? json['slug']  : '';
    bio = json['bio']!= null ? json['bio'] : '';
    latitude = json['latitude'] != null ? json['latitude']  :  '';
    longitude = json['longitude'] != null ? json['longitude']  :  '';
    profilImage =  (json['profil_image'] != null ? json['profil_image']: AppImage.logo );
    coverImage = (json['cover_image'] != null ?   json['cover_image']: AppImage.logo);
    idVendor = json['id_vendor'];
    vendor = json['vendeur'] != null ? Vendor.fromJson(json['vendeur']) : null;
    if (json['secteurs'] != null) {
      secteurs = List<Category>.from(json['secteurs'].map((x) => Category.fromJson(x)));
    }
    website = json['website'] != null ? json['website']  :  '';
    facebook = json['facebook'] != null ? json['facebook']  :  '';
    instagram = json['instagram'] != null ? json['instagram']  :  '';
    linkedin = json['linkedin'] != null ? json['linkedin']  :  '';
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