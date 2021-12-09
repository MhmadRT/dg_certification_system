import 'dart:convert';
import 'package:dg_certification_system/model/category_model.dart';
import 'package:dg_certification_system/model/custom_error.dart';
import 'package:dg_certification_system/model/trainee.dart';
import 'package:dg_certification_system/utils/api_servers.dart';
import 'package:http/http.dart' as http;
class TraineesRepository{
  Future<dynamic> addTrainee( name,mobile,email,nationalId,courseId) async {
    var request = http.MultipartRequest('POST', Uri.parse('https://training.jo-schools.com/api/addTrainee.php'));
    request.fields.addAll({
      'full_name': name,
      'email': email,
      'mobile': mobile,
      'national_id': nationalId,
      'course_id': courseId
    });


    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
    }
    else {
      print(response.reasonPhrase);
    }

  }
  Future<dynamic> ListTrainee(int course_id) async {
    var url = Uri.https('training.jo-schools.com', '/api/getCourseTrainees.php',
        {'course_id': '$course_id'});
    try {
      var response = await http.get(url, headers: {
        "Accept": "application/json",
        "Access-Control-Allow-Origin": "*"
      });
      var catResponse = jsonDecode(response.body);
      if (catResponse['error'] != null) {
        return CustomError.fromJson(catResponse);
      } else {
        Trainees trainees=traineesFromJson(response.body);
        return trainees;
      }
    } catch (err) {
      print(err);
      return CustomError(
        error: true,
        errorMessage: "حدث خطأ يرجي المحاوله مره اخرى",
      );
    }
  }
  Future<dynamic> deleteTrainee(int cat_id) async {
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
        List<CategoryData> OrdersList =
        List<CategoryData>.from(cats.map((x) => CategoryData.fromMap(x)));
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
  Future<dynamic> editTrainee(
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
        List<CategoryData> OrdersList =
        List<CategoryData>.from(cats.map((x) => CategoryData.fromMap(x)));
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
  Future<dynamic> restTrainee(
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
        List<CategoryData> OrdersList =
        List<CategoryData>.from(cats.map((x) => CategoryData.fromMap(x)));
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