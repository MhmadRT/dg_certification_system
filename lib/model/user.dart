
import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  User({
    this.token,
    this.fullName,
  });

  String? token;
  dynamic fullName;

  factory User.fromJson(Map<String, dynamic> json) => User(
    token: json["token"] == null ? null : json["token"],
    fullName: json["full_name"],
  );

  Map<String, dynamic> toJson() => {
    "token": token == null ? null : token,
    "full_name": fullName,
  };
}
