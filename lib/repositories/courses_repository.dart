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
      'الرجاء اعادة تسجيل الدخول'.expirationSession(context);
    }
  }
  Future<dynamic> getCoursesByCategoryId(BuildContext context,int categoryId) async {
    var headers = {
      'Authorization':"Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiI1IiwianRpIjoiYTJkMzhkMTRkMWQwZGI5Y2VjYzc4MjJhYzRjZmM5NjVhMTc1ODMxODUzODQ2OTg1ZDA2YzFkOTQ0Yjk3MjRjMmZjNDRjMWNiYjE5ODA3ZjMiLCJpYXQiOjE2Mzg4Njk1NTAuMDc1MjI5LCJuYmYiOjE2Mzg4Njk1NTAuMDc1MjM3LCJleHAiOjE2NzA0MDU1NTAuMDYxMDE5LCJzdWIiOiIxMDA0Iiwic2NvcGVzIjpbXX0.AUzmeParYPmc1Nh84Wd1UULMG0Ss13Pg05pxwZQlAU5FKfyzstT4AXcyz_wHWg_uZgDAxefbzDQGx3GetTZrpOvJq3WyDE_ISQLkORXrDwMGLQb0rfpSfSS3pxJSeWCpPSUM6mDkaHbNdupB3orUo75tyo7LIfdKBnl-HreW5nQISoc6zVHO274Y9xyeEno0TUldkI_CrOmsVm7CxNTFXslenYFYkc-vxYJhfBKhwUDM46Kdvn22iZnoRtoM9vrnV-Uhcwutx6Sarb6dhrSWJfjghSSv_Y_p0BkreuyEEwhJOYFyn5bW-_hqVnbrSqLCDjXxy1FFhm-pOvQ_Z9-whinHx71Ohr1lUecOWZgcnau5-Sma0l-n917V4_K3qV8gy_KDVqN7eBkIy4topLgZzWjb2z-aLCH6hTuwApA7uUV9fB8gtCNTfIWYF0_K1pkhtjjSHlb_Pzw9gsGTjL5gTIU6Nzfy6nfW-xhZgex_ScKmMC6_TtsvgZuEWGuqcFgMyj0OluDh2dJaQm-zZyLicthMrXJo_bXCcGQaK3rmWA6xQHoFXzz486ubFzm2mQevjx5V56Bz_qTAX3aZ_qYnYG5PDBZEBJwZBX7KCuGuMDM-CD9ybNglz9RxLo_hHQIVHcs3--KPVWu0-SVzrUNBIZaJBVTfjGAWtiydYYO4Zdo"
      // 'Bearer ${currentUser.value.token}'
    };
    var request =
    http.Request('GET', Uri.parse(APIUrls.coursesByCatID+"$categoryId"));
    print(APIUrls.coursesByCatID+"$categoryId");
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
        return Courses(success: false, data: [], message: 'توجد مشكلة');
      }
    } else {
      'الرجاء اعادة تسجيل الدخول'.expirationSession(context);
    }
  }

}
