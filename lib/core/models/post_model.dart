// class Post {
//   final String name;
//   final String id;
//   Post({this.id = '', this.name = ''});
// }

// To parse this JSON data, do
//
//     final post = postFromJson(jsonString);

import 'dart:convert';

Post postFromJson(String str) => Post.fromJson(json.decode(str));

String postToJson(Post data) => json.encode(data.toJson());

class Post {
  Post({
    required this.id,
    required this.name,
    this.status = '',
    this.species = '',
    this.type = '',
    this.gender = '',
    // this.origin,
    // this.location,
    // this.image,
    // this.episode,
    // this.url,
    // this.created,
  });

  int id;
  String name;
  String status;
  String species;
  String type;
  String gender;
  // Location origin;
  // Location location;
  // String image;
  // List<String> episode;
  // String url;
  // DateTime created;

  factory Post.fromJson(Map<String, dynamic> json) => Post(
        id: json["id"],
        name: json["name"],
        status: json["status"],
        species: json["species"],
        type: json["type"],
        gender: json["gender"],
        // origin: Location.fromJson(json["origin"]),
        // location: Location.fromJson(json["location"]),
        // image: json["image"],
        // episode: List<String>.from(json["episode"].map((x) => x)),
        // url: json["url"],
        // created: DateTime.parse(
        //   json["created"],
        // ),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "status": status,
        "species": species,
        "type": type,
        "gender": gender,
        // "origin": origin.toJson(),
        // "location": location.toJson(),
        // "image": image,
        // "episode": List<dynamic>.from(episode.map((x) => x)),
        // "url": url,
        // "created": created.toIso8601String(),
      };
}

class Location {
  Location({
    required this.name,
    required this.url,
  });

  String name;
  String url;

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        name: json["name"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "url": url,
      };
}

/*
Error types :
 _TypeError
*/