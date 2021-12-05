class CategoryModel {
  int id;
  String cat_title;
  int perent_id;
  String icon;
  CategoryModel({
    required this.id,
    required this.cat_title,
    required this.perent_id,
    required this.icon
});
  factory CategoryModel.fromJson(Map <String, dynamic> json) {
    return CategoryModel(
      id: int.parse(json['id']),
      cat_title : json['cat_title']??'',
      perent_id: int.parse(json['perent_id']),
      icon:  json['icon']??''
    );
  }
}