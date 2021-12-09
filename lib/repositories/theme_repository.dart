import 'dart:convert';
import 'dart:developer';

import 'package:dg_certification_system/model/themes.dart';
import 'package:dg_certification_system/utils/string_extensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class ThemeRepository {
  getThemes(BuildContext context) async {
    var headers = {
      "Accept": "application/json",
      "Access-Control-Allow-Origin": "*",
    };
    var request = http.Request(
        'GET', Uri.parse('https://training.jo-schools.com/api/getThemes.php'));
    print(request.url);
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      Themes themes =
          Themes.fromJson(json.decode(await response.stream.bytesToString()));
      if (themes.themes != null) {
        log('THEMES TRUE');
        print(themes.toJson());
        return themes;
      } else {
        print('THEMES FALSE');
        'يوجد مشكلة'.toDialog(context);
        return Themes(themes: []);
      }
    } else {
      'الرجاء اعادة تسجيل الدخول'.expirationSession(context);
    }
  }
  getThemeById(BuildContext context,int id) async {
    var headers = {
      "Accept": "application/json",
      "Access-Control-Allow-Origin": "*",
    };
    var request = http.Request(
        'GET', Uri.parse('https://training.jo-schools.com/api/getThemes.php?theme_id=$id'));
    print(request.url);
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      Themes themes =
          Themes.fromJson(json.decode(await response.stream.bytesToString()));
      if (themes.themes != null) {
        log('THEMES TRUE');
        print(themes.toJson());
        return themes;
      } else {
        print('THEMES FALSE');
        'يوجد مشكلة'.toDialog(context);
        return Themes(themes: []);
      }
    } else {
      'الرجاء اعادة تسجيل الدخول'.expirationSession(context);
    }
  }
}
