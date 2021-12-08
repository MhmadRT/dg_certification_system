import 'dart:convert';
import 'package:dg_certification_system/api/api_request.dart';
import 'package:dg_certification_system/api/api_urls.dart';
import 'package:dg_certification_system/model/user.dart';
import 'package:dg_certification_system/view/screens/main_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import '../../utils/string_extensions.dart';

ValueNotifier<User> currentUser = ValueNotifier(User());

class LoginRepository {
 login(
      String username, String password, BuildContext context) async {
    'يرجى الانتظار...'.toWaitDialog(context);
    Map<String, String> headers = {
      "Accept": "application/json",
      "Access-Control-Allow-Origin": "*"
    };
    String url = APIUrls.login;
    bool success = false;
    String massage='';
    APIRequest(
      url,
      {"email": "$username", "password": "$password"},
      headers,
      APIMethod.MULTI_PART,
    ).request().then((value) async {
      print('dadadada :${value!.data}');

      print('success :${value.success}');
      final user = userFromJson(json.encode(value.data));
      // var token = tokenData(
      //   token: user.token!,
      //   name: user.fullName??'',
      // );
      currentUser.value = user;
      // var box = await Hive.openBox('loginInfo');
      // if(!Hive.isAdapterRegistered(33))
      // Hive.registerAdapter(TokenAdapter());
      // await box.put('token', token);
      // if (!await box.containsKey('token')) {
      //   await box
      //       .delete('token')
      //       .then((value) async => await box.put('token', token));
      // } else {
      //   await box.put('token', token);
      // }
      massage=value.message!;
      success = value.success!;
      if(value.success!){
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
                builder: (context) => const MainScreen()),(Route<dynamic> route) => false);
      }
      else{
        '$massage'.toSnakBar(context);
      }
      return success;
    });
    '$massage'.back(context);
    return success;
  }
}

@HiveType(typeId: 1)
class tokenData {
  @HiveField(0)
  String token;
  @HiveField(1)
  String name;

  tokenData({required this.token, required this.name});

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
    return tokenData(token: fields[0] as String, name: fields[1] as String);
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
