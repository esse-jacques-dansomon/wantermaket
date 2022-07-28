import 'dart:convert';

import 'package:wantermarket/data/models/body/vendor.dart';

import 'boutique.dart';
import 'image.dart';


List<Product> productFromMap(String str) => List<Product>.from(json.decode(str).map((x) => Product.fromJson(x)));

String productToMap(List<Product> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Product {
  int? id;
  String? code;
  int? idBoutique;
  int? idCategorie;
  String? name;
  String? descriptionBrief;
  int? price;
  int? priceBefore;
  String? disponibility;
  int? nombre_vues;
  List<Image>? images;
  Vendor? vendor;
  Boutique? boutique;


  Product(
      {this.id,
      this.code,
      this.idBoutique,
      this.idCategorie,
      this.name,
      this.descriptionBrief,
      this.price,
      this.priceBefore,
      this.disponibility,
      this.nombre_vues,
      this.images,
      this.vendor,
      this.boutique
      });

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    code = json['code'];
    idBoutique = json['id_boutique'];
    idCategorie = json['id_category'];
    name = json['name'];
    descriptionBrief = json['description_brief'];
    price = json['price'];
    priceBefore = json['price_before'];
    nombre_vues = json['nombre_vues'];
    disponibility = json['disponibility']??true;
    boutique = json['boutique'] != null ? Boutique.fromJson(json['boutique']) : null;
    vendor = json['vendeur'] != null ? Vendor.fromJson(json['vendeur']) : null;
    if (json['images'] != null) {
      images = <Image>[];
      json['images'].forEach((v) {
        images?.add(Image.fromJson(v));
      });
    }
  }


  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['id'] = id;
    data['code'] = code;
    data['id_boutique'] = idBoutique;
    data['id_categorie'] = idCategorie;
    data['name'] = name;
    data['description_brief'] = descriptionBrief;
    data['price'] = price;
    data['price_before'] = priceBefore;
    data['disponibility'] = disponibility;
    data['vendeur'] = vendor?.toJson();
    data['boutique'] = boutique?.toJson();
    if (images != null) {
      data['images'] = images!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
