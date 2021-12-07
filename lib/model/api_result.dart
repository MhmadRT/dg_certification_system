// To parse this JSON data, do
//
//     final apiResult = apiResultFromJson(jsonString);

import 'dart:convert';

ApiResult apiResultFromJson(String str) {
  try {
    return ApiResult.fromJson(json.decode(str));
  } on Exception catch (e) {
    return ApiResult(success: false, data: null, message: e.toString());
  }
}

String apiResultToJson(ApiResult data) => json.encode(data.toJson());

class ApiResult {
  ApiResult({
    this.success,
    this.data,
    this.message,
  });

  bool? success;
  dynamic data;
  String? message;

  factory ApiResult.fromJson(Map<String, dynamic> json) => ApiResult(
        success: json["success"] == null ? null : json["success"],
        data: json["data"] == null ? null : json["data"],
        message: json["message"] == null ? null : json["message"],
      );

  Map<String, dynamic> toJson() => {
        "success": success == null ? null : success,
        "data": data == null ? null : jsonDecode(data).toString(),
        "message": message == null ? null : message,
      };
}
