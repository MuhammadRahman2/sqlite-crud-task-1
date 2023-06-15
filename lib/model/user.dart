// import 'dart:io';

class User {
  final int? id;
  final String? name;
  final String? phoneNumber;
  final String? imageUrl;

  const User({ this.id,  this.name, this.phoneNumber,  this.imageUrl});

  factory User.fromMap(Map<String, dynamic> json) =>
      User(id: json["id"],
          name: json["name"],
          phoneNumber: json["phoneNumber"],
          imageUrl: json["imageUrl"]);

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'phoneNumber': phoneNumber,
      'imageUrl': imageUrl,
    };
  }
}