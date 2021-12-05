class courseModel {
  int id;
  String response;
  String order_type;
  String scheduled_date;
  String created_date;
  String name;
  courseModel({required this.id,
    required this.response,
    required this.order_type,
    required this.scheduled_date,
    required this.created_date,
    required this.name});
  factory courseModel.fromJson (Map <String ,dynamic> json){
    return courseModel(
    id: int.parse(json['id']),
      name: json['name']??'',
      response: json['response']??'',
      scheduled_date: json['scheduled_date']??'',
      created_date: json['created_date']??'',
      order_type: json['order_type']??'',
    );
  }
}