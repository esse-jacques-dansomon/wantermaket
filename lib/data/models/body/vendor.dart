class Vendor {
  int? id;
  String? name;
  String? firstName;
  String? email;
  String? username;
  String? phone;
  String? address;
  String? city;
  String? country;
  String? statut;
  String? numeroWhatsapp;


  Vendor(
      {this.id,
      this.name,
      this.firstName,
      this.email,
      this.username,
      this.phone,
      this.address,
      this.city,
      this.country,
      this.numeroWhatsapp,
      this.statut});

  //accepts null

  Vendor.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    firstName = json['first_name'];
    email = json['email'];
    username = json['username'];
    phone = json['phone'];
    // numeroWhatsapp = json["numero_whatsapp"] == null ? null : json["numero_whatsapp"];
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
    data['email'] = email;
    data['username'] = username;
    data['phone'] = phone;
    data['address'] = address;
    data['city'] =city;
    data['country'] = country;
    data['statut'] = statut;
    return data;
  }
}
