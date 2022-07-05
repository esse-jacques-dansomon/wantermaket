class Vendor {
  int? id;
  String? name;
  String? firstName;
  String? sex;
  String? email;
  int? age;
  String? nationality;
  String? username;
  String? phone;
  String? address;
  String? city;
  String? country;
  String? statut;

  Vendor(
      {this.id,
      this.name,
      this.firstName,
      this.sex,
      this.email,
      this.age,
      this.nationality,
      this.username,
      this.phone,
      this.address,
      this.city,
      this.country,
      this.statut});

  Vendor.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    firstName = json['first_name'];
    sex = json['sex'];
    email = json['email'];
    age = json['age'];
    nationality = json['nationality'];
    username = json['username'];
    phone = json['phone'];
    address = json['address'];
    city = json['city'];
    country = json['country'];
    statut = json['statut'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['first_name'] = firstName;
    data['sex'] = sex;
    data['email'] = email;
    data['age'] = age;
    data['nationality'] = nationality;
    data['username'] = username;
    data['phone'] = phone;
    data['address'] = address;
    data['city'] =city;
    data['country'] = country;
    data['statut'] = statut;
    return data;
  }
}
