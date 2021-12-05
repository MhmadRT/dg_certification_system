class employeesModel {
  int id;
  String name;
  String email;
  String mobile;
  String image;
  employeesModel({required this.id, required this.name, required this.email,required this.image,required this.mobile});
  factory employeesModel.fromJsom(Map <String, dynamic> json){
    return employeesModel(
      id: int.parse(json['id']),
      name: json['full_name']??'',
        mobile: json['mobile']??'',
      image: json['image']??'',
        email:json['email']??''
    );
  }
}