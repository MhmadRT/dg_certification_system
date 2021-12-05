
class User {
  int id;
  String name;
  String username;
  String profile_image;
  int user_type;

  User({
    required this.id,
    required this.name,
    required this.username,
    required this.profile_image,
    required this.user_type

  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        id : int.parse(json['id']),
        name : json['name'] ??'',
        username : json['email']??'',
        profile_image : json['profile_image']??'',
        user_type: int.parse(json['user_type']));
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'name': name,
      'username': username,
    };
  }

  factory User.fromLocalDatabaseMap(Map<String, dynamic> json) {
    return User(
    id : json['_id'],
    name : json['name'],
    username : json['username'], profile_image: json['profile_image'], user_type: json['user_type']);
  }

  Map<String, dynamic> toLocalDatabaseMap() {
    Map<String, dynamic> map = {};
    map['_id'] = id;
    map['name'] = name;
    map['username'] = username;
    return map;
  }

  @override
  String toString() {
    return '{"_id":"$id","name":"$name","username":"$username"}';
  }
}
