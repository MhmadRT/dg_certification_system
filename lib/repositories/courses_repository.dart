import 'dart:convert';
import 'dart:developer';
import 'package:dg_certification_system/api/api_urls.dart';
import 'package:dg_certification_system/model/courses.dart';
import 'package:dg_certification_system/model/custom_error.dart';
import 'package:dg_certification_system/repositories/login_repository.dart';
import 'package:dg_certification_system/utils/string_extensions.dart';
import 'package:flutter/cupertino.dart';

import 'package:http/http.dart' as http;

class CourseRepository {

  Future<dynamic> getCourse(BuildContext context) async {
    var headers = {
      'Authorization':
      'Bearer ${currentUser.value.token}'
    };
    var request =
    http.Request('GET', Uri.parse(APIUrls.category));
    print(APIUrls.category);
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      Courses category = Courses.fromMap(
          json.decode(await response.stream.bytesToString()));
      if (category.success) {
        log('COURSES TRUE');
        return category;
      } else {
        print('COURSES FALSE');
        category.message.toDialog(context);
        return [];
      }
    } else {
      'الرجاء اعادة تسجيل الدخول'.toDialog(context);
    }
  }

}
