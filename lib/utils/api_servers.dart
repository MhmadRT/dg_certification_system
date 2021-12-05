import 'dart:developer';
import 'dart:io';
class ApiSevers {
  static String phpServer = 'https://training.jo-schools.com/api/';
  static String login = 'login.php';
  static String addCat = 'addCategory.php';
}
bool? connected;
bool valid = false;
String userType = '';
String langCode = 'ar';
Future<bool> checkInternetConnection() async {
  bool _isConnected = true;
  try {
    final response = await InternetAddress.lookup('training.jo-schools.com');
    if (response.isNotEmpty) {
        _isConnected = true;
    }
  } on SocketException catch (err) {
    log(err.message);
      _isConnected = false;
  }
  return _isConnected;
}
