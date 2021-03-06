import 'package:dg_certification_system/controller/state_control.dart';
import 'package:dg_certification_system/model/courses.dart';
import 'package:dg_certification_system/repositories/courses_repository.dart';
import 'package:flutter/cupertino.dart';

class CourseController extends StateControl {
  Courses? courses;
  BuildContext context;
  bool loading = true;

  CourseController(this.context) {
    init();
  }

  @override
  void init()  {
   getData();
    super.init();
  }

  getData()async{
    loading = true;
    notifyListeners();
    courses = await CourseRepository().getCourse(context);
    loading = false;
    notifyListeners();
  }
}
