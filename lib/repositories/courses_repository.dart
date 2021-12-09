import 'dart:convert';
import 'dart:developer';

import 'package:dg_certification_system/api/api_urls.dart';
import 'package:dg_certification_system/model/courses.dart';
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
    http.Request('GET', Uri.parse(APIUrls.courses));
    print(APIUrls.courses);
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      Courses courses = Courses.fromMap(
          json.decode(await response.stream.bytesToString()));
      if (courses.success) {
        log('COURSES TRUE');
        print(courses.data);
        return courses;
      } else {
        print('COURSES FALSE');
        courses.message.toDialog(context);
        return [];
      }
    } else {
      'الرجاء اعادة تسجيل الدخول'.toDialog(context);
    }
  }
  Future<dynamic> getCoursesByCategoryId(BuildContext context,int categoryId) async {
    var headers = {
      'Authorization':
      'Bearer ${currentUser.value.token}'
    };
    var request =
    http.Request('GET', Uri.parse(APIUrls.coursesByCatID+"$categoryId"));
    print(APIUrls.courses);
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      Courses courses = Courses.fromMap(
          json.decode(await response.stream.bytesToString()));
      if (courses.success) {
        log('COURSES TRUE');
        print(courses.data);
        return courses;
      } else {
        print('COURSES FALSE');
        courses.message.toDialog(context);
        return [];
      }
    } else {
      'الرجاء اعادة تسجيل الدخول'.toDialog(context);
    }
  }

}
