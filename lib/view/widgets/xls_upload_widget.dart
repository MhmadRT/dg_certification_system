import 'dart:convert';
import 'dart:typed_data';
import 'package:csv/csv.dart';
import 'package:dg_certification_system/model/custom_error.dart';
import 'package:file_picker/file_picker.dart';
import 'package:http/http.dart' as http;

class xlsUpload{
  List<TraineeModel> list = [];
  List<dynamic> newList = [];
  int course_id;
  xlsUpload(this.course_id);
  pickFile() async {
    dynamic newText = '';
    FilePickerResult? result = await FilePicker.platform.pickFiles(allowMultiple: true);
    if (result != null) {
      Uint8List? uploadfile = result.files.single.bytes;
      var string =utf8.decode(uploadfile!);
      if(string.contains(';'))
        string = string.replaceAll(';', ',');
      List<List<dynamic>> csvTable = CsvToListConverter().convert(string).toList();
      csvTable.forEach((element) {
        if(element.contains(';')){
          newText =  element.toString().replaceAll(';', ',').split(',') ;
        }
        else {
          newText = element;
        }
        String email = newText[0].toString();
        String full_name = newText[1].toString();
        String national_id = newText[2].toString();
        String mobile = newText[3].toString();
        var trainee ={'email': email, 'mobile': mobile, 'full_name': full_name, 'national_id': national_id};
        var newData = jsonEncode(trainee);
        newList.add(newData);
      });
      var request = http.MultipartRequest('POST', Uri.parse('https://training.jo-schools.com/api/uploadUsers.php'));
      request.fields['course_id'] = course_id.toString();
      request.fields['users'] = await newList.toString();
      try {
        http.StreamedResponse response = await request.send();
        final dynamic categoryResponse = await response.stream.bytesToString();
        return CustomError.fromJson(categoryResponse);
      } catch (err) {
        print(err);
      }
    }
  }
}
class TraineeModel {
  String email;
  String full_name;
  String national_id;
  String mobile;
  TraineeModel({
    required this.email,required this.full_name,required this.national_id,required this.mobile
  });
}