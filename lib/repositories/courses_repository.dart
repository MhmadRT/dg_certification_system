import 'dart:convert';
import 'package:dg_certification_system/model/courseInfo.dart';
import 'package:dg_certification_system/model/custom_error.dart';

import 'package:http/http.dart' as http;

class CourseRepository {

  Future<dynamic> getCourse() async {
    var url =
    Uri.https('training.jo-schools.com', '/api/getOpenCourses.php',{'Status': '1'});
    try {
      var response = await http.get(
          url, headers: {
        "Accept": "application/json",
        "Access-Control-Allow-Origin": "*"
      }
      );
      dynamic orderResponse = jsonDecode(response.body);
      if (orderResponse['error'] != null) {
        return CustomError.fromJson(orderResponse['error']);
      }else {
        List<dynamic>  orders = orderResponse['data'];
        print(orders);
       List<CourseInfo> CoursesList = orders.map((e) => CourseInfo.fromJson(e)).toList();
        return CoursesList;
      }} catch (err) {
      print(err);
      return CustomError(
        error: true,
        errorMessage: "حدث خطأ يرجي المحاوله مره اخرى",
      );
    }
  }
  Future<dynamic> addCourse() async {
    var url =
    Uri.https('training.jo-schools.com', '/api/getOpenCourses.php',{'Status': '1'});
    try {
      var response = await http.get(
          url, headers: {
        "Accept": "application/json",
        "Access-Control-Allow-Origin": "*"
      }
      );
      dynamic orderResponse = jsonDecode(response.body);
      if (orderResponse['error'] != null) {
        return CustomError.fromJson(orderResponse['error']);
      }else {
        List<dynamic>  orders = orderResponse['data'];
        List<CourseInfo> CoursesList = orders.map((e) => CourseInfo.fromJson(e)).toList();
        return CoursesList;
      }} catch (err) {
      return CustomError(
        error: true,
        errorMessage: "حدث خطأ يرجي المحاوله مره اخرى",
      );
    }
  }
  Future<dynamic> removeCourse() async {
    var url =
    Uri.https('training.jo-schools.com', '/api/getOpenCourses.php',{'Status': '1'});
    try {
      var response = await http.get(
          url, headers: {
        "Accept": "application/json",
        "Access-Control-Allow-Origin": "*"
      }
      );
      dynamic orderResponse = jsonDecode(response.body);
      if (orderResponse['error'] != null) {
        return CustomError.fromJson(orderResponse['error']);
      }else {
        List<dynamic>  orders = orderResponse['data'];
        List<CourseInfo> CoursesList = orders.map((e) => CourseInfo.fromJson(e)).toList();
        return CoursesList;
      }} catch (err) {
      return CustomError(
        error: true,
        errorMessage: "حدث خطأ يرجي المحاوله مره اخرى",
      );
    }
  }
  Future<dynamic> editCourse() async {
    var url =
    Uri.https('training.jo-schools.com', '/api/getOpenCourses.php',{'Status': '1'});
    try {
      var response = await http.get(
          url, headers: {
        "Accept": "application/json",
        "Access-Control-Allow-Origin": "*"
      }
      );
      dynamic orderResponse = jsonDecode(response.body);
      if (orderResponse['error'] != null) {
        return CustomError.fromJson(orderResponse['error']);
      }else {
        List<dynamic>  orders = orderResponse['data'];
        List<CourseInfo> CoursesList = orders.map((e) => CourseInfo.fromJson(e)).toList();
        return CoursesList;
      }} catch (err) {
      return CustomError(
        error: true,
        errorMessage: "حدث خطأ يرجي المحاوله مره اخرى",
      );
    }
  }
  Future<dynamic> certCourse() async {
    var url =
    Uri.https('training.jo-schools.com', '/api/getOpenCourses.php',{'Status': '1'});
    try {
      var response = await http.get(
          url, headers: {
        "Accept": "application/json",
        "Access-Control-Allow-Origin": "*"
      }
      );
      dynamic orderResponse = jsonDecode(response.body);
      if (orderResponse['error'] != null) {
        return CustomError.fromJson(orderResponse['error']);
      }else {
        List<dynamic>  orders = orderResponse['data'];
        List<CourseInfo> CoursesList = orders.map((e) => CourseInfo.fromJson(e)).toList();
        return CoursesList;
      }} catch (err) {
      return CustomError(
        error: true,
        errorMessage: "حدث خطأ يرجي المحاوله مره اخرى",
      );
    }
  }
}
