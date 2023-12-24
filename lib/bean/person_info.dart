// To parse this JSON data, do
//
//     final personInfo = personInfoFromJson(jsonString);

import 'dart:convert';

PersonInfo personInfoFromJson(String str) => PersonInfo.fromJson(json.decode(str));

String personInfoToJson(PersonInfo data) => json.encode(data.toJson());

class PersonInfo {
  String? id;
  String? name;
  String? age;
  String? gender;

  PersonInfo({
    this.id,
    this.name,
    this.age,
    this.gender,
  });

  factory PersonInfo.fromJson(Map<String, dynamic> json) => PersonInfo(
    id: json["id"],
    name: json["name"],
    age: json["age"],
    gender: json["gender"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "age": age,
    "gender": gender,
  };
}
