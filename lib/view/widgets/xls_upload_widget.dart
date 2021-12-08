import 'dart:convert';
import 'dart:typed_data';
import 'package:csv/csv.dart';
import 'package:dg_certification_system/model/custom_error.dart';
import 'package:file_picker/file_picker.dart';
import 'package:http/http.dart' as http;

class xlsUpload {
  List<TraineeModel> list = [];
  List<dynamic> newList = [];
  int course_id;

  xlsUpload(this.course_id);

  pickFile() async {
    dynamic newText = '';
    FilePickerResult? result =
        await FilePicker.platform.pickFiles(allowMultiple: true);
    if (result != null) {
      Uint8List? uploadfile = result.files.single.bytes;
      var string = utf8.decode(uploadfile!);
      if (string.contains(';')) {
        string = string.replaceAll(';', ',');
      }
      List<List<dynamic>> csvTable = const CsvToListConverter().convert(string).toList();
      csvTable.forEach((element) {
        if (element.contains(';')) {
          newText = element.toString().replaceAll(';', ',').split(',');
        } else {
          newText = element;
        }
        String email = newText[0].toString();
        String full_name = newText[1].toString();
        String national_id = newText[2].toString();
        String mobile = newText[3].toString();
        var trainee = {
          'email': email,
          'mobile': mobile,
          'full_name': full_name,
          'national_id': national_id
        };
        var newData = jsonEncode(trainee);
        print(newData);
        newList.add(newData);
      });
      print(newList);
      var request = await http.post(
          Uri.parse("https://dash.korachat.com/api/storeTraineeCourse"),
          headers: {
            "Accept": "application/json",
            "Access-Control-Allow-Origin": "*",
            'Authorization':'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiI1IiwianRpIjoiYTJkMzhkMTRkMWQwZGI5Y2VjYzc4MjJhYzRjZmM5NjVhMTc1ODMxODUzODQ2OTg1ZDA2YzFkOTQ0Yjk3MjRjMmZjNDRjMWNiYjE5ODA3ZjMiLCJpYXQiOjE2Mzg4Njk1NTAuMDc1MjI5LCJuYmYiOjE2Mzg4Njk1NTAuMDc1MjM3LCJleHAiOjE2NzA0MDU1NTAuMDYxMDE5LCJzdWIiOiIxMDA0Iiwic2NvcGVzIjpbXX0.AUzmeParYPmc1Nh84Wd1UULMG0Ss13Pg05pxwZQlAU5FKfyzstT4AXcyz_wHWg_uZgDAxefbzDQGx3GetTZrpOvJq3WyDE_ISQLkORXrDwMGLQb0rfpSfSS3pxJSeWCpPSUM6mDkaHbNdupB3orUo75tyo7LIfdKBnl-HreW5nQISoc6zVHO274Y9xyeEno0TUldkI_CrOmsVm7CxNTFXslenYFYkc-vxYJhfBKhwUDM46Kdvn22iZnoRtoM9vrnV-Uhcwutx6Sarb6dhrSWJfjghSSv_Y_p0BkreuyEEwhJOYFyn5bW-_hqVnbrSqLCDjXxy1FFhm-pOvQ_Z9-whinHx71Ohr1lUecOWZgcnau5-Sma0l-n917V4_K3qV8gy_KDVqN7eBkIy4topLgZzWjb2z-aLCH6hTuwApA7uUV9fB8gtCNTfIWYF0_K1pkhtjjSHlb_Pzw9gsGTjL5gTIU6Nzfy6nfW-xhZgex_ScKmMC6_TtsvgZuEWGuqcFgMyj0OluDh2dJaQm-zZyLicthMrXJo_bXCcGQaK3rmWA6xQHoFXzz486ubFzm2mQevjx5V56Bz_qTAX3aZ_qYnYG5PDBZEBJwZBX7KCuGuMDM-CD9ybNglz9RxLo_hHQIVHcs3--KPVWu0-SVzrUNBIZaJBVTfjGAWtiydYYO4Zdo',
          },
          body: {
            'course_id': course_id,
            'data': newList.toString(),
          });
      if (request.statusCode == 200) {
        print('Successfully');
      }
    }
  }
}

class TraineeModel {
  String email;
  String full_name;
  String national_id;
  String mobile;

  TraineeModel(
      {required this.email,
      required this.full_name,
      required this.national_id,
      required this.mobile});
}
