import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:dg_certification_system/model/api_result.dart';
import 'package:http/http.dart' as http;

class APIRequest {
  final String url;
  var body;
  var header;
  final APIMethod? method;
  final File? img;

  APIRequest(this.url, this.body, this.header, this.method,{this.img});

  Future<ApiResult?> request() async {
    log('$url\n${jsonEncode(body)}\n$header');
    switch (method) {
      case APIMethod.GET:
        final response = await http.get(Uri.parse(url), headers: header);
        print('status code: ${response.statusCode} \n bodyGet: ${response.body}');
        if (response.statusCode == 200) {

          return apiResultFromJson(response.body);
        } else {

        }
        break;
      case APIMethod.POST:
        final response = await http.post(Uri.parse(url), headers: header, body: jsonEncode(body));
        print('url: $url');
        print('url: $body');
        print('status code: ${response.statusCode} \n bodyPost: ${response.body}');
        if (response.statusCode == 200) {

          if(response.body.startsWith('<')) {
            print('ok');
            var res={
              "success": false,
              "data": false,
              "message": 'false',
            };
            return ApiResult.fromJson(res);
          } else {

            return apiResultFromJson(response.body);
          }
        } else {
          print('status code: ${response.statusCode} \n body123: ${response.body}');
          return ApiResult(success: false);
        }
        break;
      case APIMethod.MULTI_PART:
        var request = http.MultipartRequest(
            'POST',
            Uri.parse(url));
        request.fields.addAll(body);
        img != null
            ? request.files
            .add(await http.MultipartFile.fromPath('file', '${img!.path}'))
            : print('no img');
        http.StreamedResponse response = await request.send();
        var res=await response.stream.bytesToString();
        print(res);
        print('url: $url');
        print('url: $body');
        if (response.statusCode == 200) {
          print('status code: ${response.statusCode} \n body321: $res');
          if(res.startsWith('<')) {
            var errorRes={
              "success": false,
              "data": false,
              "message": 'false',
            };
            return ApiResult.fromJson(errorRes);
          } else {

            return apiResultFromJson(res);
          }
        } else {
          print('status code: ${response.statusCode} \n body123: ${res}');
          return ApiResult(success: false);
        }

        break;
      default:
        return null;
    }
    return null;
  }

}

enum APIMethod { POST, GET, MULTI_PART }
