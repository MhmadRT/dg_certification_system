import 'dart:convert';
import 'dart:developer';
import 'dart:js';
import 'package:dg_certification_system/api/api_request.dart';
import 'package:dg_certification_system/api/api_urls.dart';
import 'package:dg_certification_system/model/api_result.dart';
import 'package:dg_certification_system/model/category_model.dart';
import 'package:dg_certification_system/model/custom_error.dart';
import 'package:dg_certification_system/utils/string_extensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class CategoriesRepository {
  getCategories(BuildContext context, {String? id}) async {
    var headers = {
      'Authorization':
          'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiI1IiwianRpIjoiOGM2NTgyMDc1Mzk1ZWE3MTE0ZjliZjc1MGUzODU0ZDI5YzA1MjcyZTJkZDVmYjY5MWVkMzJhNjQwNzEwNmI5NGExODdhOWVhYmJkNDRiZGYiLCJpYXQiOjE2Mzg5NDkyNDMuNTQ2MTkxLCJuYmYiOjE2Mzg5NDkyNDMuNTQ2MTk4LCJleHAiOjE2NzA0ODUyNDMuNTMxMTg0LCJzdWIiOiIxMDA2Iiwic2NvcGVzIjpbXX0.RXRmGKQN4fSv-cGzmUhRtuU-UKUZuhO7dYUlDSzbh9rZKFxU6bYtLw9H7VMJRuUswgtwpOInF26xFXPDBAiKHbdJpmLjn-snL4S1I19KrCgWhGyfs02ddnGMhu-dI8YDpPxYTZCsGBHQA0WYpxhbgxjlyhDlhSIjunY8_u0PVFAO48SdujDmgcM1dAmUO_qHAoi8me6Slas4YCr7DRVaxfyKKOOzNaBw4_99G_Cnnxog3W00A_2UhuudUOxWWjGHG1qA17a4zASZA5rx2lIWqcNB28a8Dt5QVaDQ5jgm5KGYhhHGkQi8y43T807Xm4rlyWB3Z5SgnmRX65FPVhzLecITDEZFWNjdIMRWkRYKKeZVpemutMfx3F9zIPIfeXU0cPKnFol16AuXZKU1mZPkqW7vFELMsyQXWodIO_ZFtLnT33LQgBj3az1Mr6PUemYLyc4SCis3jDHA0UmnfWKP5w8PcCee7U49Sd1EEld_rpBIDxGJkmggazh5bHwKG4q-ON2bJ62p9Y-fu99llIhpx4roiehH1TkVI-MXmjbQ98m-YlL2MIjSlEnP96NS6ljCstbZ8fJc0eNEzhK2iZaEUQpAfIuh5YyRQtWHsLgotj9KgrBwT4BUi1FMNDusEiAmD05h9hGOZQCti0fKM7M1C5pZ2j9l5ET2G97vwI46r0s'
    };
    var request =
        http.Request('GET', Uri.parse('${APIUrls.category}${id ?? 0}'));
    print('${APIUrls.category}${id ?? 0}');
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      Categories category = Categories.fromMap(
          json.decode(await response.stream.bytesToString()));
      if (category.success) {
        log('CATEGORIES TRUE');
        return category;
      } else {
        print('CATEGORIES FALSE');
        category.message.toDialog(context);
        return [];
      }
    } else {
      'الرجاء اعادة تسجيل الدخول'.toDialog(context);
    }
  }
}
