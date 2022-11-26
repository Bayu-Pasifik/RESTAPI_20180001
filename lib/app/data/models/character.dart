// To parse this JSON data, do
//
//     final character = characterFromJson(jsonString);

import 'dart:convert';

Character characterFromJson(String str) => Character.fromJson(json.decode(str));

String characterToJson(Character data) => json.encode(data.toJson());

class Character {
  Character({
    this.id,
    this.name,
    this.school,
    this.birthday,
    this.photoUrl,
    this.image,
    this.imageSchool,
    this.damageType,
  });

  String? id;
  String? name;
  String? school;
  String? birthday;
  String? photoUrl;
  String? image;
  String? imageSchool;
  String? damageType;

  factory Character.fromJson(Map<String, dynamic> json) => Character(
        id: json["_id"],
        name: json["name"],
        school: json["school"],
        birthday: json["birthday"],
        photoUrl: json["photoUrl"],
        image: json["image"],
        imageSchool: json["imageSchool"],
        damageType: json["damageType"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "school": school,
        "birthday": birthday,
        "photoUrl": photoUrl,
        "image": image,
        "imageSchool": imageSchool,
        "damageType": damageType,
      };
}
