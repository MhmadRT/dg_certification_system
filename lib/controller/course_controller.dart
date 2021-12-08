import 'package:dg_certification_system/controller/state_control.dart';
import 'package:dg_certification_system/model/courseInfo.dart';
import 'package:dg_certification_system/model/custom_error.dart';
import 'package:dg_certification_system/repositories/courses_repository.dart';
import 'package:flutter/material.dart';

class CoursesController extends StateControl{
  List<CourseInfo> list= [];
  String  error = '';
  final CourseRepository _pndOrderRepository = CourseRepository();
  @override
  void init() {
    // getData();
  }
  // Future<dynamic> getData() async {
  //   var courseList = await _pndOrderRepository.getCourse();
  //   if (courseList is CustomError) {
  //     error = courseList.errorMessage;
  //     notifyListeners();
  //     //courseList.errorMessage.toSnakBar(context);
  //   }
  //   else{
  //     list = courseList;
  //   }
  //   notifyListeners();
  // }
  final BuildContext context;
  CoursesController(this.context){
    init();
  }
}