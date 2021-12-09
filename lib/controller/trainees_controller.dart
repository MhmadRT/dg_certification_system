import 'package:dg_certification_system/controller/state_control.dart';
import 'package:dg_certification_system/model/custom_error.dart';
import 'package:dg_certification_system/model/employeesModel.dart';
import 'package:dg_certification_system/model/trainee.dart';
import 'package:dg_certification_system/repositories/trainees_repository.dart';
import 'package:flutter/material.dart';
import '../utils/string_extensions.dart';

class TraineesCourseController extends StateControl{
  List<employeesModel> list= [];
  List<TraineesCourseModel> trainees=[];
  bool loading=false;
  final TraineesRepository _employeesRepository= TraineesRepository();
  @override
  void init() {
    getData(course_id);
  }
  Future<dynamic> getData(int course_id) async {
    loading=true;
    notifyListeners();

    var employeeList = await _employeesRepository.ListTrainee(course_id);
    if (employeeList is CustomError) {
      employeeList.errorMessage.toDialog(context);
      loading=false;
      notifyListeners();

    }
    else{
      trainees = employeeList.trainees;
      print(trainees);
      loading=false;
      notifyListeners();

    }
    notifyListeners();
  }
  final BuildContext context;
  final int course_id;
  TraineesCourseController(this.context,this.course_id){
    init();
  }
}