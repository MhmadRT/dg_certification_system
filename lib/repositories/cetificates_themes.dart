import 'dart:convert';
import 'dart:developer';
import 'package:dg_certification_system/model/categoryModel.dart';
import 'package:dg_certification_system/model/custom_error.dart';
import 'package:dg_certification_system/utils/api_servers.dart';
import 'package:http/http.dart' as http;

class AddCertThemesRepository {
  Future<dynamic> addCategory(
      String catTitle, int perentId, String icon) async {
    var body = {
      "cat_title": catTitle,
      "perent_id": "$perentId",
      "icon": icon
    };
    try {
      var response = await http.post(
        Uri.parse('${ApiSevers.phpServer}${ApiSevers.login}'),
        body: json.encode(body),
      );
      var catResponse = jsonDecode(response.body);
      return CustomError.fromJson(catResponse);
    } catch (err) {
      log(err.toString());
      return CustomError(
        error: true,
        errorMessage: "حدث خطأ يرجي المحاوله مره اخرى",
      );
    }
  }
  Future<dynamic> ListCategory(int perent_id) async {
    var url = Uri.https('training.jo-schools.com', '/api/getCateogry.php',
        {'perent_id': '$perent_id'});
    try {
      var response = await http.get(url, headers: {
        "Accept": "application/json",
        "Access-Control-Allow-Origin": "*"
      });
      var catResponse = jsonDecode(response.body);
      if (catResponse['error'] != null) {
        return CustomError.fromJson(catResponse);
      } else {
        List<dynamic> cats = catResponse['data'];
        List<CategoryModel> ordersList =
        cats.map((e) => CategoryModel.fromJson(e)).toList();
        return ordersList;
      }
    } catch (err) {
      log(err.toString());
      return CustomError(
        error: true,
        errorMessage: "حدث خطأ يرجي المحاوله مره اخرى",
      );
    }
  }
  Future<dynamic> deleteCategory(int cat_id) async {
    var url = Uri.https('training.jo-schools.com', '/api/getCateogry.php',
        {'perent_id': '$cat_id'});
    try {
      var response = await http.get(url, headers: {
        "Accept": "application/json",
        "Access-Control-Allow-Origin": "*"
      });
      var catResponse = jsonDecode(response.body);
      if (catResponse['error'] != null) {
        return CustomError.fromJson(catResponse);
      } else {
        List<dynamic> cats = catResponse['data'];
        List<CategoryModel> ordersList =
        cats.map((e) => CategoryModel.fromJson(e)).toList();
        return ordersList;
      }
    } catch (err) {
      log(err.toString());
      return CustomError(
        error: true,
        errorMessage: "حدث خطأ يرجي المحاوله مره اخرى",
      );
    }
  }
  Future<dynamic> editCategory(
      String cat_title, int perent_id, String icon) async {
    var url = Uri.https('training.jo-schools.com', '/api/getCateogry.php',
        {'perent_id': '$perent_id'});
    try {
      var response = await http.get(url, headers: {
        "Accept": "application/json",
        "Access-Control-Allow-Origin": "*"
      });
      var catResponse = jsonDecode(response.body);
      if (catResponse['error'] != null) {
        return CustomError.fromJson(catResponse);
      } else {
        List<dynamic> cats = catResponse['data'];
        List<CategoryModel> ordersList =
        cats.map((e) => CategoryModel.fromJson(e)).toList();
        return ordersList;
      }
    } catch (err) {
      log(err.toString());
      return CustomError(
        error: true,
        errorMessage: "حدث خطأ يرجي المحاوله مره اخرى",
      );
    }
  }
}