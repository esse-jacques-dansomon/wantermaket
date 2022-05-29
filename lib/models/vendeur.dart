
import 'dart:convert';

Vendeur vendeurFromJson(String str) => Vendeur.fromJson(json.decode(str));

String vendeurToJson(Vendeur data) => json.encode(data.toJson());

class Vendeur {
  Vendeur({
    required this.id,
    required this.username,
    required this.email,
    required this.phone,
    required this.address,
    required this.city,
    required this.country,
    required this.status,
    required this.codeValide,
  });

  int id;
  String username;
  String email;
  String phone;
  String address;
  String city;
  String country;
  String status;
  String codeValide;

  Vendeur copyWith({
    int? id,
    String? username,
    String? email,
    String? phone,
    String? address,
    String? city,
    String? country,
    String? status,
    String? codeValide,
  }) =>
      Vendeur(
        id: id ?? this.id,
        username: username ?? this.username,
        email: email ?? this.email,
        phone: phone ?? this.phone,
        address: address ?? this.address,
        city: city ?? this.city,
        country: country ?? this.country,
        status: status ?? this.status,
        codeValide: codeValide ?? this.codeValide,
      );

  factory Vendeur.fromJson(Map<String, dynamic> json) => Vendeur(
    id: json["id"],
    username: json["username"],
    email: json["email"],
    phone: json["phone"],
    address: json["address"],
    city: json["city"],
    country: json["country"],
    status: json["status"],
    codeValide: json["code_valide"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "username": username,
    "email": email,
    "phone": phone,
    "address": address,
    "city": city,
    "country": country,
    "status": status,
    "code_valide": codeValide,
  };
}
