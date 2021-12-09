// To parse this JSON data, do
//
//     final category = categoryFromMap(jsonString);

import 'dart:convert';

Categories categoryFromMap(String str) => Categories.fromMap(json.decode(str));

String categoryToMap(Categories data) => json.encode(data.toMap());

class Categories {
  Categories({
    required this.success,
    required this.data,
    required this.message,
  });

  final bool success;
  final List<CategoryData> data;
  final String message;

  factory Categories.fromMap(Map<String, dynamic> json) => Categories(
    success: json["success"],
    data: List<CategoryData>.from(json["data"].map((x) => CategoryData.fromMap(x))),
    message: json["message"],
  );

  Map<String, dynamic> toMap() => {
    "success": success,
    "data": List<dynamic>.from(data.map((x) => x.toMap())),
    "message": message,
  };
}

class CategoryData {
  CategoryData({
    required this.id,
    required this.catTitle,
    required this.icon,
    required this.perentId,
  });

  final int id;
  final String catTitle;
  final String icon;
  final int perentId;

  factory CategoryData.fromMap(Map<String, dynamic> json) => CategoryData(
    id: json["id"],
    catTitle: json["cat_title"],
    icon: json["icon"],
    perentId: json["perent_id"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "cat_title": catTitle,
    "icon": icon,
    "perent_id": perentId,
  };
}
