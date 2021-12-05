import 'dart:convert';
import 'package:dg_certification_system/model/custom_error.dart';
import 'package:dg_certification_system/model/user.dart';
import 'package:dg_certification_system/utils/api_servers.dart';
import 'package:hive/hive.dart';

import 'package:http/http.dart' as http;

class LoginRepository {
  Future<dynamic> login(String username, String password) async {
    var body = {"username":"$username","password":"$password"};
    try {
      var response = await http.post(
        Uri.parse('${ApiSevers.phpServer}${ApiSevers.login}'),
        body: json.encode(body),
      );
      var loginResponse = jsonDecode(response.body);
      if (loginResponse['error'] != null) {
        return CustomError.fromJson(loginResponse);
      }else {
        if(int.parse(loginResponse['user']['user_type']) == 1) {
          final user = User.fromJson(loginResponse['user']);
          // var token = tokenData(token: loginResponse['token'],
          //     userid: user.id.toString(),
          //     username: user.name,
          //     imageProfile: user.profile_image);
          // var box = await Hive.openBox('loginInfo');
          // Hive.registerAdapter(TokenAdapter());
          // await box.put('token', token);
          // if (!await box.containsKey('token')) {
          //   await box.delete('token').then((value) async =>
          //   await box.put('token', token)
          //   );
          // }
          // else {
          //   await box.put('token', token);
          // }
          return user;
        }
      else {
          return CustomError(
            error: true,
            errorMessage: "غير مسموح لك بالدخول يرجي الاتصال بمدير الموقع",
          );
        }
      }} catch (err) {
      print(err);
      return CustomError(
        error: true,
        errorMessage: "حدث خطأ يرجي المحاوله مره اخرى",
      );
    }
  }
}
@HiveType(typeId: 1)
class tokenData {
  @HiveField(0)
  String token;
  @HiveField(1)
  String userid;
  @HiveField(2)
  String username;
  @HiveField(3)
  String imageProfile;
  tokenData({required this.token, required this.userid,required this.username,required this.imageProfile});
  String toString() {
    return 'token: $token';
  }
}

class TokenAdapter extends TypeAdapter<tokenData> {
  @override
  final int typeId = 1;

  @override
  tokenData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return tokenData(
      token: fields[0] as String, imageProfile: fields[3] as String, username: fields[2] as String, userid: fields[1] as String,

    );
  }

  @override
  void write(BinaryWriter writer, tokenData obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.token);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is TokenAdapter &&
              runtimeType == other.runtimeType &&
              typeId == other.typeId;
}