import 'dart:convert';

String traineeListJson(List<TraineeModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TraineeModel {
  String email;
  String fullName;
  dynamic nationalId;
  dynamic employeesNationality;
  dynamic mobile;

  TraineeModel(
      {required this.email,
      required this.fullName,
      required this.nationalId,
      required this.employeesNationality,
      required this.mobile});

  Map<String, dynamic> toJson() => {
        "email": email,
        "full_name": fullName,
        "national_id": nationalId,
        "employees_nationality": employeesNationality,
        "mobile": mobile,
      };
}
