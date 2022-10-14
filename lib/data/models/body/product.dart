import 'dart:convert';

import 'package:wantermarket/data/models/body/subCategory.dart';

import 'boutique.dart';
import 'category.dart';
import 'image.dart';


List<Product> productFromMap(String str) => List<Product>.from(json.decode(str).map((x) => Product.fromJson(x)));

String productToMap(List<Product> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Product {
  int? id;
  String? code;
  int? idBoutique;
  int? idCategorie;
  String? name;
  String? slug;
  String? descriptionBrief;
  int? price;
  int? priceBefore;
  String? disponibility;
  int? nombre_vues;
  List<Image>? images;

  Boutique? boutique;
  Category? categorie;
  SousCategorie? sousCategorie;



  Product(
      {this.id,
        this.code,
        this.idBoutique,
        this.idCategorie,
        this.name,
        this.slug,
        this.descriptionBrief,
        this.price,
        this.priceBefore,
        this.disponibility,
        this.nombre_vues,
        this.images,

        this.boutique,
        this.categorie,
        this.sousCategorie
      });

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    code = json['code'];
    idBoutique = json['id_boutique'];
    idCategorie = json['id_category'];
    name = json['name'];
    slug = json['slug'];
    descriptionBrief = json['description_brief'];
    price = json['price'];
    priceBefore = json['price_before'];
    nombre_vues = json['nombre_vues'];
    disponibility = json['disponibility']??true;
    boutique = json['boutique'] != null ? Boutique.fromJson(json['boutique']) : null;
    categorie = json['categorie'] != null && json['categorie'] !='' ? Category.fromJson(json['categorie']) : null;
    sousCategorie = json['sous_categorie'] != null && json['sous_categorie'] !=''? SousCategorie.fromJson(json['sous_categorie']) : null;
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
    data['slug'] = slug;
    data['description_brief'] = descriptionBrief;
    data['price'] = price;
    data['price_before'] = priceBefore;
    data['disponibility'] = disponibility;
    data['boutique'] = boutique?.toJson();
    if (images != null) {
      data['images'] = images!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
