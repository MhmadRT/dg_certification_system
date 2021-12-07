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
        success: json["success"],
        data: json["data"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "data": data == null ? null : jsonDecode(data).toString(),
        "message": message,
      };
}
