// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

Welcome welcomeFromJson(String str) => Welcome.fromJson(json.decode(str));

String welcomeToJson(Welcome data) => json.encode(data.toJson());

class Welcome {
  Welcome({
    this.id,
    this.title,
    this.value,
    this.available,
    this.photoUrl,
  });

  String id;
  String title;
  int value;
  bool available;
  String photoUrl;

  factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
        id: json["id"],
        title: json["title"],
        value: json["value"],
        available: json["available"],
        photoUrl: json["photoUrl"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "value": value,
        "available": available,
        "photoUrl": photoUrl,
      };
}
