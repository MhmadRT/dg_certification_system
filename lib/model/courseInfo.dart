class CourseInfo {
  int id;
  String CourseName;
  DateTime CourseDate;
  DateTime EndDate;

  CourseInfo({
    required this.id,
    required this.CourseName,
    required this.CourseDate,
    required this.EndDate,
});
  factory CourseInfo.fromJson(Map <String, dynamic> json){
    return CourseInfo (
      id: int.parse(json['id']) ,
      CourseName: json['CourseName']??'',
      CourseDate: DateTime.parse(json['CourseDate']),
      EndDate: DateTime.parse(json['EndDate']),
    );
  }
}