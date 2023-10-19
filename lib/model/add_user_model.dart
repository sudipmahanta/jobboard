// To parse this JSON data, do
//
//     final addUserModel = addUserModelFromJson(jsonString);

import 'dart:convert';

AddUserModel addUserModelFromJson(String str) => AddUserModel.fromJson(json.decode(str));

String addUserModelToJson(AddUserModel data) => json.encode(data.toJson());

class AddUserModel {
  final String? name;
  final String? job;
  final String? id;
  final DateTime? createdAt;

  AddUserModel({
    this.name,
    this.job,
    this.id,
    this.createdAt,
  });

  factory AddUserModel.fromJson(Map<String, dynamic> json) => AddUserModel(
    name: json["name"],
    job: json["job"],
    id: json["id"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "job": job,
    "id": id,
    "createdAt": createdAt?.toIso8601String(),
  };
}
