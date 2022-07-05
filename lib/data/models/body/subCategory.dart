class SousCategorie {
  int? id;
  String? name;
  String? imagePath;
  int? idCategory;

  SousCategorie({this.id, this.name, this.imagePath, this.idCategory});

  SousCategorie.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    imagePath = json['image_path'];
    idCategory = json['id_category'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['image_path'] = imagePath;
    data['id_category'] = idCategory;
    return data;
  }
}