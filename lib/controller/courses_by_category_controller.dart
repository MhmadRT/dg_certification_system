import 'package:dg_certification_system/controller/state_control.dart';
import 'package:dg_certification_system/model/category_model.dart';
import 'package:dg_certification_system/model/courses.dart';
import 'package:dg_certification_system/repositories/categories_repository.dart';
import 'package:dg_certification_system/repositories/courses_repository.dart';
import 'package:flutter/cupertino.dart';

class CoursesByCategoryController extends StateControl {
  Courses? courses;
  CategoryData categoryData;
  BuildContext context;

  CoursesByCategoryController(
      {required this.categoryData, required this.context,this.loading=true}){
    getData();
  }

  bool loading;

  getData() async {
    courses = await CourseRepository()
        .getCoursesByCategoryId(context, categoryData.id);
    loading = false;
    notifyListeners();
  }
}
