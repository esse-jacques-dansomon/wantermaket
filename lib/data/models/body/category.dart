class Category {
  int? id;
  String? name;
  String? imagePath;

  Category({this.id, this.name, this.imagePath});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    imagePath =  json['image_path'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['image_path'] = imagePath;
    return data;
  }
}