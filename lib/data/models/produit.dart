class Produit {
  int? id;
  String? code;
  int? idBoutique;
  int? idCategorie;
  String? name;
  String? descriptionBrief;
  int? price;
  int? priceBefore;
  String? disponibility;

  Produit(
      {this.id,
      this.code,
      this.idBoutique,
      this.idCategorie,
      this.name,
      this.descriptionBrief,
      this.price,
      this.priceBefore,
      this.disponibility});

  Produit.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    code = json['code'];
    idBoutique = json['id_boutique'];
    idCategorie = json['id_categorie'];
    name = json['name'];
    descriptionBrief = json['description_brief'];
    price = json['price'];
    priceBefore = json['price_before'];
    disponibility = json['disponibility'];
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
    return data;
  }
}
