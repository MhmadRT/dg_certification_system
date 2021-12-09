import 'dart:convert';

Trainees traineesFromJson(String str) => Trainees.fromJson(json.decode(str));

String traineesToJson(Trainees data) => json.encode(data.toJson());

class Trainees {
  Trainees({
    this.trainees,
  });

  List<TraineesCourseModel>? trainees;

  factory Trainees.fromJson(Map<String, dynamic> json) => Trainees(
        trainees: json["data"] == null
            ? null
            : List<TraineesCourseModel>.from(json["data"].map((x) => TraineesCourseModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": trainees == null
            ? null
            : List<dynamic>.from(trainees!.map((x) => x.toJson())),
      };
}

class TraineesCourseModel {
  TraineesCourseModel({
    this.fullName,
    this.email,
    this.id,
    this.image,
    this.mobile,
    this.certCode,
  });

  String? fullName;
  String? email;
  String? id;
  dynamic image;
  String? mobile;
  String? certCode;

  factory TraineesCourseModel.fromJson(Map<String, dynamic> json) => TraineesCourseModel(
        fullName: json["full_name"] == null ? null : json["full_name"],
        email: json["email"] == null ? null : json["email"],
        id: json["id"] == null ? null : json["id"],
        image: json["image"],
        mobile: json["mobile"] == null ? null : json["mobile"],
        certCode: json["cert_code"] == null ? null : json["cert_code"],
      );

  Map<String, dynamic> toJson() => {
        "full_name": fullName == null ? null : fullName,
        "email": email == null ? null : email,
        "id": id == null ? null : id,
        "image": image,
        "mobile": mobile == null ? null : mobile,
        "cert_code": certCode == null ? null : certCode,
      };
}

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
