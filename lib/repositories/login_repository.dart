import 'dart:convert';
import 'package:dg_certification_system/api/api_request.dart';
import 'package:dg_certification_system/api/api_urls.dart';
import 'package:dg_certification_system/model/user.dart';
import 'package:dg_certification_system/view/screens/main_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import '../../utils/string_extensions.dart';
import 'package:http/http.dart' as http;

ValueNotifier<User> currentUser = ValueNotifier(User());

class LoginRepository {
  login(String username, String password, BuildContext context) async {
    'الرجاء الانتظار'.toWaitDialog(context);
    Map<String, String> headers = {
      "Accept": "application/json",
      "Access-Control-Allow-Origin": "*"
    };
    String url = APIUrls.login;
    var request = http.MultipartRequest('POST', Uri.parse(url));
    request.fields.addAll({'password': password, 'email': username});

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      Map<String, dynamic> data =
          json.decode(await response.stream.bytesToString());
      ''.back(context);
      if (data['success']) {
        currentUser.value = User.fromJson(data['data']);
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const MainScreen()),
            (route) => false);
      } else {
        ''.back(context);
        'تاكد من صحة البيانات المدخلة'.toSnakBar(context);
      }
    } else {
      ''.back(context);
      'تاكد من صحة البيانات المدخلة'.toSnakBar(context);
    }
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
