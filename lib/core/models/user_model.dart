import 'dart:convert';

class User {
  final String id;
  final String email;
  User({required this.id, required this.email});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'email': email,
    };
  }

  String toJson() {
    return json.encode(toMap());
  }

  Map<String, dynamic> fromMap(Map<String, dynamic> json) => json;

  // factory User.fromJson(Map<String, dynamic> json) {
  //   return fromMap(json.decode(json));
  // }
}
