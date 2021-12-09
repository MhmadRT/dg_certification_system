// To parse this JSON data, do
//
//     final themes = themesFromJson(jsonString);

import 'dart:convert';

Themes themesFromJson(String str) => Themes.fromJson(json.decode(str));

String themesToJson(Themes data) => json.encode(data.toJson());

class Themes {
  Themes({
    required this.themes,
  });

  final List<ThemeModel> themes;

  factory Themes.fromJson(Map<String, dynamic> json) => Themes(
        themes: List<ThemeModel>.from(
            json["data"].map((x) => ThemeModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(themes.map((x) => x.toJson())),
      };
}

ThemeModel themeModelFromJson(String str) =>
    ThemeModel.fromJson(json.decode(str));

String themeModelToJson(ThemeModel data) => json.encode(data.toJson());

class ThemeModel {
  ThemeModel({
    required this.id,
    required this.themeTitle,
    required this.backImge,
    required this.themeHeight,
    required this.themeWidth,
    required this.items,
  });

  final String id;
  final String themeTitle;
  final String backImge;
  final String themeHeight;
  final String themeWidth;
  final List<Item> items;

  factory ThemeModel.fromJson(Map<String, dynamic> json) => ThemeModel(
        id: json["id"],
        themeTitle: json["theme_title"],
        backImge: json["back_imge"],
        themeHeight: json["theme_height"],
        themeWidth: json["theme_width"],
        items: json['item'] != null
            ? List<Item>.from(json["items"]!.map((x) => Item.fromJson(x)))
            : [],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "theme_title": themeTitle,
        "back_imge": backImge,
        "theme_height": themeHeight,
        "theme_width": themeWidth,
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
      };
}

class Item {
  Item({
    required this.itemId,
    required this.type,
    required this.fontWight,
    required this.x,
    required this.y,
    required this.textSize,
    required this.height,
    required this.width,
    required this.align,
    required this.color,
    required this.content,
  });

  String itemId;
  String type;
  String fontWight;
  double x;
  double y;
  double textSize;
  double height;
  double width;
  String align;
  String color;
  String content;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        itemId: json["item_id"],
        type: json["type"],
        fontWight: json["font_wight"],
        x: json["x"],
        y: json["y"],
        textSize: json["text_size"],
        height: json["height"],
        width: json["width"],
        align: json["align"],
        color: json["color"],
        content: json["content"],
      );

  Map<String, dynamic> toJson() => {
        "item_id": itemId,
        "type": type,
        "font_wight": fontWight,
        "x": x,
        "y": y,
        "text_size": textSize,
        "height": height,
        "width": width,
        "align": align,
        "color": color,
        "content": content,
      };
}
