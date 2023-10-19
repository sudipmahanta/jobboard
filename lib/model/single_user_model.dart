// To parse this JSON data, do
//
//     final singleUserModel = singleUserModelFromJson(jsonString);

import 'dart:convert';

SingleUserModel singleUserModelFromJson(String str) => SingleUserModel.fromJson(json.decode(str));

String singleUserModelToJson(SingleUserModel data) => json.encode(data.toJson());

class SingleUserModel {
  final Data? data;
  final Support? support;

  SingleUserModel({
    this.data,
    this.support,
  });

  factory SingleUserModel.fromJson(Map<String, dynamic> json) => SingleUserModel(
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
    support: json["support"] == null ? null : Support.fromJson(json["support"]),
  );

  Map<String, dynamic> toJson() => {
    "data": data?.toJson(),
    "support": support?.toJson(),
  };
}

class Data {
  final int? id;
  final String? email;
  final String? firstName;
  final String? lastName;
  final String? avatar;

  Data({
    this.id,
    this.email,
    this.firstName,
    this.lastName,
    this.avatar,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    email: json["email"],
    firstName: json["first_name"],
    lastName: json["last_name"],
    avatar: json["avatar"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "email": email,
    "first_name": firstName,
    "last_name": lastName,
    "avatar": avatar,
  };
}

class Support {
  final String? url;
  final String? text;

  Support({
    this.url,
    this.text,
  });

  factory Support.fromJson(Map<String, dynamic> json) => Support(
    url: json["url"],
    text: json["text"],
  );

  Map<String, dynamic> toJson() => {
    "url": url,
    "text": text,
  };
}
