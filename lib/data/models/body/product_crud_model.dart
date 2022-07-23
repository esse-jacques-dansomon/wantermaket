// To parse this JSON data, do
//
//     final productCrudModel = productCrudModelFromJson(jsonString);

import 'dart:convert';

ProductCrudModel productCrudModelFromJson(String str) => ProductCrudModel.fromJson(json.decode(str));

String productCrudModelToJson(ProductCrudModel data) => json.encode(data.toJson());

class ProductCrudModel {
  ProductCrudModel({
    required this.idCategory,
    required this.name,
    required this.descriptionBrief,
    required this.price,
    required this.priceBefore,
    required this.disponibility,
  });

  int idCategory;
  String name;
  String descriptionBrief;
  int price;
  int priceBefore;
  String disponibility;

  factory ProductCrudModel.fromJson(Map<String, dynamic> json) => ProductCrudModel(
    idCategory: json["id_category"],
    name: json["name"],
    descriptionBrief: json["description_brief"],
    price: json["price"],
    priceBefore: json["price_before"],
    disponibility: json["disponibility"],
  );

  Map<String, dynamic> toJson() => {
    "id_category": idCategory,
    "name": name,
    "description_brief": descriptionBrief,
    "price": price,
    "price_before": priceBefore,
    "disponibility": disponibility,
  };
}
