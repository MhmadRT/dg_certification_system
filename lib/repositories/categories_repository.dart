import 'dart:convert';
import 'dart:developer';

import 'package:dg_certification_system/api/api_urls.dart';
import 'package:dg_certification_system/model/category_model.dart';
import 'package:dg_certification_system/utils/string_extensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import 'login_repository.dart';

class CategoriesRepository {
  getCategories(BuildContext context, {String? id}) async {
    var headers = {
      'Authorization': 'Bearer ${currentUser.value.token}'
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
      'الرجاء اعادة تسجيل الدخول'.expirationSession(context);
    }
  }
}
