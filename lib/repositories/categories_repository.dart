import 'dart:convert';
import 'package:dg_certification_system/model/categoryModel.dart';
import 'package:dg_certification_system/model/custom_error.dart';
import 'package:http/http.dart' as http;

class CategoriesRepository {
  Future<dynamic> addCategory(String cat_title, int perent_id,String icon, http.MultipartFile image)
  async {
    var request = http.MultipartRequest('POST', Uri.parse('https://training.jo-schools.com/api/addCategory.php'));
    request.fields['cat_title'] = cat_title;
    request.fields['perent_id'] = perent_id.toString();
    request.files.add(await image);
    try {
      http.StreamedResponse response = await request.send();
     final dynamic categoryResponse = await response.stream.bytesToString();
      return CustomError.fromJson(categoryResponse);
    } catch (err) {
      throw err;
    }
  }
  Future<dynamic> listCategory(int parentId) async {
    var url =  Uri.https('training.jo-schools.com', '/api/getCateogry.php',{'perent_id': '$parentId'});
    try {
      var response = await http.get(
          url, headers: {
            "Accept": "application/json",
            "Access-Control-Allow-Origin": "*"
          }
      );
      var catResponse = jsonDecode(response.body);
      if(catResponse['error'] != null) {
        return CustomError.fromJson(catResponse);
      }
      else {
        List<dynamic>  cats = catResponse['data'];
        List<CategoryModel> ordersList = cats.map((e) => CategoryModel.fromJson(e)).toList();
        return ordersList;
      }
    } catch (err) {
      print(err);
      return CustomError(
        error: true,
        errorMessage: "حدث خطأ يرجي المحاوله مره اخرى",
      );
    }
  }
  Future<dynamic> deleteCategory(int cat_id) async {
    var url =  Uri.https('training.jo-schools.com', '/api/getCateogry.php',{'perent_id': '$cat_id'});
    try {
      var response = await http.get(
          url, headers: {
        "Accept": "application/json",
        "Access-Control-Allow-Origin": "*"
      }
      );
      var catResponse = jsonDecode(response.body);
      if(catResponse['error'] != null) {
        return CustomError.fromJson(catResponse);
      }
      else {
        List<dynamic>  cats = catResponse['data'];
        List<CategoryModel> OrdersList = cats.map((e) => CategoryModel.fromJson(e)).toList();
        return OrdersList;
      }
    } catch (err) {
      print(err);
      return CustomError(
        error: true,
        errorMessage: "حدث خطأ يرجي المحاوله مره اخرى",
      );
    }
  }
  Future<dynamic> editCategory(String cat_title,int perent_id,String icon) async {
    var url =  Uri.https('training.jo-schools.com', '/api/getCateogry.php',{'perent_id': '$perent_id'});
    try {
      var response = await http.get(
          url, headers: {
        "Accept": "application/json",
        "Access-Control-Allow-Origin": "*"
      }
      );
      var catResponse = jsonDecode(response.body);
      if(catResponse['error'] != null) {
        return CustomError.fromJson(catResponse);
      }
      else {
        List<dynamic>  cats = catResponse['data'];
        List<CategoryModel> OrdersList = cats.map((e) => CategoryModel.fromJson(e)).toList();
        return OrdersList;
      }
    } catch (err) {
      print(err);
      return CustomError(
        error: true,
        errorMessage: "حدث خطأ يرجي المحاوله مره اخرى",
      );
    }
  }
}